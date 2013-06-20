function ttests()
%Performs t-tests.
    prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/retweets/newdata/';
%    onetest('num_retweets-Democrats.csv', 'num_retweets-Republicans.csv', prefix);
    onetest('frac_retweets-Democrats.csv', 'frac_retweets-Republicans.csv', prefix);
%     prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/nonTwitterUsers/';
%     onetest('ttest-nonTwitterUsers-age.csv', 'ttest-twitterUsers-age.csv', prefix);
%     onetest('ttest-nonTwitterUsers-party.csv', 'ttest-twitterUsers-party-noIndependents.csv', prefix);
%     onetest('ttest-nonTwitterUsers-status.csv', 'ttest-twitterUsers-status.csv', prefix);
%     
%     prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/urban-rural/';
%     onetest('ttest-rural-numfollowers.csv', 'ttest-urban-numfollowers.csv', prefix);
%     onetest('ttest-rural-numfollowing.csv', 'ttest-urban-numfollowing.csv', prefix);
%     onetest('ttest-rural-tweetspermonth.csv', 'ttest-urban-tweetspermonth.csv', prefix);
%     
%     prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/leaders/';
%     onetest('ttest-leaders-age.csv', 'ttest-nonLeaders-age.csv', prefix);
%     onetest('ttest-leaders-numfollowers.csv', 'ttest-nonLeaders-numfollowers.csv', prefix);
%     onetest('ttest-leaders-numfollowing.csv', 'ttest-nonLeaders-numfollowing.csv', prefix);
%     onetest('ttest-leaders-tweetspermonth.csv', 'ttest-nonLeaders-tweetspermonth.csv', prefix);

end

% Performs one set of t-tests and outputs the result to a file.
function onetest(file1, file2, prefix)
    sample1 = csvread(strcat(prefix, file1));
    sample2 = csvread(strcat(prefix, file2));
    [h, p] = ttest2(sample1, sample2);
    resultFile = strcat(prefix, 'results-', file1, '-', file2);
    f = fopen(resultFile, 'w');
    if f == -1
        'Invalid file'
    end
    if h == 0
        fprintf(f, 'Failure to reject, p = %f\n', p);
    else
        fprintf(f, 'Rejected null hypothesis, p = %f\n', p);
        file1
        file2
        p
    end
    fclose(f);
end