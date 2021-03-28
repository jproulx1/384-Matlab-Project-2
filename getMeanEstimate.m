function mu = getMeanEstimate(xdata)
% getMeanEstimate calculates the mean of a vector of data by averaging
% using the formula Mn = (1/N)*\Sigma_{n=1}^{N}(X_n)
% xdata - samples of a random variable whose mean is to be calculated
% mu - the mean of the data
    N = length(xdata);
    sum = 0;
    for n = 1:N
        sum = sum+xdata(n);
    end
    mu = sum/N;
end