% using a class with static methods here
% since MATLAB doesn't have true globals

classdef g
  methods(Static)
    function r = DROW; r = 1; end % row dimension
    function r = DCOL; r = 2; end % column dimension
    function r = DPAG; r = 2; end % page dimension
  end
end