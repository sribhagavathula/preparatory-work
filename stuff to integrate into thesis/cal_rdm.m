% Calculate RDM for electrodes
% --------------------------------
% - RDM is a scaler
% - m1 is interpolated data on N target electrodes (called m?_i in Thomas's presentation)
% - m2 is data on N target electrodes (called m_i)

function rdm = calc_rdm(m1, m2)  
  M1=norm(m1);
  M2=norm(m2);

  % taken from https://en.wikipedia.org/wiki/Relative_change_and_difference
  rdm = norm((m1/M1)-(m2/M2));
end