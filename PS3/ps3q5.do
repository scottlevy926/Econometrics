clear
clear all
set more off

cd "" // <-- Your path to data here
use CARD.dta, replace

//log using p3q5.log, replace

*****************
**Problem C15.3**
*****************
ren IQ iq
** question (ii) **
reg id nearc4

** question (iii) **
reg iq nearc4 smsa66 reg662-reg669

//log cl
