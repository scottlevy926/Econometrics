clear
clear all
set more off

cd "/Users/scott/Desktop/UNLV/ECO 772/PS4/"

log using ps4_13_7.log, replace

use GPA3.dta, clear

**Problem C13.7**


** question (i) **

reg trmgpa spring sat hsperc female black white frstsem tothrs crsgpa season

** question (ii) **


** question (iii) **

reg trmgpa spring frstsem tothrs crsgpa season

** question (iv) **

log cl
