function bdVpcDelete(elementoType, elementoId, varargin)
    global hrtConfig
    doc = hrtConfig.Process;
    select elementoType
        case 'Process'
            if type(elementoId) == 10 then //Se string: elementoId=processName
                xp = xmlXPath(doc,'child::*/child::'+elementoId);
                xmlRemove(xp);
            else        
                for i=1:doc.root.children.size
                    xmlRemove(doc.root.children(i)...
                                      .children(elementoId+2));
                end
            end
        case 'Disp'
            if type(elementoId) == 10 then //Se string: elementoId=processName e varargin(1)=dispName
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
        case 'var'
            if type(elementoId) == 10 then //Se string: elementoId=varName
                xp = xmlXPath(doc, '/root/'+elementoId);
            else
                elementoName = doc.root.children(elementoId).name;
                xp = xmlXPath(doc, '/root/'+elementoName);
            end
            xmlRemove(xp);
        else
            disp('bdVpcInsert - Opção não Encontrada!!');
    end
endfunction
