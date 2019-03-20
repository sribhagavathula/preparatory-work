 
% -------------------------------------------------------------------------------------------

% create a dipole simulation with one dipole 
cfg2      = [];
cfg2.headmodel  = Standard2;             % see above
cfg2.elec = ec_reduced;            % see above
cfg2.dip.pos=sourcemodel.pos(2,:);
cfg2.dip.mom= [1 0 0 ]';
           
% coordinate axes in which the dipole is aligned
% note, it should be transposed. 
  
cfg2.dip.amplitude=1;
cfg2.ntrials = 1;
cfg2.triallength = 1;     % seconds
cfg2.fsample = 250;   % Hz
% Check the source code
cfg2.relnoise=3.2e-01; % add noise to simulated data based on chosen SNR
cfg2.absnoise=0; 
raw2 = ft_dipolesimulation(cfg2);
avg2 = ft_timelockanalysis([], raw2);  

% -------------------------------------------------------------------------------------------

 
