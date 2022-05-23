function [MSE,S]=complexity_indexes(subj_window)
% Input: 
%       subj: subject window of 72 hours
% Output: 
%       MSE: multiscale entropy complexity index
%       S: sample entropy

data=subj_window.glucose(:,1); % glucose data time series
sigma=nanstd(data); % standard deviation of glucose signal

% m: embedding dimension
% r: tolerance level
% M: the largest scale factor

m=2;
r=0.15*sigma;
M=7;

% compute sample entropy for each coarse-grained sequence
S=zeros(1,M);

for i=1:M
    % coarse-grained sequence
    data_seq=coarse_graining(data,i); 
    % (m+1)-element sequences
    Z=buffer(data_seq,m+1,m,'nodelay')';
    % matching (m+1)-element sequences
    A=sum(pdist(Z,'chebychev')<r);
    % m-element sequences
    Z=Z(:,1:m);
    % matching m-element sequences
    B=sum(pdist(Z,'chebychev')<r);
    % take log to compute sample entropy
    S(i)=log(B/A); 
end

% compute MSE complexity index
MSE=trapz(1:M,S);