clear
clear all
set more off

cd " " // <-- Your path to data here
use WAGE2.dta, replace

log using p3q8.log, replace

*****************
**Problem C15.9**
*****************

** question (i) **
ivreg2 lwage (educ = sibs) exper tenure black

** question (ii) **
reg educ sibs exper tenure black
predict ehat

reg lwage ehat exper tenure black

** question (iii) **
drop ehat

reg educ sibs
predict ehat

reg lwage ehat exper tenure black

log cl
