% Performs logscale regressions

function mytest
    onetest('18to24VSfollowers.csv')
    onetest('18to24VSfollowersPC.csv')
    onetest('18to24VSfollowing.csv')
    onetest('18to24VSfollowingPC.csv')
    onetest('18to24VStweets.csv')
    onetest('65andoverVSfollowers.csv')
    onetest('65andoverVSfollowersPC.csv')
    onetest('65andoverVSfollowing.csv')
    onetest('65andoverVSfollowingPC.csv')
    onetest('65andoverVStweets.csv')
    onetest('ageVSfollowers.csv')
    onetest('ageVSfollowersPC.csv')
    onetest('ageVSfollowing.csv')
    onetest('ageVSfollowingPC.csv')
    onetest('ageVStweets.csv')
    onetest('medianageVSfollowers.csv')
    onetest('medianageVSfollowersPC.csv')
    onetest('medianageVSfollowing.csv')
    onetest('medianageVSfollowingPC.csv')
    onetest('medianageVStweets.csv')
end

function onetest(filename)
    M = csvread(filename);
    y = M(:, 1); % demographics data
    X = zeros(size(y, 1), 2);
    X(:, 1) = ones(size(y, 1), 1); % constant term
    X(:, 2) = log(M(:, 2)); % log(twitter data)
    [b, bint, r, rint, stats] = regress(y, X);
    filename
    stats
    
end