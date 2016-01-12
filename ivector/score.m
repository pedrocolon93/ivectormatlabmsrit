function lscore = score(model,target,V,pla,multiple)
    %Target is target file that we wish to identify
    %model is the models we are identifying it with
    
    lscore = []
    
    [y,Fs] = wavread(target);
    mfc = featureExtract(y(:,1),Fs);
    [N, F] = compute_bw_stats(mfc,'ubm');
    vector = extract_ivector([N; F], 'ubm', 'T');
    vector = V(:, 1 : 200)' * vector;
    
    if multiple == 'y'
        models = textread('modellist', '%s', 'delimiter', '\n');
        for i=1:1:length(models)
            C = strsplit(char(models(i)),'\\');
            l = length(C);
            v = char(models(i));

            model = load(v,'-mat');
            model = model.model;
            tscore = cosscore(vector,model);
            modelscorepair = {};
            modelscorepair{1,1}=v;
            modelscorepair{2,1}=tscore;
            lscore = horzcat(lscore,modelscorepair);

            fprintf('Finished model :%d\n',i);
        end
    else
        lscore = score_gplda_trials(pla, model, vector);
    end
    
end

