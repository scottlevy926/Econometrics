clear
clear all
set more off

cd "D:\Dropbox\Teaching\UNLV\ECON 772\ps\data\"
use HTV.dta, replace

log using p3q9.log, replace

******************
**Problem C15.10**
******************

** question (i) **
reg lwage educ

** question (ii) **
corr educ ctuit
pcorr educ ctuit exper expersq ne nc west south ne18 nc18 south18 west18 urban urban18
ivreg2 lwage (educ = ctuit) exper expersq ne nc west south ne18 nc18 south18 west18 urban urban18, ffirst

** question (iii) **
reg lwage educ exper expersq ne nc west south ne18 nc18 south18 west18 urban urban18

** question (iv) **
reg educ ctuit exper expersq ne nc west south ne18 nc18 south18 west18 urban urban18

** question (v) **
ivreg2 lwage (educ = ctuit) exper expersq ne nc west south ne18 nc18 south18 west18 urban urban18, ffirst

log cl
