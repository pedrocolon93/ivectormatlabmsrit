function ubm = ubm_train3(list,featNum,nmix,iter,ds_factor,nWorkers,filename)

users = textread(list, '%s', 'delimiter', '\n');
for i=1:1:length(users)-1    
    C = strsplit(char(users(i)),'\\');
    l = length(C);
    s = strcat('ubm_large_data\',char(C(l)));
    v = strcat('ubm_large_training_files\',char(users(i)),'\wav\');
    files = dir (v);
    namearr = char(files.name);
    for j=4:1:length(namearr)-1
        fname = namearr(j,:);
        filepath = strcat(v,fname);
        [y,Fs] = wavread(filepath);
        mfc = featureExtract(y,Fs);
        mfc = mfc';
        cs = length(mfc);
        y = 1;
        ubmdata = strcat(s,fname);
        writehtk(ubmdata,mfc,0.25,6);
        fprintf('Finished file :%d: %s\n',i,s);        
    end
end   
gmm_em('tlist3',nmix,iter, ds_factor, nWorkers,'ubm');


