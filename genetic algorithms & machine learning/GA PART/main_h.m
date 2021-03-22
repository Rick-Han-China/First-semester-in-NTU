% clear all
% mex cec17_func.cpp -DWINDOWS
func_num=1; %所使用的函数编码
D=10; %维度，这个应该是根据要求固定为10的
Xmin=-100; %搜索范围的最小值
Xmax=100; %搜索范围的最大值
pop_size=100; %在PSO中是粒子数
iter_max=50000; %最大代数50000
runs=1; %怎么改？
fhd=str2func('cec17_func'); %似乎作用是把cec17_func这个cpp文件的功能赋给fhd?
%close all 
close %
for i=4%3:12%:29 %对应关系？
    func_num=i;
    for j=1:runs
        i,j,
        [gbest,gbestval,FES]= PSO_func_h(fhd,D,pop_size,iter_max,Xmin,Xmax,func_num);
        xbest(j,:)=gbest; %最佳x的位置？
        fbest(i,j)=gbestval; %第i个函数第j次运行时，最佳x对应的f
        fbest(i,j) %第i个函数第j次运行时得到的最好的f
        %hold on
        %subplot(1,5,i-3);
        %plot(1:j,fbest(i,1:j),'.-');
        
    end
    %figure
    %xlabel('run number')
    %ylabel('fbest')
    %title('relationship of run number and fbest')
    f_mean(i)=mean(fbest(i,:)); %什么意思？

end


% for i=1:29
% eval(['load input_data/shift_data_' num2str(i) '.txt']);
% eval(['O=shift_data_' num2str(i) '(1:10);']);
% f(i)=cec14_func(O',i);i,f(i)
% end