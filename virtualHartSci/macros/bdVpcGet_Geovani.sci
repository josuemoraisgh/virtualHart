function ret = bdVpcGet(var, varargin)
    global hrtConfig
    select var
        case "size"
            ret = size(hrtConfig.Process.root.children)(2);
        case "processName"
            ret = [];
            for i =3:size(hrtConfig.Process.root.children(1).children)(2)
                ret = [ret hrtConfig.Process.root.children(1).children(i).name];
            end
        case "selectedProcess"
            ret = hrtConfig.selectedProcess;        
        case "dispName"
            ret = [];
            for i =1:size(hrtConfig.Process.root.children(1).children(3).children)(2)
                ret = [ret hrtConfig.Process.root.children(1).children(3).children(i).name];
            end
        case "selectedDisp"
            ret = hrtConfig.selectedDisp; 
        else
            if(argn(2) == 1)//Se não informar o que quer ele fornece o valor da variavel
                ret = hrtConfig.Process.root.children(var)...//Identificador da Variavel 
                                            .children(hrtConfig.selectedProcess+2)...//Processo Selecionado
                                            .children(hrtConfig.selectedDisp).content//Dispositivo Selecionado
            else // Se ele informar
                select varargin(1)
                    case 'value'
                        ret = hrtConfig.Process.root.children(var)...//Identificador da Variavel 
                                            .children(hrtConfig.selectedProcess+2)...//Processo Selecionado
                                            .children(hrtConfig.selectedDisp).content//Dispositivo Selecionado
                    case 'type'
                        ret = hrtConfig.Process.root.children(var)...//Identificador da Variavel 
                                            .children(2).content//Tipo de Dados
                    case 'nbytes'
                        ret = hrtConfig.Process.root.children(var)...//Identificador da Variavel 
                                            .children(1).content//Tamanho em Bytes dos dados
                    case 'name'                                            
                        ret = hrtConfig.Process.root.children(var).name
                    else
                        disp("O banco de dados não possui essa informação");
                        exit();
                end
            end
    end
endfunction
