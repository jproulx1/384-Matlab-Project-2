function sigma2 = getVarianceEstimate(xdata,mu)
% getVarianceEstimate calculates the variance of the data based on the
% equation (1/N)*\Sigma_{n=1}^{N}(X_n - mu)^2
% xdata - samples of a random variable whose variance is to be calculated
% sigma2 - the variance of the data
    N = length(xdata);
    sum = 0;
    for n = 1:N
        sum = sum + (xdata(n) - mu).^2;
    end
    sigma2 = sum/N;
end