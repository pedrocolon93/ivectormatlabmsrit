function model = enroll( list,V,pla,singleormultiple )
    mfc = [];
    if singleormultiple=='y'
        files = textread(list, '%s', 'delimiter', '\n');
        for i=1:1:length(files)-1
            C = strsplit(char(files(i)),'\\');
            l = length(C);
            v = char(files(i));
            [y,Fs] = wavread(v);
            mfc = horzcat(mfc,featureExtract(y,Fs));
            fprintf('Finished file :%d\n',i);
        end
    else
        [y,Fs] = wavread(list);
        mfc = featureExtract(y(:,1),Fs);
    end
    [N, F] = compute_bw_stats(mfc,'ubm');
    model = extract_ivector([N; F], 'ubm', 'T');
    model = V(:, 1 : 200)' * model;
end

