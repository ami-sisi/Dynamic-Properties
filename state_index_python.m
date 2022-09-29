clear
load('state_label.txt');
state_stat = struct([]);

for k=1:20%工作区一定已打开了所有人
    a=0;
    b=0;
    B = sum(state_label(k,:));%state2出现的窗数
    A = 169 - B;%state1出现的窗数
    for m=1:169%所有窗
       if m == 1
           if state_label(k,m) == 0
               a = a+1;%state1连续出现的次数
           end
           if state_label(k,m) == 1
               b = b+1;
           end
       else
            if state_label(k,m-1) == state_label(k,m)
               
            elseif state_label(k,m-1) > state_label(k,m)
                a = a+1;
            elseif state_label(k,m-1) < state_label(k,m)
                b = b+1;
            end
       end   
    end
    state_stat(k).MDstate1 = A/a;
    state_stat(k).MDstate2 = B/b;
    state_stat(k).trans = a+b-1;
    state_stat(k).timefraction1=A/m;
    state_stat(k).timefraction2=B/m;
end
%去掉NaN的值
for k=1:20
    if isnan(state_stat(k).MDstate1) == 1
        state_stat(k).MDstate1 = 0;
    end
    if isnan(state_stat(k).MDstate2) == 1
        state_stat(k).MDstate2 = 0;
    end
end
%每个state的占比
state2precent = sum(sum(state_label))/(k * m);
state1precent = 1-state2precent;
state2SZprecent = sum(sum(state_clustering_label([101:end],:)))/(95*m);
state1SZprecent = 1-state2SZprecent;
state2HCprecent = sum(sum(state_clustering_label([1:100],:)))/(100*m);
state1HCprecent = 1-state2HCprecent;

save state_index.mat