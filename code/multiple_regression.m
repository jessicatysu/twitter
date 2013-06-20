function multiple_regression()
%Runs race regressions
%     prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/regression-voterinfo/';
%     one_regression('white_hispanic_black_asian_mixedVSfollowersmorethan100000.csv', prefix, 5);
%     one_regression('white_hispanic_black_asian_mixedVSfollowingmorethan10000.csv', prefix, 5);
%     one_regression('white_hispanic_black_asian_mixedVSfollowerslessthan100000.csv', prefix, 5);
%     one_regression('white_hispanic_black_asian_mixedVSfollowinglessthan10000.csv', prefix, 5);

    prefix = '/Users/jessica/Dropbox/work/2013/ps120/twitter/retweets/newdata/';
    one_regression('party-leadership-num_retweets.csv', prefix, 2);
end

function one_regression(file, prefix, numXvars)
    M = csvread(strcat(prefix, file));
    X = padarray(M(:, 1:numXvars), [0, 1], 1, 'pre');
    y = M(:, numXvars + 1);
    
    resultFile = strcat(prefix, 'results-', file);
    f = fopen(resultFile, 'w');
    if f == -1
        'Invalid file'
    end

    
    [b, bint, r, rint, stats] = regress(y, X);
    fprintf(f, 'coefficient vectors = \n');
    fprintf(f, '%d\n', b);
    fprintf(f, '\nR^2, F statistic and p value, error variance\n');
    fprintf(f, '%d %d %d %d', stats);
end