gen transaction_date = date(tdate, "MDYhms")
format transaction_date %td

gen year_sale = year(transaction_date)
gen month_sale = month(transaction_date)
gen day_sale = day(transaction_date)
gen qtr_sale = quarter(transaction_date)

forvalues year = 1899(1)2016 {
gen y_`year' = 0
replace y_`year' = 1 if year_sale == `year'
}

gen time_since_flood = transaction_date - date("9/11/2013", "MDY")

drop if time_since_flood > 365 | time_since_flood < -365

drop if floodplain_sfha != "F" & floodplain_sfha != "T"

gen SFHA = 0
replace SFHA = 1 if floodplain_sfha == "T"

summ price if SFHA == 1 & time_since_flood < 0

summ price if SFHA == 1 & time_since_flood >= 0

summ price if SFHA == 0 & time_since_flood < 0

summ price if SFHA == 0 & time_since_flood >= 0

di 455173.9 - 440640.5

di 410915.4 - 394428.8

di 16486.6 - 14533.4

gen Post = 0
replace Post = 1 if time_since_flood >= 0

gen SFHA_Post = SFHA * Post

reg price Post SFHA SFHA_Post

twoway (lpoly price elevation if elevation > 1250 & elevation < 1750) (lpoly price elevation if elevation > 1750 & elevation < 2250), xline(1750) ytitle("Price") xtitle("Elevation") legend(label(1 "Homes below 1750 meters") label(2 "Homes above 1750 meters"))


reg price Post SFHA SFHA_Post
outreg2 using hw6_results.xls, excel keep(price Post SFHA SFHA_Post) replace

use "/Users/scott/Desktop/UNLV/ECO 770/HW6/DATA_for_HW6.dta", clear

gen elevation_squared = elevation * elevation

reg price elevation elevation_squared
outreg2 using hw6q13_results.xls, excel keep(price elevation elevation_squared) replace


gen transaction_date = date(tdate, "MDYhms")
format transaction_date %td

gen year_sale = year(transaction_date)
gen month_sale = month(transaction_date)
gen day_sale = day(transaction_date)
gen qtr_sale = quarter(transaction_date)

forvalues year = 1899(1)2016 {
gen y_`year' = 0
replace y_`year' = 1 if year_sale == `year'
}

gen year_of_sale_squared = year_sale * year_sale

gen age_of_home = year_sale - builtyear

gen age_squared = age_of_home * age_of_home

reg price elevation elevation_squared year_sale year_of_sale_squared age_of_home age_squared
outreg2 using hw6q13_results.xls, excel keep(price elevation elevation_squared year_sale year_of_sale_squared age_of_home age_squared) append

gen mainfloorsf_squared = mainfloorsf * mainfloorsf

reg price elevation elevation_squared year_sale year_of_sale_squared age_of_home age_squared mainfloorsf mainfloorsf_squared
outreg2 using hw6q13_results.xls, excel keep(price elevation elevation_squared year_sale year_of_sale_squared age_of_home age_squared mainfloorsf mainfloorsf_squared) append

twoway (lpoly price elevation if elevation > 1250 & elevation < 1750) (lpoly price elevation if elevation > 1750 & elevation < 2250), xline(1750) ytitle("Price") xtitle("Elevation") legend(label(1 "Homes below the Blue Line")label(2 "Homes above the Blue Line"))

summ price if elevation >= 1750 & elevation < 2250
summ price if elevation >= 1250 & elevation < 1750
di 303222.7 - 220732.6

gen treat_1750_2250 = 0 if elevation >= 1250 & elevation < 1750
replace treat_1750_2250 = 1 if elevation >= 1750 & elevation < 2250

reg price treat_1750_2250
outreg2 using hw6q17_results.xls, excel keep(price treat_1750_2250)

gen elev_m_1750 = elevation-1750 
gen treat_x_elev_m_1750 = elev_m_1750*treat_1750_2250

reg price treat_1750_2250 elev_m_1750 treat_x_elev_m_1750
outreg2 using hw6q17_results.xls, excel keep(price treat_1750_2250 elev_m_1750 treat_x_elev_m_1750) append
