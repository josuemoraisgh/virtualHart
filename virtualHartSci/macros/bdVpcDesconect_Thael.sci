function bdVpcDesconect()
    global %VirtualProcessCommPath hrtConfig
    path = getlongpathname(%VirtualProcessCommPath)+'xml';
    xmlWrite(hrtConfig.Process,path+filesep()+"hrtProcess"+".xml");
    clearglobal hrtConfig
endfunction
