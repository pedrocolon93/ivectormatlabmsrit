function T = train_T2(fileList)

files = textread(fileList, '%s', 'delimiter', '\n');
fid = fopen('statlist3','w');

for i=1:1:length(files)-1 
    C = strsplit(char(files(i)),'\\');
    l = length(C);
    D = strsplit(char(C(l)),'\.');

    s = strcat('stats\',char(D(1)),char(D(2)));
    
    [n F] = compute_bw_stats(char(files(i)),'ubm',s);
    fprintf(fid,'%s\n',s); 
end

tvDim = 200;
niter = 100;
T = train_tv_space('statlist3', 'ubm', tvDim, niter, 8 ,'T');
