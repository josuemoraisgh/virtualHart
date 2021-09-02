function bdVpcConect()
    global %VirtualProcessCommPath hrtConfig
    path = getlongpathname(%VirtualProcessCommPath)+'xml';
    hrtConfig.Process = xmlRead(path+filesep()+"hrtProcess"+".xml");
    hrtConfig.Enum = xmlRead(path+filesep()+"hrtEnum"+".xml");
    hrtConfig.selectedProcess = 1;
    hrtConfig.selectedDisp = 1;
endfunction
