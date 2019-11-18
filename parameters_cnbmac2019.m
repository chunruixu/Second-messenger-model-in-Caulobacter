function parameters(index, nut)
%%index represents different sets of params
%%nut represents different nutrient conditions
global p
if nut==0 %rich
  p.PEP=300;%gln=1000
  p.Pyr =1500;%
elseif nut==1 %starvation
      p.Pyr=900;
   p.PEP=2800;
end



if index==2  %using Bronson's PleD~P
p.kscdG=53;
p.K1=0.5;
p.Km1=1000;
p.kdcdG=115;
p.Km2=0.06;
p.Pbasal=0.15;

p.K2=100;
p.K3=10;
p.kspot=4;
p.ksppGpp=55;
p.Km3=1000;
p.kdppGpp=180;
p.Km4=2000;
p.ksGTP=1500;
p.kdGTP=100;

else if index==3  %using experimental PleD without the third point
p.kscdG=45;
p.K1=0.5;
p.Km1=1000;
p.kdcdG=120;
p.Km2=0.06;
p.Pbasal=0.15;

p.K2=100;
p.K3=10;
p.kspot=4;
p.ksppGpp=55;
p.Km3=1000;
p.kdppGpp=180;
p.Km4=2000;
 
 
p.ksGTP=1500;
p.kdGTP=100;
    end 
end

p.K4 =108;
p.e=0.17;

p.Kb1=350;
 p.Kb2=670;
 p.k1_pos=2*10^4/60;
 p.k1_neg=2.6*10^4/60;
 

 p.k2_pos=7*10^5/60;
 p.k2_neg=7*10^5/60;
 p.k3_pos=2.2*10^5/60;
 p.k3_neg =2.2*10^5/60;
 p.EIt =10;%10um
 p.NPrt=50;%50um
 p.EIIAt=50;%50um
 
 


