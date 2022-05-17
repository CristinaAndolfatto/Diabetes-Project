function data_seq=coarse_graining(data,s)
% generate the coarse-grained sequence
% Input: 
%       data: glucose data time series
%       s: the scale factor
% Output: 
%       data_seq: the coarse-grained sequence at the scale factor s

N=length(data);
J=fix(N/s);

data_seq=zeros(J,1);

for j=1:J
data_seq(j)=mean(data((j-1)*s+1:j*s));
end