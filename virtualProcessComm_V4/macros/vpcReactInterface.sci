function varargout = vpcReactInterface(varargin)
    select get(varargin(1),'Style')
        case 'popupmenu' then
            isUi = %T 
            typeProp = 'Value';
        case 'edit' then
            isUi = %T 
            typeProp = 'String';
        else
            isUi = %F;
            typeProp = 'String';
    end
    select argn(2)
        case 1 then
            if argn(1) == 1 then
                varargout = list(vpcBDReadTranslated(varargin(1)));//LÊ NO BD (idVar)
            elseif isUi then//Escrita informada pelo Callback
                vpcBDWriteTranslated(varargin(1),get(varargin(1),typeProp));//ADICIONA NO BANCO DE DADOS (idVar, trmsData)
            end
        case 2 then//Escrita feita Direta
            vpcBDWriteTranslated(varargin(1),varargin(2));
            if isUi then set(varargin(1),typeProp,varargin(2)) end;//ATUALIZA TELA (graphic handle, character string / name of the property to set, value to give to the property)
        case 3 then//Escrita indireta
            if type(varargin(3)) == 10 then
                vpcReactInterface(varargin(1),get(varargin(1),typeProp));
                scf(get(varargin(3),'figure_id'));
                ui = gcf();
            else
                ui = varargin(3);
                if isUi || varargin(1)=='image' then 
                    if typeProp == 'Value' then
                        set(varargin(1),'String',string(bdVpcGet(bdVpcGet(varargin(1),'type'),'all','desc')));
                        set(varargin(1),typeProp,vpcBDReadTranslated(varargin(1)));
                    else
                        set(varargin(1),typeProp,string(vpcBDReadTranslated(varargin(1))));
                    end
                end
            end 
            for i=1:size(ui.children,1)
                tag = ui.children(i).tag;
                vpcReactInterface(tag,'ui',ui.children(i));
            end
        else
            disp('vpcReactInterface - Erro');
            exit();
    end
endfunction
