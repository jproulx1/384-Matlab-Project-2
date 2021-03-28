%% Kaitlyn Hart, Joshua Proulx and Christopher Gravelle -- Matlab Project 4.1 -- 03/26/21
format compact, clc, clear, close all

N = 10e3; % Number of trials
figNum=0;

% Project 4.1 requires project 3.1 it seems
% Project 3.1)
% (a) binomial r.v.
n = 12; % Number of Bernoulli trials
p = 0.5109; % Probability of success
x_bin = binornd(n,p,1,N); % built-in matlab binomial generating function
[bin_pmf,bin_cdf,~] = PmfCdf(x_bin,n); % code provided by book to get PMF and CDF

figNum=figNum+1;
figure(figNum)
stem(0:n,bin_pmf)
title('Estimated PMF of Binomial Random Variable with n=12, p=0.5109')
xlabel('Number of Successes'); ylabel('Probability')
grid on

figNum=figNum+1;
figure(figNum)
stairs(0:n,bin_cdf)
title('Estimated CDF of Binomial Random Variable with n=12, p=0.5109')
xlabel('Number of Successes'); ylabel('Cumulative Probability')
grid on
axis([0 n -0.05 1.05])

% (b) Poisson r.v. as a limiting case of binomial r.v.
p = 0.01; %
n = 1/p;
alpha = n*p;

x_poisson = binornd(n,p,1,N); % built-in matlab binomial generating function
[poisson_pmf,poisson_cdf,~] = PmfCdf(x_poisson,n); % code provided by book to get PMF and CDF

figNum=figNum+1;
figure(figNum)
stem(0:n,poisson_pmf)
title('Estimated PMF of Binomial-Poisson Random Variable with n=100, p=0.01, np=1')
xlabel('Number of Events'); ylabel('Probability')
grid on

figNum=figNum+1;
figure(figNum)
stairs(0:n,poisson_cdf)
title('Estimated CDF of Binomial-Poisson Random Variable with n=100, p=0.01, np=1')
xlabel('Number of Events'); ylabel('Cumulative Probability')
grid on
axis([0 n -0.05 1.05])

% (c) Type 1 geometric r.v.
p = 0.09; % probability of success
x_geo = geornd(p,1,N); % generate N realizations
[geo_pmf, geo_cdf,~] = PmfCdf(x_geo);

figNum=figNum+1;
figure(figNum)
stem(1:length(geo_pmf),geo_pmf)
title('Estimated PMF of Type 1 Geometric Random Variable with p=0.09')
xlabel('Number of Trials Until Success'); ylabel('Probability')
xlim([1 length(geo_pmf)])
grid on


figNum=figNum+1;
figure(figNum)
stairs(1:length(geo_cdf),geo_cdf)
title('Estimated CDF of Type 1 Geometric Random Variable with p=0.09')
xlabel('Number of Trials Until Success'); ylabel('Cumulative Probability')
xlim([1 length(geo_cdf)])
grid on

% (d) Continuous uniform r.v. in range [-2,5]
a = -2; b = 5; % lower and upper bound of r.v. range
x_unif = unifrnd(a,b,1,N); % generate N realizations
[unif_pdf,unif_cdf,~,~] = PdfCdf(x_unif);


figNum=figNum+1;
figure(figNum)
plot(linspace(a,b,length(unif_pdf)),unif_pdf)
title('Estimated PDF of Continuous Uniform Random Variable in [-2,5]')
xlabel('Random Variable'); ylabel('Probability')
axis([a b 0 1])
grid on

figNum=figNum+1;
figure(figNum)
plot(linspace(a,b,length(unif_cdf)),unif_cdf)
title('Estimated CDF of Continuous Uniform Random Variable in [-2,5]')
xlabel('Random Variable'); ylabel('Cumulative Probabilty')
grid on

% (e) Gaussian r.v.
muGauss = 1.3172; % mean of Gaussian r.v.
sigma2Gauss = 1.9236; % variance of Gaussian r.v.
x_gauss = muGauss + sqrt(sigma2Gauss).*randn(1,N);
numBin = 30;
[gauss_pdf,gauss_cdf,gauss_xp,gauss_xc] = PdfCdf(x_gauss,numBin);

figNum=figNum+1;
figure(figNum)
plot(gauss_xp,gauss_pdf)
title('Estimated PDF of Gaussian Random Variable with \mu=1.3172, \sigma^{2}=1.9236')
xlabel('Random Variable'); ylabel('Probability')
grid on

figNum=figNum+1;
figure(figNum)
plot(gauss_xc,gauss_cdf)
title('Estimated CDF of Gaussian Random Variable with \mu=1.3172, \sigma^{2}=1.9236')
xlabel('Random Variable'); ylabel('Cumulative Probability')
grid on

% (f) Exponential r.v.
lambda = 1.37;
muGauss = 1/lambda;
% x_exp = exprnd(mu,1,N);
x_exp = exprnd(muGauss,1,N);

[exp_pdf,exp_cdf,exp_xp,exp_xc] = PdfCdf(x_exp);

figNum=figNum+1;
figure(figNum)
plot(exp_xp,exp_pdf)
title('Estimated PDF of Exponential random variable with \lambda=1.37')
xlabel('Random Variable'); ylabel('Probability')
grid on

figNum=figNum+1;
figure(figNum)
plot(exp_xc,exp_cdf)
title('Estimated CDF of Exponential random variable with \lambda=1.37')
xlabel('Random Variable'); ylabel('Cumulative Probability')
grid on

%% Project 4.1
format compact, clc, clear, close all

N = [10e3 20e3 40e3]; %number of samples
numRv = 6;
% Binom = 1, Poiss = 2, Geo = 3, Unif = 4, Gauss = 5, exp = 6

% Binomial parameters 
nBin = 12; % Number of Bernoulli trials
pBin = 0.5109; % Probability of success

% Poisson parameters
pPois = 0.01;
nPois = 1/pPois;
alpha = nPois*pPois ~= 1;

% Type 1 Geometric parameters
pGeo = 0.09; % probability of success

% Continuous random variable parameters
a = -2; b = 5; % lower and upper bound of r.v. range

% Gaussian random variable parameters
muGauss = 1.3172; % mean of Gaussian r.v.
sigma2Gauss = 1.9236; % variance of Gaussian r.v.

% Exponential random variable paremeters
lambda = 1.37;

Mn = zeros(length(N),numRv);
sigma2 = zeros(length(N),numRv);

for n = 1:length(N)
    xBin = binornd(nBin,pBin,1,N(n));
    xPois = binornd(nPois,pPois,1,N(n));
    xGeo = geornd(pGeo,1,N(n));
    xUnif = unifrnd(a,b,1,N(n));
    xGauss = muGauss + sqrt(sigma2Gauss).*randn(1,N(n));
    xExp = exprnd(1/lambda,1,N(n));
    X = [xBin;xPois;xGeo;xUnif;xGauss;xExp];
    for idx = 1:numRv
        Mn(n,idx) = getMeanEstimate(X(idx,:));
        sigma2(n,idx) = getVarianceEstimate(X(idx,:),Mn(n,idx));
    end
    clear xBin xPois xGeo xUnif xGauss xExp X
end