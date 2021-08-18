function xlsOpen(nomearq)
    if xls_IsExcelRunning() == %f then
        xls_NewExcel();
    else
        xls_RecoverExcel();
    end
    xls_Open(nomearq);
    xls_setProperty("Application", "Visible", 0); 
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
        xls_callMethod("worksheet", "Cells", list(totalLinha,totalColuna));
        if isempty(xls_getProperty("Cell", "Value"))
            break;
        end
    end
    totalColuna = totalColuna-1;
endfunction

function geraEnumeratedXml()
  linhaIni=3;
  nomearq = uigetfile("*.xls",pwd());//Abre no diretorio corrente um gestor de arquivos 
  if isempty(nomearq) then    
      disp("Ação cancelada pelo usuário!!")
  else
    [path,fname,extension]=fileparts(nomearq);
    doc = xmlDocument(path+filesep()+fname+".xml");
    root = xmlElement(doc, "root");
    xlsOpen(nomearq);
    worksheet = findWorksheet();
    for i=1:size(worksheet,1)
        root.children(i) = xmlElement(doc,worksheet(i));
        root.children(i).attributes.desc = getDados(worksheet(i),1,1);
        [totalLinha, totalColuna] = xlsRegiaoDados(worksheet(i),linhaIni)
        if totalLinha > 0 then
            for j=1:totalLinha
                try
                aux = getDados(worksheet(i),linhaIni+j,1);
                if aux <> [] then
                    root.children(i).children(j) = xmlElement(doc,"n_" + string(aux));
                end
                aux = getDados(worksheet(i),linhaIni+j,2);
                if aux <> [] then
                    root.children(i).children(j).content = string(aux);
                end
            catch
                pause;
                end
                
            end
        end
    end
    xls_Close();// close Workbook
    xls_Quit(); // quit excel
    doc.root = root;
    xmlWrite(doc, path+filesep()+fname+".xml");
  end
endfunction


geraEnumeratedXml();
