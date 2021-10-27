function bdVpcDelete(elementoType, elementoId, varargin)
    global hrtConfig
    doc = hrtConfig.Process;
    select elementoType
        case 'Process'          // caso for process
            if type(elementoId) == 10 then          //Se for String
                for i=1:doc.root.children.size
                   xp = xmlXPath(doc.root.children(i), '//'+elementoId);
                   xmlRemove(xp);
                end                    
            else        
                for i=1:doc.root.children.size
                    xmlRemove(doc.root.children(i)...
                                      .children(elementoId+2));
                end
            end
        case 'Disp'   // caso for disp
            if type(elementoId) == 10 then          //Se for String
                xp = xmlXPath(doc, '//'+elementoId+'/'+varargin(1));
                xmlRemove(xp);
            else 
                if argn(2) > 2 then selectedProcess = varargin(1), else selectedProcess = hrtConfig.selectedProcess, end;
                for i=1:hrtConfig.Process.root.children.size
                    xmlRemove(doc.root.children(i)...
                                      .children(selectedProcess+2)...
                                      .children(elementoId));
                end
             end
        case 'var'  // caso for var
            if type(elementoId) == 10 then          //Se for String
                xp = xmlXPath(doc, '//'+elementoId);
            else
                elementoName = doc.root.children(elementoId).name;
                xp = xmlXPath(doc, '//'+elementoName);
            end
            xmlRemove(xp);
        else
            disp('bdVpcInsert - Opção não Encontrada!');
    end
endfunction
