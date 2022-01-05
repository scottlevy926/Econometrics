global path /Users/scott/Desktop/UNLV/ECO 770/HW3/

import delimited "$path/FEDFUNDS.csv",clear

save "$path/FEDFUNDS.dta"

import delimited "$path/CPILFESL.csv",clear

save "$path/CPILFESL.dta"

merge m:1 date using "$path/FEDFUNDS.dta"

drop if _merge !=3

gen date2 = date(date, "YMD")
sort date2

format date2 %tdMon-CCYY

gen month = mofd(date2) // get date in month format
format month %tm
tsset month

gen cpilfesl_delta = (cpilfesl/L12.cpilfesl-1)*100

format date2 %tdMon-CCYY

rename fedfunds fed_funds
rename cpilfesl_delta CPI

line fed_funds CPI date2, lwidth(medthin) lpattern("_-." "__#")
title("Federal Funds Rate VS CPI % Change" ,size(medlarge) color(green) ) lcolor(blue) xmtick(#35,tlcolor(red)) xlabel(, labcolor(green) ) ymtick(##10,tlcolor(red)) ylabel(#5, labcolor(green)
nogrid) xtitle(Date, color(green)) , ytitle(Rate, color(white) ) ,
graphregion(color(white)) plotregion(fcolor(gray))
