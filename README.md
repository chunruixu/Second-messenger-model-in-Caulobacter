# Second-messenger-model-in-Caulobacter
mathematical model

## run cnbmac2019_main.m

if use experimental PleD of Abel et al: parameters_cnbmac2019(3,0); 
comment 'Bronson's PleD~P' and uncomment 'experimental PleD without the third point'.
if use Bronson's PleD~P: parameters_cnbmac2019(2,0);
uncomment 'Bronson's PleD~P'

## cnbmac2019_func.m

includes ODEs and algebraic equations

## parameters_cnbmac2019(index,nut)

index is for different sets of params; 
nut is to tune PEP and Pyr under different nutrient conditions 