cls
cd "C:\Users\shi_w\Desktop\proj\Wenjun"
import delimited C:\Users\shi_w\Desktop\proj\Wenjun\output_syn.csv,clear

encode city, generate(city2)

tsset city2 years
synth crime_rate race_total median_income asian_pct white_pct black_pct crime_rate(2010) crime_rate(2011) crime_rate(2012) crime_rate(2013) crime_rate(2014), trunit(2) trperiod(2015) xperiod(2010(1)2014) nested fig
graph export "synth.png", as(png) replace



forval i =1/11{
di `i'

	qui synth crime_rate race_total median_income asian_pct white_pct black_pct crime_rate(2010) crime_rate(2011) crime_rate(2012) crime_rate(2013) crime_rate(2014), trunit(`i') trperiod(2015) xperiod(2010(1)2014) keep(synth_`i', replace)
}



forval i=1/11{
	use synth_`i', clear
	rename _time years
	gen tr_effect_`i' = _Y_treated - _Y_synthetic
	keep years tr_effect_`i'
	drop if missing(years)
	save synth_`i', replace
}


forval i=1/11{
	qui merge 1:1 years using synth_`i', nogenerate
}


//graph
local lp
forval i=1/11{
   local lp `lp' line tr_effect_`i' years, lcolor(gs12) ||
}

twoway `lp' || line tr_effect_2 years, ///
lcolor(orange) legend(off) xline(2015, lpattern(dash))

graph export "synth_test.png", as(png) replace
