function ret = xlsOpen(nomearq)
    if xls_IsExcelRunning() == %f then
        xls_NewExcel();
    else
        xls_RecoverExcel();
    end
    xls_setProperty("Application", "Visible", 0);     
    ret = xls_Open(nomearq);
endfunction

function worksheet = findWorksheet()
    c = xls_getProperty("Application", "Worksheets", "Count");
    worksheet = emptystr(c, 1);
    for i=1:c
        xls_callMethod("Application", "Worksheets", list(i));
        xls_callMethod("Worksheet", "Activate");
        worksheet(i) = xls_getProperty("Worksheet", "Name");
    end
endfunction

function retorno = getDados(Worksheet,linha,coluna)
    xls_callMethod("Workbook", "Worksheets", list(Worksheet));
    xls_callMethod("worksheet", "Cells", list(linha,coluna));
    retorno = xls_getProperty("Cell", "Value");   
endfunction

function setDados(dados,Worksheet,linha,coluna)
    xls_callMethod("Workbook", "Worksheets", list(Worksheet));
    xls_callMethod("worksheet", "Cells", list(linha,coluna));
    xls_setProperty("Cell", "Value", dados);
endfunction

function [totalLinha, totalColuna] = xlsRegiaoDados(Worksheet,linhaIni)
    xls_callMethod("Workbook", "Worksheets", list(Worksheet))
    for totalLinha = linhaIni:65536
        xls_callMethod("worksheet", "Cells", list(totalLinha,1));
        if isempty(xls_getProperty("Cell", "Value"))
            break;
        end
    end
    totalLinha = totalLinha-1;    
    for totalColuna = 1:65536
        xls_callMethod("worksheet", "Cells", list(1,totalColuna));
        if isempty(xls_getProperty("Cell", "Value"))
            break;
        end
    end
    totalColuna = totalColuna-1;
endfunction

function configTrans2Xml()
  path = get_absolute_file_path('configTrans2Xml.sce');
  ret = xlsOpen(path+filesep()+"confTransmissor"+".xls");
  if ret == %f then    
      disp("Não foi possivel abrir o Arquivo!!")
  else
    doc = xmlDocument(path+filesep()+"confTransmissor"+".xml");
    worksheet = findWorksheet();
    root = xmlElement(doc, worksheet(1));
    linhaIni=1;
    [totalLinha, totalColuna] = xlsRegiaoDados(worksheet(1),linhaIni)
    if totalLinha > 0 then
        for j=1:totalLinha
            if totalColuna > 0 then
                aux = getDados(worksheet(1),linhaIni+j,1);
                if aux <> [] then
                    root.children(j) = xmlElement(doc,strsubst(aux," ",""));
                    for i=2:totalColuna
                        aux = getDados(worksheet(1),1,i);
                        aux1 = getDados(worksheet(1),linhaIni+j,i);                            
                        if aux1 == [] then
                            aux1 = ""
                        elseif strindex(string(aux1),'/\$/','r')(1) <> 1
                            aux1 = strsubst(string(aux1),'/ \([\s\S]+\)/','','r');
                        else
                            aux1 = string(aux1);
                        end
                        if aux <> [] then
                            root.children(j).children(i-1) = xmlElement(doc,strsubst(aux," ",""));
                            root.children(j).children(i-1).content = aux1;
                        end
                    end                    
                end
            end
        end
    end
    xls_Close();// close Workbook
    xls_Quit(); // quit excel
    doc.root = root;
    xmlWrite(doc, path+filesep()+"confTransmissor"+".xml");
  end
endfunction


configTrans2Xml();
