cap log cl
clear
clear all
set more off

cd ""
use 401KSUBS.dta, replace

log using p3q7.log, replace

*****************
**Problem C15.8**
*****************

** question (i) **
reg pira p401k inc incsq age agesq

** question (iv) **
reg p401k e401k inc incsq age agesq, r

** question (v) **
ivreg2 pira (p401k = e401k) inc incsq age agesq, r

** question (vi) **
reg p401k e401k inc incsq age agesq, r
predict v, res

reg pira p401k v inc incsq age agesq, r
x
