function [gbest,gbestval,fitcount]= PSO_func_h(fhd,Dimension,Particle_Number,Max_Gen,VRmin,VRmax,varargin)
%[gbest,gbestval,fitcount]= PSO_func('f8',3500,200000,30,30,-5.12,5.12)
rand('state',sum(100*clock)); %随机数生成，但是它干啥用的？此为旧版本代码，新版可为rand('twister',mod(floor(now*8640000),2^31-1))
me=Max_Gen; %最大代数
ps=Particle_Number; %粒子数量
D=Dimension; %维度
cc=[2 2]; %acceleration constants 惯性因子
%cc=[1.5 1.7];
%cc=[1.5 2];
iwt=0.7-(1:me).*(0.5./me);%是什么？ω
% iwt=0.5.*ones(1,me);

%V的初始化由搜索范围确定
if length(VRmin)==1 %main里的Xmin
    VRmin=repmat(VRmin,1,D); %生成一个1*D的全为VRmin的矩阵,生成列数,搜索下界
    VRmax=repmat(VRmax,1,D); %生成一个1*D的全为VRmax的矩阵,生成列数,搜索上界
end
mv=0.5*(VRmax-VRmin); %运算目的?给V的运算提供参数吗
VRmin=repmat(VRmin,ps,1); %生成一个ps*1的全为VRmin的矩阵,相当于生成前文的行数
VRmax=repmat(VRmax,ps,1); %生成一个ps*1的全为VRmax的矩阵,相当于生成前文的行数
Vmin=repmat(-mv,ps,1); %确定速度下界，为什么这么确定？
Vmax=-Vmin; %确定速度上界
pos=VRmin+(VRmax-VRmin).*rand(ps,D); %好像是在做p-vector初始化(27行),计算当前位置

e=feval(fhd,pos',varargin{:}); %计算当前位置对应的fitness

fitcount=ps; %作用是什么，不是常量吗？
vel=Vmin+2.*Vmax.*rand(ps,D);%initialize the velocity of the particles
pbest=pos;%记录目前粒子找到的最优解的坐标
pbestval=e; %initialize the pbest and the pbest's fitness value %把当前最优解的值给pbestval
[gbestval,gbestid]=min(pbestval);%没太看懂
gbest=pbest(gbestid,:);%initialize the gbest and the gbest's fitness value
gbestrep=repmat(gbest,ps,1);%生成一列gbest
A = [];
for i=2:me %代数循环

        aa=cc(1).*rand(ps,D).*(pbest-pos)+cc(2).*rand(ps,D).*(gbestrep-pos);%V的变化量
        vel=iwt(i).*vel+aa; %合成后的V
        vel=(vel>Vmax).*Vmax+(vel<=Vmax).*vel; %避免越界
        vel=(vel<Vmin).*Vmin+(vel>=Vmin).*vel; %避免越界
        pos=pos+vel; %更新X
        pos=((pos>=VRmin)&(pos<=VRmax)).*pos...
            +(pos<VRmin).*(VRmin+0.25.*(VRmax-VRmin).*rand(ps,D))+(pos>VRmax).*(VRmax-0.25.*(VRmax-VRmin).*rand(ps,D));
        %上一行式子中(pos<VRmin)的功能是？它似乎不会有为真的情况
        e=feval(fhd,pos',varargin{:}); %算出对应的fitness
        fitcount=fitcount+ps; %ps是一个变化的量吗？不是一直是100？
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


