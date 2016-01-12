function [pla,V] = train_dv_vectors2(list)

fid = fopen(list, 'rt');
C = textscan(fid, '%s');
C = C{1};
fclose(fid);
dev_ivs = load('devivs');
dev_ivs = dev_ivs.dev_ivs;
%fid = fopen('vectorlist','w');
% dev_ivs = zeros(200, length(C));
% parpool(4);
% l = length(C);
% parfor file = 1 : l,
%      P = strsplit(char(C(file)),'\\');
%      l = length(P);
%      s = strcat('vectors\',char(P(l)));
%      name = C(file);
%      dev_ivs(:,file) = extract_ivector(char(name), 'ubm', 'T',s);
%      %fprintf(fid,'%s\n',s); 
%      disp(file); 
% end
% for file = 1 : length(C),
%      P = strsplit(char(C(file)),'\\');
%      l = length(P);
%      s = strcat('vectors\',char(P(l)));
%      name = C(file);
%      dev_ivs(:,file) = extract_ivector(char(name), 'ubm', 'T',s);
%      %fprintf(fid,'%s\n',s); 
%      disp(file);
% end

labels = write_labels('vectorlist');
V = lda(dev_ivs, labels);
niter = 20;
lda_dim = 200;
nphi    = lda_dim;
dev_ivs = V(:, 1 : lda_dim)' * dev_ivs;
pla = gplda_em(dev_ivs, labels, nphi, niter);





%fclose(fid);