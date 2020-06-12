cls
cd "C:\Users\shi_w\Desktop\proj\Wenjun"
import delimited C:\Users\shi_w\Desktop\proj\Wenjun\output.csv,clear

pwcorr crime_rate black_pct unemp_pct bachelor_pct median_income affordable_units ///
grocery_num library_count arts_count police_count abandoned_house graffiti_count ///
traffic_sum asian_pct population_density , sig star(.05)


regress crime_rate affordable_units grocery_num library_count arts_count police_count ///
abandoned_house graffiti_count traffic_sum black_pct asian_pct unemp_pct bachelor_pct ///
median_income population_density traffic_flow ,robust



foreach var in 5 10 15 20 30 50 80 100{
	gen se_`var' = .
}


quietly{
	foreach var in 5 10 15 20 30 50 80 100{
		gen temp =.
		forvalues x = 1(1)100{
			forvalues i = 1(1)`var'{
					preserve
					bsample 648
					regress crime_rate affordable_units grocery_num library_count arts_count police_count ///
					abandoned_house graffiti_count traffic_sum black_pct asian_pct unemp_pct bachelor_pct ///
					median_income population_density traffic_flow ,robust
					
					restore
					replace temp = _b[black_pct] in `i'
			}
		summarize temp
		replace se_`var' = r(sd) in `x'
		}
		drop temp
	}
}

graph box se_5 se_10 se_15 se_20 se_30 se_50 se_80 se_100, ytitle(Bootstrapped S.E.) title(Box Graph)
graph export "Bootstrapped_SE.png", as(png) replace

