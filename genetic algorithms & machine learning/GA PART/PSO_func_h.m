function [gbest,gbestval,fitcount]= PSO_func_h(fhd,Dimension,Particle_Number,Max_Gen,VRmin,VRmax,varargin)
%[gbest,gbestval,fitcount]= PSO_func('f8',3500,200000,30,30,-5.12,5.12)
rand('state',sum(100*clock)); %��������ɣ���������ɶ�õģ���Ϊ�ɰ汾���룬�°��Ϊrand('twister',mod(floor(now*8640000),2^31-1))
me=Max_Gen; %������
ps=Particle_Number; %��������
D=Dimension; %ά��
cc=[2 2]; %acceleration constants ��������
%cc=[1.5 1.7];
%cc=[1.5 2];
iwt=0.7-(1:me).*(0.5./me);%��ʲô����
% iwt=0.5.*ones(1,me);

%V�ĳ�ʼ����������Χȷ��
if length(VRmin)==1 %main���Xmin
    VRmin=repmat(VRmin,1,D); %����һ��1*D��ȫΪVRmin�ľ���,��������,�����½�
    VRmax=repmat(VRmax,1,D); %����һ��1*D��ȫΪVRmax�ľ���,��������,�����Ͻ�
end
mv=0.5*(VRmax-VRmin); %����Ŀ��?��V�������ṩ������
VRmin=repmat(VRmin,ps,1); %����һ��ps*1��ȫΪVRmin�ľ���,�൱������ǰ�ĵ�����
VRmax=repmat(VRmax,ps,1); %����һ��ps*1��ȫΪVRmax�ľ���,�൱������ǰ�ĵ�����
Vmin=repmat(-mv,ps,1); %ȷ���ٶ��½磬Ϊʲô��ôȷ����
Vmax=-Vmin; %ȷ���ٶ��Ͻ�
pos=VRmin+(VRmax-VRmin).*rand(ps,D); %����������p-vector��ʼ��(27��),���㵱ǰλ��

e=feval(fhd,pos',varargin{:}); %���㵱ǰλ�ö�Ӧ��fitness

fitcount=ps; %������ʲô�����ǳ�����
vel=Vmin+2.*Vmax.*rand(ps,D);%initialize the velocity of the particles
pbest=pos;%��¼Ŀǰ�����ҵ������Ž������
pbestval=e; %initialize the pbest and the pbest's fitness value %�ѵ�ǰ���Ž��ֵ��pbestval
[gbestval,gbestid]=min(pbestval);%û̫����
gbest=pbest(gbestid,:);%initialize the gbest and the gbest's fitness value
gbestrep=repmat(gbest,ps,1);%����һ��gbest
A = [];
for i=2:me %����ѭ��

        aa=cc(1).*rand(ps,D).*(pbest-pos)+cc(2).*rand(ps,D).*(gbestrep-pos);%V�ı仯��
        vel=iwt(i).*vel+aa; %�ϳɺ��V
        vel=(vel>Vmax).*Vmax+(vel<=Vmax).*vel; %����Խ��
        vel=(vel<Vmin).*Vmin+(vel>=Vmin).*vel; %����Խ��
        pos=pos+vel; %����X
        pos=((pos>=VRmin)&(pos<=VRmax)).*pos...
            +(pos<VRmin).*(VRmin+0.25.*(VRmax-VRmin).*rand(ps,D))+(pos>VRmax).*(VRmax-0.25.*(VRmax-VRmin).*rand(ps,D));
        %��һ��ʽ����(pos<VRmin)�Ĺ����ǣ����ƺ�������Ϊ������
        e=feval(fhd,pos',varargin{:}); %�����Ӧ��fitness
        fitcount=fitcount+ps; %ps��һ���仯�����𣿲���һֱ��100��
        tmp=(pbestval<e);
        temp=repmat(tmp',1,D);
        pbest=temp.*pbest+(1-temp).*pos;
        pbestval=tmp.*pbestval+(1-tmp).*e;%update the pbest
        [gbestval,tmp]=min(pbestval);
        gbest=pbest(tmp,:);
        gbestrep=repmat(gbest,ps,1);%update the gbest
        A(i) = gbestval;
    end
    %subplot(1,5,(1:5));
    plot(log(A),'.-');
    title('Convergence plot when iwt[0.7,0.5]')
end


