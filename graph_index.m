% test = cell_matrix([1:3],[1:4]);
clear
Eglob =cellfun(@(x)(efficiency_wei(x ,0)),cell_matrix,'UniformOutput',false);
Elocal =cellfun(@(x)(efficiency_wei(x ,2)),cell_matrix,'UniformOutput',false);
% D =cellfun(@(x)(distance_wei(x)),cell_matrix,'UniformOutput',false);
% [lambda,efficiency] = cellfun(@(x)(charpath(x)),D,'UniformOutput',false);
[C_pos,C_neg,Ctot_pos,Ctot_neg] =cellfun(@(x)(clustering_coef_wu_sign(x)),cell_matrix,'UniformOutput',false);
EC =cellfun(@(x)(eigenvector_centrality_und(x)),cell_matrix,'UniformOutput',false);

save threshold_0.20_Eglob.mat Eglob;
save threshold_0.20_Elocal.mat Elocal;
save threshold_0.20_CC.mat Ctot_pos;
save threshold_0.20_EC.mat EC;