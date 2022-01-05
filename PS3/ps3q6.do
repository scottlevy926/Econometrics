cap log cl
clear
clear all
set more off

cd "" // <-- Your path to data here
use CARD.dta, replace

//log using p3q6.log, replace

*****************
**Problem C15.5**
*****************

** question (i) **
reg lwage educ exper expersq black smsa south smsa66 reg662-reg669

ivreg2 lwage (educ = nearc4) exper expersq black smsa south smsa66 reg662-reg669

reg educ nearc4 exper expersq black smsa south smsa66 reg662-reg669
predict v2, res

reg lwage educ v2 exper expersq black smsa south smsa66 reg662-reg669

**question (ii) **
ivreg2 lwage (educ = nearc4 nearc2) exper expersq black smsa south smsa66 reg662-reg669, ffirst
x
**question (iii) ***
qui ivreg2 lwage (educ = nearc4 nearc2) exper expersq black smsa south smsa66 reg662-reg669, ffirst
predict u, res

reg u exper expersq black smsa south smsa66 reg662-reg669 nearc4 nearc2
di e(N)*e(r2)
di chi2tail(1,e(N)*e(r2))
