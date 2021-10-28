function vpcBDelete()
    rep = x_mdialog(['Insira o Processo a ser deletado'],...
                 ['Processo' ],['processo1'])
 
 

    bdVpcDelete('Process', elementoId)
endfunction
