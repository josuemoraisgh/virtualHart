function bdVpcSet(idVar, value, varargin)
    global hrtConfig
    doc = hrtConfig.Process
    select idVar
        case "processName"
            if argn(2) == 3 then
                doc.root.children(1).children(varargin(1)).name = value;
            else
                disp("bdVpcGet - Numero de argumentos incorreto");
                exit();
            end
        case "selectedProcess"
            hrtConfig.selectedProcess = value;        
        case "dispName"
            if argn(2) == 4 then
                doc.root.children(1).children(varargin(1)).children(varargin(2)).name = value;
            else
                disp("bdVpcGet - Numero de argumentos incorreto");
                exit();
            end
        case "selectedDisp"
            hrtConfig.selectedDisp = value; 
        else///Caso não for as palavras reservadas anteriores então temos:
            if type(idVar) == 10 then //Se string: idVar = varName
                xp = xmlXPath(doc, '/root/'+idVar)(1);
            else//Se não string: idVar = indexVar
                xp = doc.root.children(idVar);//Identificador da Variável 
            end
            select argn(2)
                case 2 //Se não informar o que quer -> Fornece o valor da variável
                    typeName = 'value';
                    selectedProcess = hrtConfig.selectedProcess;
                    selectedDisp = hrtConfig.selectedDisp;
                case 3
                    typeName = varargin(1);
                    selectedProcess = hrtConfig.selectedProcess;
                    selectedDisp = hrtConfig.selectedDisp;
                case 5
                    typeName = varargin(1);
                    selectedProcess = varargin(2);
                    selectedDisp = varargin(3);
                else
                    disp("bdVpcGet - Numero de argumentos incorreto");
                    exit();
            end
            select typeName
                case 'value'//valor da variável selecionada
                    xp.children(selectedProcess+2)...//Processo Selecionado
                      .children(selectedDisp).content = value;
                case 'type'//Tipo da Variável
                    xp.children(2).content = value;
                case 'nbytes'//Tamanho em Bytes da Variável
                    xp.children(1).content = value;
                case 'name'//Nome da Variável 
                    xp.name = value;
                else
                    disp("bdVpcGet - Informação inexistente");
                    exit();
            end
    end
endfunction
