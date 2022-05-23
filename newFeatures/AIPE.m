function pe = AIPE(currSubjectGlucose,m)
%this function returns the value of Permutation Entropy for the glucose
%samples of the patient in currSubjectGlucose
% INPUT: 
%        -currSubjectGlucose: glucose time series of the subject
%        -m: length of subsequences
% OUTPUT:
%        -pe: permutation entropy value computed as in 
%         "Classification of glucose records from patients at diabetes risk
%          using a combined permutation entropy algorithm", D. Cuesta–Frau,
%          https://doi.org/10.1016/j.cmpb.2018.08.018

%elimination of NaN samples
nan_idx=isnan(currSubjectGlucose);
currSubjectGlucose(nan_idx)=[];

%number of permutations
M=factorial(m);
% AIPE parameter
A=0.5;

%the dimension of the timeseries
N=size(currSubjectGlucose,1);

%permutation list
m_vect_perm=perms(1:m);

%we create a matrix with the subsequences of glucose values of lenght m
c=zeros(size(m_vect_perm,1),1);
for j=1:N-m
    %subsequence construction
    for i=1:m
        xj(i)=currSubjectGlucose(j+i);
        index(i)=i;
    end %for
    bSorted=false;
    while bSorted==false
        bSorted=true;
        for i=1:m-1
            if (xj(i)>xj(i+1))
                %saving the value
                tmp=xj(i);
                %saving the index value
                tmp_idx=index(i);
                %swapping the elements
                xj(i)=xj(i+1);
                xj(i+1)=tmp;
                %swapping the indeces
                index(i)=index(i+1);
                index(i+1)=tmp_idx;
                bSorted=false;
            end %if
        end %for
    end %end while
    k=1;
    bEqual=true;
    while bEqual==true
        for i=1:m
            if ~(index(i)==m_vect_perm(k,i))
                bEqual=false;
                break
            end %if
        end %for
        if bEqual==true
            sum_term=0;
            for l=2:m
                sum_term=sum_term+(A/m)*abs(xj(l))+((1-A)/(m-1))*abs(xj(l)-xj(l-1));
            end %for
            c(k)=c(k)+(A/m)*abs(xj(1))+sum_term;
            k=0;
            break
        end %if
        k=k+1;
        bEqual=true;
    end %while
end %for
pe=0;
C=sum(c);
for k=1:M
    p(k)=c(k)/C;
    if p(k)>0
        pe=pe-p(k)*log(p(k));
    end %if
end %for

end

