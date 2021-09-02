function bdVpcSet(id, value, varargin)
    global hrtConfig
    if argn==2 then 
        hrtConfig.Process.root.children(id)...
                              .children(hrtConfig.selectedProcess+2)...
                              .children(hrtConfig.selectedDisp).content = value;
    else
        if argn==4 then
            hrtConfig.Process.root.children(id)...
                                  .children(varargin(1)+2)...
                                  .children(varargin(2)).content = value;
        else
            disp("Valor não foi Salvo!! Quantidade de argumentos insuficiente.")
        end
    end
endfunction
