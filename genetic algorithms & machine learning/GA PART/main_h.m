% clear all
% mex cec17_func.cpp -DWINDOWS
func_num=1; %��ʹ�õĺ�������
D=10; %ά�ȣ����Ӧ���Ǹ���Ҫ��̶�Ϊ10��
Xmin=-100; %������Χ����Сֵ
Xmax=100; %������Χ�����ֵ
pop_size=100; %��PSO����������
iter_max=50000; %������50000
runs=1; %��ô�ģ�
fhd=str2func('cec17_func'); %�ƺ������ǰ�cec17_func���cpp�ļ��Ĺ��ܸ���fhd?
%close all 
close %
for i=4%3:12%:29 %��Ӧ��ϵ��
    func_num=i;
    for j=1:runs
        i,j,
        [gbest,gbestval,FES]= PSO_func_h(fhd,D,pop_size,iter_max,Xmin,Xmax,func_num);
        xbest(j,:)=gbest; %���x��λ�ã�
        fbest(i,j)=gbestval; %��i��������j������ʱ�����x��Ӧ��f
        fbest(i,j) %��i��������j������ʱ�õ�����õ�f
        %hold on
        %subplot(1,5,i-3);
        %plot(1:j,fbest(i,1:j),'.-');
        
    end
    %figure
    %xlabel('run number')
    %ylabel('fbest')
    %title('relationship of run number and fbest')
    f_mean(i)=mean(fbest(i,:)); %ʲô��˼��

end


% for i=1:29
% eval(['load input_data/shift_data_' num2str(i) '.txt']);
% eval(['O=shift_data_' num2str(i) '(1:10);']);
% f(i)=cec14_func(O',i);i,f(i)
% end