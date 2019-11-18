function dY = func_ode(t,Y)
%% ODEs %%

global p
global Gln

cdG=Y(1);
GTP=Y(2);
ppGpp=Y(3);
GMP=Y(4);
EIPt=Y(5);
NPrP=Y(6);
EIIAP=Y(7);


%% plug PleD function %%
 T=150;%specific for pledp
  t_d=rem(t,T); %return remainder after division t/T
  
  D=0.1732.*sin(pi*t_d/70-0.5849)+0.7581;
%   Goodness of fit:
%   SSE: 0.02798
%   R-square: 0.7924
%   Adjusted R-square: 0.7093
%   RMSE: 0.07481
% 
%  %%%pled-p of Bronson
%   a1 =       5.175  ;
%        b1 =   0.0009292  ;
%        c1 =    0.005578  ;
%        a2 =      0.2046 ;
%        b2 =     0.07623  ;
%        c2 =       -1.11 ;
%        a3 =      0.6235 ;
%        b3 =     0.03333 ;
%        c3 =      0.4149;
%        a4 =     0.06622 ;
%        b4 =      0.1963;
%        c4 =      -3.666  ;
% 
%     D= a1*sin(b1*t_d+c1) + a2*sin(b2*t_d+c2) + a3*sin(b3*t_d+c3) +a4*sin(b4*t_d+c4);

D(D<0)=0;
   
%% plug PdeA function %%
 P=0.4085.*sin(pi*t_d/70+7.811)+0.3586;%OK a*sin(pi*t/70+b)+c
P(P<0)=0;      
%%%%%%%%%%%%%%%%


JscdG = p.kscdG*D*p.K1^2*GTP^2/((cdG^2+p.K1^2)*(GTP^2+p.Km1^2));%synthesis of cdG
JdcdG = p.kdcdG*(P+p.Pbasal)*cdG/(cdG+p.Km2);%degradation of cdG


ratio=p.kspot*NPrP*(p.K3+EIIAP)/(p.K3*(NPrP+p.K2));
Ssd=ratio/(ratio+1);%SpoT_sd
Shd=1/(ratio+1);%SpoT_hd
JsppGpp = p.ksppGpp*Ssd*GTP/(GTP+p.Km3);%synthesis of (p)ppGpp
JdppGpp = p.kdppGpp*Shd*ppGpp/(ppGpp+p.Km4);%degradation of (p)ppGpp

JsGTP= p.ksGTP*GMP;

%% odes
dx = JscdG - JdcdG; %cdG
dy = JsGTP+JdppGpp-JsppGpp-2*JscdG-p.kdGTP*GTP; %GTP
dz = JsppGpp - JdppGpp;%(p)ppGpp
dm = 2*JdcdG +p.kdGTP*GTP- JsGTP;%GMP


%% PTS
EIIA=p.EIIAt-EIIAP;
NPr=p.NPrt-NPrP;

EIP=EIPt*p.Kb2/(p.Kb2+p.Pyr);%9
EIPPyr=p.Pyr*EIP/p.Kb2;%5
EI=(p.EIt-EIPt)*p.Kb1/(p.Kb1+p.PEP);%11
EIPEP=EI*p.PEP/p.Kb1;%4



r1=p.k1_pos*EIPEP*(p.K4+p.e*Gln)/(p.K4+Gln)-p.k1_neg*EIPPyr;
r2= p.k2_pos*EIPt*(p.NPrt-NPrP)-p.k2_neg*NPrP*(p.EIt-EIPt);
r3=p.k3_pos*NPrP*(p.EIIAt-EIIAP)-p.k3_neg*(p.NPrt-NPrP)*EIIAP;

%% odes
dnprp = r2-r3;
deiiap=r3;
deipt=r1-r2;


%%
dY=[dx; dy; dz; dm; deipt; dnprp; deiiap];
