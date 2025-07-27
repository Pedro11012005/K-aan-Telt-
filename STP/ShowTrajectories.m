function [Trajectories_a,Trajectories_b]=ShowTrajectories(A,res2,Att_Land_size)
Genes = A{1}';
    
numGenes = length(Genes);

% Crear nombres automáticos para genes: G1, G2, ..., Gn
GeneNames = arrayfun(@(x) sprintf('G%d', x), 1:numGenes, 'UniformOutput', false);


Trajectories_a{Att_Land_size,Att_Land_size}=[];
Trajectories_b{Att_Land_size,Att_Land_size}=[];
Att_names_x=cell(1,length(Att_Land_size));
size_res2=size(res2);
for i=1:size_res2(1)
    x=res2(i,3);
    y=res2(i,4);
    geneIndex = res2(i, 2);

        if geneIndex <= numGenes
            Z = GeneNames{geneIndex};
        else
            Z = sprintf('Gx%d', geneIndex); % Etiqueta de respaldo
        end

    Trajectories_a{x,y}=strjoin({Trajectories_a{x,y},Z},'\');
    Trajectories_b{x,y}=strjoin({Trajectories_b{x,y},num2str(res2(i,1))},'\');
end
% Crear nombres automáticos para los atractores: A1, ..., An
Att_names = arrayfun(@(x) sprintf('A%d', x), 1:Att_Land_size, 'UniformOutput', false);
Att_names_x = Att_names;
Att_names_y = [{'x0/xd'}, Att_names]';
Trajectories_a=[Att_names_x;Trajectories_a];
Trajectories_a=[Att_names_y Trajectories_a];
Trajectories_b=[Att_names_x;Trajectories_b];
Trajectories_b=[Att_names_y Trajectories_b];
Trajectories_a
Trajectories_b