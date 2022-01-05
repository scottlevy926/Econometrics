clear
clear all
set more off

cd "/Users/scott/Desktop/UNLV/ECO 772/PS4/"

log using ps4_13_10.log, replace

use JTRAIN.dta, clear

**Problem C13.10**


** question (i) **

reg hrsemp d89 grant grant_1 lemploy
count if d88==1
count if d89==1
count if fcode

** question (ii) **


** question (iii) **


** question (iv) **

reg hrsemp d89 grant grant_1 employ

log cl
