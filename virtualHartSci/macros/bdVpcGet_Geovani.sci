function ret = bdVpcGet(idVar, varargin)
    global hrtConfig
    doc = hrtConfig.Process
    select idVar
        case "size"
            ret = doc.root.children.size;
        case "processName"
            if argn(2) == 2 then
                ret = doc.root.children(1).children(varargin(1)).name;
            else
                disp("bdVpcGet - Numero de argumentos incorreto");
                exit();
            end
        case "processNames"
            ret = [];
            for i =3:doc.root.children(1).children.size
                ret = [ret doc.root.children(1).children(i).name];
            end
        case "selectedProcess"
            ret = hrtConfig.selectedProcess;        
        case "dispName"
            if argn(2) == 3 then
                ret = doc.root.children(1).children(varargin(1)).children(varargin(2)).name;
            else
                disp("bdVpcGet - Numero de argumentos incorreto");
                exit();
            end
        case "dispNames"
            ret = [];
            for i =1:doc.root.children(1).children(3).children.size
                ret = [ret doc.root.children(1).children(3).children(i).name];
            end
        case "selectedDisp"
            ret = hrtConfig.selectedDisp; 
        else //Caso não for as palavras reservadas anteriores então temos:
            if type(idVar) == 10 then //Se string: idVar = varName
                xp = xmlXPath(doc, '/root/'+idVar)(1);
            else//Se não string: idVar = indexVar
                xp = doc.root.children(idVar);//Identificador da Variável 
            end
            select argn(2)
                case 1 //Se não informar o que quer -> Fornece o valor da variável
                    typeName = 'value';
                    selectedProcess = hrtConfig.selectedProcess;
                    selectedDisp = hrtConfig.selectedDisp;
                case 2
                    typeName = varargin(1);
                    selectedProcess = hrtConfig.selectedProcess;
                    selectedDisp = hrtConfig.selectedDisp;
                case 4
                    typeName = varargin(1);
                    selectedProcess = varargin(2);
                    selectedDisp = varargin(3);
                else
                    disp("bdVpcGet - Numero de argumentos incorreto");
                    exit();
            end
            select typeName
            case 'value'//Processo Selecionado
                    ret = xp.children(selectedProcess+2)...
                            .children(selectedDisp).content//Dispositivo Selecionado
                case 'type'//Tipo da variável
                    ret = xp.children(2).content
                case 'nbytes'//Tamanho em Bytes da variável
                    ret = xp.children(1).content
                case 'name'//Nome da variável
                    ret = xp.name
                else
                    disp("bdVpcGet - Informação inexistente");
                    exit();
            end
    end
endfunction
