clear
clear all
set more off

cd "/Users/scott/Desktop/UNLV/ECO 772/PS4/"
use MROZ.dta, clear
log using ps4_17_7.log, replace



**Problem C17.7**


** question (i) **
reg lwage educ exper expersq nwifeinc age kidslt6 kidsge6

** question (ii) **
heckman lwage educ exper expersq nwifeinc age kidslt6 kidsge6, select(educ exper expersq nwifeinc age kidslt6 kidsge6) twostep

** question (iii) **
probit inlf educ exper expersq nwifeinc age kidslt6 kidsge6
predict yhat, xb 
gen imr = normalden(yhat)/normal(yhat) 
label variable imr "inverse Mills ratio"

reg yhat educ exper expersq nwifeinc age kidslt6 kidsge6 imr

log cl


