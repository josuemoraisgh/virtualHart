
function bdVpcInsert(elementoType, elementoName, varargin)
    global hrtConfig
    doc = hrtConfig.Process;
    select elementoType
        case 'Process'
            sizeProcess = doc.root.children(1).children.size;
            for i=1:doc.root.children.size //size varbd
                doc.root.children(i)...
                        .children(sizeProcess+1) = xmlElement(doc,elementoName)
            end
        case 'Disp'
            if argn(2) > 2 then selectedProcess = varargin(1), else selectedProcess = hrtConfig.selectedProcess, end;
            sizeDisp = doc.root.children(1).children(selectedProcess).children.size;            
            for i=1:doc.root.children.size //size var
                doc.root.children(i)...
                        .children(selectedProcess+2)...
                        .children(sizeDisp+1) = xmlElement(doc,elementoName)
            end
        case 'var'
            sizeVar = doc.root.children.size;
            doc.root.children(sizeVar+1) = xmlElement(doc,elementoName);
            for i=1:doc.root.children(1).children.size //size var
                name = doc.root.children(1).children(i).name;
                doc.root.children(sizeVar+1).children(i) = xmlElement(doc,name)
            end
        else
            disp('bdVpcInsert - Opção não Encontrada!!');
    end
endfunction
