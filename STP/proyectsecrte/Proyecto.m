clear all
clc
load('AtractorsTable1.mat');
load('AtractorsTable2.mat');
load('WorkProyecto.mat');
%%
Category = categorical(repelem(0,214));
X = addvars(AtractorsTable2,Category');
T = AtractorsTable1;
for k = 4:214
    if (T(k,29) == 1) && (T(k,19) == 1) && (T(k,20) == 1) && ((T(k,23) == 1) || (T(k,9) == 1))
        X{k,31} = categorical("M1");
    elseif ((T(k,25) == 1) || (T(k,8) == 1)) && (T(k,16) == 1)
        X{k,31} = categorical("M2");
    elseif (T(k,28) == 1) && (T(k,30) == 1) && (T(k,14) == 1) && (T(k,3) == 1)
        X{k,31} = categorical("NLC");
    else
        X{k,31} = categorical("M0");
    end
end
for k = 2
    if (T(k,29) == 1) && (T(k,19) == 1) && (T(k,20) == 1) && ((T(k,23) == 1) || (T(k,9) == 1))
        X{k,31} = categorical("M1");
    elseif ((T(k,25) == 1) || (T(k,8) == 1)) && (T(k,16) == 1)
        X{k,31} = categorical("M2");
    elseif (T(k,28) == 1) && (T(k,30) == 1) && (T(k,14) == 1) && (T(k,3) == 1)
        X{k,31} = categorical("NLC");
    else
        X{k,31} = categorical("M0");
    end
end
X([1,3],:) = [];

%%
cat = categories(X.Var31);
y = categorical(AtractorsTable2.Properties.VariableNames);
A = zeros(4,30);
oj= [];
for t = 2:5
    i = X.Var31 == cat{t};
    r = X(i,1:30);
    u = zeros(height(r),30);
    for k = 1:height(r)
        u(k,:) = r{k,:};
    end
    A(t-1,:) = mean(u);
    oj= [oj, A(t-1,:)];
    figure
    bar(y,A(t-1,:))
end
%%
oj= table(oj);
oj= splitvars(oj, 'oj');
po=rows2vars(oj);
zzz= po(:,2);
Moj= po(1:30,:);
NLC1= po(31:60,:);
M1j= po(61:90,:);
M2j= po(91:120,:);
Mo= Moj(:,2);
Mo.Properties.VariableNames = {'M0'};
M1= M1j(:,2);
M1.Properties.VariableNames = {'M1'};
M2= M2j(:,2);
M2.Properties.VariableNames = {'M2'};
NLC= NLC1(:,2);
NLC.Properties.VariableNames = {'NLC'};
transpose(y);
string(y);
d= table(y);
d= splitvars(d, 'y');
n=rows2vars(d);
n.Properties.VariableNames = {'ff','Genes'};
siii= n(:,2);
finals =[Mo M1 M2 NLC];
pepe = table2array(finals); 
figure
hAxes = gca;
imagesc(hAxes,pepe);
colormap( hAxes ,bone) 
colorbar
title('Average expression profiles of each phenotype')
 %{
joj= A(t-1,:);
    ttt= array2table(joj);
    h= rows2vars(ttt);
    transpose(y);
    string(y);
    d= table(y);
    d= splitvars(d, 'y');
    n=rows2vars(d);
    n.Properties.VariableNames = {'ff','Var2'};
    shial= [h(:,2) n(:,2)];
    figure
    heatmap(shial,'Var1','Var2')
%}
%%

%%training
ABCD= table2array(X(:,1:2));
MMM= table2array(X(:,31));
Unsu= cellstr(MMM);
f= categorical(Unsu);
labels = categories(f);
% classifiers
classifier_name = {'Classification Tree','Nearest Neighbor'};
classifier{1} = fitctree(ABCD,f); %Train a decission tree model.
classifier{2} = fitcknn(ABCD,f); %Train a knn model.
x1range = min(ABCD(:,1)):.01:max(ABCD(:,1)); 
x2range = min(ABCD(:,2)):.01:max(ABCD(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];

for i = 1:numel(classifier)
   predictedgenes = predict(classifier{i},XGrid);

   subplot(1,2,i)
   gscatter(xx1(:), xx2(:), predictedgenes,'rgb');

   title(classifier_name{i})
   legend off, axis tight
end

legend(labels,'Location',[0.35,0.01,0.35,0.05],'Orientation','Horizontal')

%%
clc
Category = categorical(repelem(0,214));
X = addvars(AtractorsTable2,Category');
T = AtractorsTable1;
for k = 4:214
    if (T(k,29) == 1) && (T(k,19) == 1) && (T(k,20) == 1) && ((T(k,23) == 1) || (T(k,9) == 1))
        X{k,31} = categorical("2");
    elseif ((T(k,25) == 1) || (T(k,8) == 1)) && (T(k,16) == 1)
        X{k,31} = categorical("3");
    elseif (T(k,28) == 1) && (T(k,30) == 1) && (T(k,14) == 1) && (T(k,3) == 1)
        X{k,31} = categorical("4");
    else
        X{k,31} = categorical("1");
    end
end
for k = 2
    if (T(k,29) == 1) && (T(k,19) == 1) && (T(k,20) == 1) && ((T(k,23) == 1) || (T(k,9) == 1))
        X{k,31} = categorical("2");
    elseif ((T(k,25) == 1) || (T(k,8) == 1)) && (T(k,16) == 1)
        X{k,31} = categorical("3");
    elseif (T(k,28) == 1) && (T(k,30) == 1) && (T(k,14) == 1) && (T(k,3) == 1)
        X{k,31} = categorical("4");
    else
        X{k,31} = categorical("1");
    end
end

%%
% Hierarchical clustering
X([1,3],:) = [];
f=X(:,31);
X1 = AtractorsTable1([2,4:end],:);
Y = pdist(X1);
Z = linkage(Y);
s= table2array(f);
d= string(s);
final = double(d);
W = cluster(Z,'maxclust',4);
figure
c= confusionmat(final,W);
confusionchart(c)
title('clustering')
% Spatial clustering
AS= table2array(X(:,1:2));
idT = dbscan(AS,0.5,1); % The default distance metric is Euclidean distance
figure
gscatter(AS(:,1),AS(:,2),idT);
title('DBSCAN Using Euclidean Distance Metric')
figure
c1= confusionmat(final,idT);
confusionchart(c1)
title('Model for Euclidean Distance ')
kidx = kmeans(AS,4); % The default distance metric is squared Euclidean distance
figure
gscatter(AS(:,1),AS(:,2),kidx);
title('K-Means Using Squared Euclidean Distance')
figure
c2= confusionmat(final,kidx);
confusionchart(c2)
title('Spatial Clustering with Squared Euclidean Distance')
%%
X = AtractorsTable1([2,4:end],:);
Y = pdist(X);
Z = linkage(Y);
W = cluster(Z,'maxclust',4);
B = zeros(4,30);
Bj=[];
for t = 1:4
    i = W == t;
    r = X(i,1:30);
    u = zeros(height(r),30);
    for k = 1:height(r)
        u(k,:) = r(k,:);
    end
    B(t,:) = mean(u);
    Bj= [Bj, B(t,:)];
    figure
    bar(y,B(t,:))
end
figure
c22= confusionmat(final,W);
confusionchart(c22)
%%
Bj= table(Bj);
Bj= splitvars(Bj, 'Bj');
pe=rows2vars(Bj);
zzz= pe(:,2);
Mo1cl= pe(1:30,:);
M11cl= pe(31:60,:);
M21cl= pe(61:90,:);
NLC1cl= pe(91:120,:);
Mocl= Mo1cl(:,2);
Mocl.Properties.VariableNames = {'M0'};
M1cl= M11cl(:,2);
M1cl.Properties.VariableNames = {'M1'};
M2cl= M21cl(:,2);
M2cl.Properties.VariableNames = {'M2'};
NLCcl= NLC1cl(:,2);
NLCcl.Properties.VariableNames = {'NLC'};
transpose(y);
string(y);
d= table(y);
d= splitvars(d, 'y');
n=rows2vars(d);
n.Properties.VariableNames = {'ff','Genes'};
siii= n(:,2);
finals2 =[Mocl M1cl M2cl NLCcl];
sech = table2array(finals2); 
figure
hAxes = gca;
imagesc(hAxes,sech);
colormap( hAxes ,cool) 
colorbar
title('Average expression profiles of each phenotype (clustering)')
[coeff,score,latent,tsquared,explained,mu] = pca(AtractorsTable1([2,4:end],:), 'Algorithm','eig');
