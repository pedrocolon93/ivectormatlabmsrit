%clear;
%ubm_train2('trainorig.txt',200,64,10,1,8,'ubm')
%ubm_train3('train.txt',200,64,100,1,8,'ubm')
%train_T('tlist');
%train_T2('tlist3');
%[pla, V] = train_dv_vectors('statlist');
[pla, V] = train_dv_vectors2('statlist3');

%Write the model list and the files to train the models
fid = fopen('out.txt', 'rt');
C = textscan(fid, '%s');
C = C{1};
fclose(fid);
% fid2 = fopen('modellist','w');
% for file = 1 : length(C),
%      P = strsplit(char(C(file)),'\\');
%      l = length(P);
%      fprintf(fid2,'%s.mod\n',P{1});
%      s = strcat('TestingData\Data\',char(P(l)),'\wav\');
%      files = dir(s);
%      fid = fopen(P{1},'w');
% 
%      for f =3 : length(files)
%          fnames = char(files.name);
%          t = strcat(s,fnames(f,:));
%          fprintf(fid,'%s\n',t); 
%      end
%      fclose(fid);
%      
% end
% fclose(fid2);
% %Enroll all the models
% modelcell = {length(C)}
% for file = 1 : length(C),
%     disp('Enrolling file #');
%     disp(file);
%     P = strsplit(char(C(file)),'\\');
%     l = length(P);
%     s = strcat('TestingData\Data\',char(P(l)),'\wav\');
%     model = enroll(P{1},V,pla,'y');
%     modelcell{file} = model;
%     savename = strcat('models\',P{1},'.mod');
%     save(savename,'model');
% end
% model = enroll('TestingData\Enrolling\Pedro\Enrolling.wav',V,pla,'n');
% save('models\pedro.mod','model');
% %Now score each against each other
% scorecell = {length(C)};
% for file = 1 : length(C),
%      disp('Scoring file #');
%      disp(file);
%      
%       P = strsplit(char(C(file)),'\\');
%       l = length(P);
%       s = strcat('TestingData\Data\',char(P(l)));
%       
%      files = dir(s);
%      for f =3 : length(files)
%          fnames = char(files.name);
%          tst = fnames(f,:);
%          k = strfind(fnames(f,:),'.wav')
%          if length(k)~=0
%              floc = strcat(s,'\',fnames(f,:));
%              score1 = score(model,floc,V,pla,'y');
%              scorecell{file}=score1;
%          end
%     end
% end




% model = enroll('TestingData\Enrolling\Pedro\Enrolling.wav',V,pla,'n');
% save('models\pedro.mod','model');
% model2 = enroll('TestingData\Scoring\Pedro\Scoring.wav',V,pla,'n');
% scr = {};
% scr{1} = 'Pedro'
% scorecell{file+1} = 
%   model = enroll('TestingData\Enrolling\Pedro\Enrolling.wav',V,pla,'n');
%   save('models\pedro.mod','model');
%   tmodel = enroll('TestingData\D2\frm01\frm01_f02_solo.wav',V,pla,'n');
%   r1 = cosscore(model,tmodel);
%   
%   model = enroll('TestingData\D2\frf01\frf01_f01_solo.wav',V,pla,'n');
%   save('models\frf01.mod','model');
%   r2 = cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\frf02\frf02_f01_solo.wav',V,pla,'n');
%  save('models\frf02.mod','model');
% r3=cosscore(model,tmodel);
%   model = enroll('TestingData\D2\frf03\frf03_f01_solo.wav',V,pla,'n');
%  save('models\frf03.mod','model');
% r4=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\frf04\frf04_f01_solo.wav',V,pla,'n');
%  save('models\frf04.mod','model');
% r5=cosscore(model,tmodel);
%  
%  model = enroll('TestingData\D2\frm01\frm01_f01_solo.wav',V,pla,'n');
%  save('models\frm01.mod','model');
% r6=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\frm02\frm02_f01_solo.wav',V,pla,'n');
%  save('models\frm02.mod','model');
% r7=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\frm03\frm03_f01_solo.wav',V,pla,'n');
%  save('models\frm03.mod','model');
% r8=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\frm04\frm04_f01_solo.wav',V,pla,'n');
%  save('models\frm04.mod','model');
% r9=cosscore(model,tmodel);
% 
%  
%  model = enroll('TestingData\D2\irf01\irf01_f01_solo.wav',V,pla,'n');
%  save('models\irf01.mod','model');
% r10=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf02\irf02_f01_solo.wav',V,pla,'n');
%  save('models\irf02.mod','model');  
% r11=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf03\irf03_f01_solo.wav',V,pla,'n');
%  save('models\irf03.mod','model'); 
% r12=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf04\irf04_f01_solo.wav',V,pla,'n');
%  save('models\irf04.mod','model'); 
% r13=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf05\irf05_f01_solo.wav',V,pla,'n');
%  save('models\irf05.mod','model'); 
% r14=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf06\irf06_f01_solo.wav',V,pla,'n');
%  save('models\irf06.mod','model'); 
% r15=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf07\irf07_f01_solo.wav',V,pla,'n');
%  save('models\irf07.mod','model'); 
% r16=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf08\irf08_f01_solo.wav',V,pla,'n');
%  save('models\irf08.mod','model');
% r17=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf09\irf09_f01_solo.wav',V,pla,'n');
%  save('models\irf09.mod','model'); 
% r18=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf10\irf10_f01_solo.wav',V,pla,'n');
%  save('models\irf10.mod','model'); 
% r19=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf11\irf11_f01_solo.wav',V,pla,'n');
%  save('models\irf11.mod','model'); 
% r20=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irf12\irf12_f01_solo.wav',V,pla,'n');
%  save('models\irf12.mod','model');
%  r21=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm01\irm01_f01_solo.wav',V,pla,'n');
%  save('models\irm01.mod','model');
% r22=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm02\irm02_f01_solo.wav',V,pla,'n');
%  save('models\irm02.mod','model');  
% r23=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm03\irm03_f01_solo.wav',V,pla,'n');
%  save('models\irm03.mod','model'); 
% r24=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm04\irm04_f01_solo.wav',V,pla,'n');
%  save('models\irm04.mod','model'); 
% r25=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm05\irm05_f01_solo.wav',V,pla,'n');
%  save('models\irm05.mod','model'); 
% r26=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm06\irm06_f01_solo.wav',V,pla,'n');
%  save('models\irm06.mod','model'); 
% r27=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm07\irm07_f01_solo.wav',V,pla,'n');
%  save('models\irm07.mod','model'); 
% r28=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm08\irm08_f01_solo.wav',V,pla,'n');
%  save('models\irm08.mod','model');
% r29=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm09\irm09_f01_solo.wav',V,pla,'n');
%  save('models\irm09.mod','model');
% r30=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm10\irm10_f01_solo.wav',V,pla,'n');
%  save('models\irm10.mod','model'); 
% 
% r31=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm11\irm11_f01_solo.wav',V,pla,'n');
%  save('models\irm11.mod','model'); 
% 
% r32=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm12\irm12_f01_solo.wav',V,pla,'n');
%  save('models\irm12.mod','model');
% 
% r33=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm13\irm13_f01_solo.wav',V,pla,'n');
%  save('models\irm13.mod','model'); 
% 
% r34=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm14\irm14_f01_solo.wav',V,pla,'n');
%  save('models\irm14.mod','model'); 
% 
% r35=cosscore(model,tmodel);
% 
% 
%  model = enroll('TestingData\D2\irm15\irm15_f01_solo.wav',V,pla,'n');
%  save('models\irm15.mod','model');
% 
% r36=cosscore(model,tmodel);
% 
%  model = enroll('TestingData\D2\irm16\irm16_f01_solo.wav',V,pla,'n');
%  save('models\irm16.mod','model'); 
% r37=cosscore(model,tmodel);
% 
% 
% tmodel = enroll('TestingData\Scoring\Pedro\Scoring.wav',V,pla,'n');
% scorelist=[]
% 
%  score1 = score(model,'TestingData\Scoring\Pedro\Scoring.wav',V,pla,'y');
%  score1 = transpose(score1)
%  score1 = sortrows(score1,2);
%  
% scorecell{1}=score1;
% 
%  score1 = score(model,'TestingData\D2\irm16\irm16_f02_solo.wav',V,pla,'y');
% score1 = transpose(score1)
%  score1 = sortrows(score1,2);
%  
% scorecell{2}=score1;
% 
% score1 = score(model,'TestingData\D2\irm13\irm13_f02_solo.wav',V,pla,'y');
% score1 = transpose(score1)
%  score1 = sortrows(score1,2);
%  
% scorecell{3}=score1;
% 
% score1 = score(model,'TestingData\D2\frf04\frf04_f02_solo.wav',V,pla,'y');
% score1 = transpose(score1)
%  score1 = sortrows(score1,2);
%  
% scorecell{4}=score1;
% 
% score1 = score(model,'TestingData\D2\frm04\frm04_f02_solo.wav',V,pla,'y');
% score1 = transpose(score1)
%  score1 = sortrows(score1,2);
%  
% scorecell{5}=score1;
% 
% 
% 
%scorecell = transpose(scorecell);
for i = 1:1:length(scorecell)
    score1 = scorecell{i};
    score1 = transpose(score1);
    score1 = sortrows(score1,2);
    score1 = transpose(score1);
    scorecell{i}=score1;
end
% 
disp('done');
