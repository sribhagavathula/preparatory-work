function rdm=cal_rdm2(Mi,Mt)
data=Mi./sqrt(sum(Mi.^2,1)) - Mt./sqrt(sum(Mt.^2,1));
rdm=sqrt(sum(data.^2,1));  
end