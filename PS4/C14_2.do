clear
clear all
set more off

cd "/Users/scott/Desktop/UNLV/ECO 772/PS4/"

log using ps4_14_2.log, replace

use CRIME4.dta, clear

**Problem C14.2**


** question (i) **

reg lcrmrte d82 d83 d84 d85 d86 d87 lprbarr lprbconv lprbpris lavgsen lpolpc

** question (ii) **

reg lcrmrte d82 d83 d84 d85 d86 d87 lprbarr lprbconv lprbpris lavgsen lpolpc lwcon lwfed lwfir lwloc lwmfg lwser lwsta lwtrd lwtuc

** question (iii) **


** question (iv) **



log cl
