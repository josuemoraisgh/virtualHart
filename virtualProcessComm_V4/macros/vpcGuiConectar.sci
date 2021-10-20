'Alteração: utilizar função reativa
function vpcGuiConectar()
    process_name = x_dialog('Informe nome do processo','')
    if strcmp(process_name,'') == 1  then
        bdVpcConect();
        bdVpcInsert('Process', process_name, '');
        bdVpcDesconect();    
        disp('Adicionando: ' + string(process_name))         
    else
        disp('Erro')  
    end    
    set('BConectar','Enable','off');
    set('BDesconectar','Enable','on');
    set('porta','Enable','off');
    set('baudRate','Enable','off');
    set('dataBits','Enable','off');
    set('paridade','Enable','off');
    set('stopBits','Enable','off');
    vpcGuiAquisicao(uint8(strtod(bdVpcGet('porta'))),...
                 bdVpcGet('baudRate'),...
                 bdVpcGet('dataBits'),...
                 bdVpcGet('paridade'),...
                 bdVpcGet('stopBits'));
endfunction
