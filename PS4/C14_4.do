clear
clear all
set more off

cd "/Users/scott/Desktop/UNLV/ECO 772/PS4/"

log using ps4_14_4.log, replace

use EZUNEM.dta, clear

**Problem C14.4**


** question (i) **



** question (ii) **

reg luclms cez ez

** question (iii) **

reg luclms cez ez d81 d82 d83 d84 d85 d86 d87 d88


log cl
