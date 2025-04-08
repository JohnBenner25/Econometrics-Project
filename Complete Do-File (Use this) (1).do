**Author: John Zhengyi
**Purpose: ECOn203 Group Project

destring mapres10, replace
destring papres10, replace
destring prestg10, replace
*Creating Year Fixed Effects
tab year, gen (year_)

*Creating Marital Status Controls
gen marital_status = 0
replace marital_status=1 if marital == "Married"

*Creating Sex Controls
gen male = 0
replace male = 1 if sex == "MALE"

*Creating Race Controls
gen white = 0
replace white = 1 if race =="White"


*Creating Family situation at 16 controls
gen two_parents16 = 0
replace two_parents16 = 1 if family16 == "MOTHER & STPFATHER"
replace two_parents16 = 1 if family16=="FATHER & STPMOTHER"
replace two_parents16 = 1 if family16== "MOTHER & FATHER"
gen single_parent16 = 0
replace single_parent16 = 1 if family16 == "MOTHER" 
replace single_parent16 = 1 if family16 == "FATHER"

*Creating parents born in US controls
gen US_parents = 0
replace US_parents = 1 if parborn == "Both born in the u.s."

**Create Region Dummy Variables
tabulate region, generate(dum)
rename dum1 E_N_central
rename dum2 E_S_atlantic
rename dum3 Middle_atlantic
rename dum4 Mtn
rename dum5 New_engl
rename dum6 Pacific
rename dum7 S_Atlantic
rename dum8 W_N_Central
rename dum9 W_S_Central

replace age = "." if age == ".i: inapplicable"
replace age = "." if age == ".d Do not Know/Cannot Choose"
replace age = "." if age == ".s: Skipped on Web"
replace age = "." if age == ".z: Variable-specific reserve code"
replace age = "." if age == ".u: Uncodable"
replace age = "." if age == ".r: Refused"
replace age = "89" if age == "89 or older"
replace age = "." if age ==".n:  No answer"
destring age, replace
sum age
gen degree_number = 0
replace degree_number = 1 if degree == "High school"
replace degree_number = 2 if degree == "Associate/junior college"
replace degree_number = 3 if degree == "Bachelor's"
replace degree_number = 4 if degree == "Graduate"
replace degree = "." if degree == ".d: Do not Know/Cannot Choose"
replace degree = "." if degree == ".i: Inapplicable"
replace degree = "." if degree == ".i: inapplicable"
sum degree_number

gen familyincome16_number = 0
replace familyincome16_number = 1 if incom16 == "FAR BELOW AVERAGE"
replace familyincome16_number = 2 if incom16 == "BELOW AVERAGE"
replace familyincome16_number = 3 if incom16 == "AVERAGE"
replace familyincome16_number = 4 if incom16 == "ABOVE AVERAGE"
replace familyincome16_number = 5 if incom16 == "FAR ABOVE AVERAGE"
replace familyincome16_number = . if incom16 == "NA"
replace familyincome16_number = . if incom16 == "DK"

gen income_numbers = 0
replace income_numbers = . if rincom06 == ".i:  Inapplicable"
replace income_numbers = . if rincom06 == "."
replace income_numbers = . if rincom06 == ".i:  Inapplicable"
replace income_numbers = . if rincom06 == ".d:  Do not Know/Cannot Choose"
replace income_numbers = . if rincom06 == ".r:  Refused"
replace income_numbers = . if rincom06 == ".s:  Skipped on Web"
replace income_numbers = . if rincom06 == ".z:  Variable-specific reserve code"
replace income_numbers = . if rincom06 == ".x:  Not available in this release"
replace income_numbers = . if rincom06 == ".y:  Not available in this year"
replace income_numbers = . if rincom06 == ".j:  I do not have a job"
replace income_numbers = . if rincom06 == ".p:  Not applicable (I have not faced this decision)/Not imputable"
replace income_numbers = . if rincom06 == ".m:  DK, NA, IAP"
replace income_numbers = . if rincom06 == "IAP"
replace income_numbers = . if rincom06 == "REFUSED"
replace income_numbers = . if rincom06 == "NA"
replace income_numbers = 500 if rincom06 == "UNDER $1 000"
replace income_numbers = 1500 if rincom06 == "$1 000 TO 2 999"
replace income_numbers = 3500 if rincom06 == "$3 000 TO 3 999"
replace income_numbers = 4500 if rincom06 == "$4 000 TO 4 999"
replace income_numbers = 5500 if rincom06 == "$5 000 TO 5 999"
replace income_numbers = 6500 if rincom06 == "$6 000 TO 6 999"
replace income_numbers = 7500 if rincom06 == "$7 000 TO 7 999"
replace income_numbers = 89000 if rincom06 == "$8 000 TO 9 999"
replace income_numbers = 11250 if rincom06 == "$10000 TO 12499"
replace income_numbers = 13750 if rincom06 == "$12500 TO 14999"
replace income_numbers = 16250 if rincom06 == "$15000 TO 17499"
replace income_numbers = 18750 if rincom06 == "$17500 TO 19999"
replace income_numbers = 21250 if rincom06 == "$20000 TO 22499"
replace income_numbers = 23750 if rincom06 == "$22500 TO 24999"
replace income_numbers = 27500 if rincom06 == "$25000 TO 29999"
replace income_numbers = 32500 if rincom06 == "$30000 TO 34999"
replace income_numbers = 37500 if rincom06 == "$35000 TO 39999"
replace income_numbers = 45000 if rincom06 == "$40000 TO 49999"
replace income_numbers = 55000 if rincom06 == "$50000 TO 59999"
replace income_numbers = 67500 if rincom06 == "$60000 TO 74999"
replace income_numbers = 82500 if rincom06 == "$75000 TO $89999"
replace income_numbers = 100000 if rincom06 == "$90000 TO $109999"
replace income_numbers = 120000 if rincom06 == "$110000 TO $129999"
replace income_numbers = 140000 if rincom06 == "$130000 TO $149999"
replace income_numbers = 200000 if rincom06 == "$150000 OR OVER"

gen family16_numbers = 0
replace family16_numbers = 0 if family16 == "OTHER"
replace family16_numbers = . if family16 == ".i:  Inapplicable"
replace family16_numbers = . if family16 == ".n:  No answer"
replace family16_numbers = 1 if family16 == "MOTHER & FATHER"
replace family16_numbers = 2 if family16 == "FATHER & STPMOTHER"
replace family16_numbers = 3 if family16 == "MOTHER & STPFATHER"
replace family16_numbers = 4 if family16 == "FATHER"
replace family16_numbers = 5 if family16 == "MOTHER"
replace family16_numbers = 6 if family16 == "MALE RELATIVE"
replace family16_numbers = 7 if family16 == "FEMALE RELATIVE"
replace family16_numbers = 8 if family16 == "M AND F RELATIVES"


gen padeg_number = 0

replace padeg_number = 0 if padeg == "LT HIGH SCHOOL"
replace padeg_number = 1 if padeg == "LT HIGH SCHOOL"
replace padeg_number = 2 if padeg == "ASSOCIATE/JUNIOR COLLEGE"
replace padeg_number = 3 if padeg == "BACHELOR"
replace padeg_number = 4 if padeg == "GRADUATE"
replace padeg_number = . if padeg == ".r:  Refused"
replace padeg_number = . if padeg == ".y:  Not available in this year"
replace padeg_number = . if padeg == ".j:  I do not have a job"
replace padeg_number = . if padeg == ".p:  Not applicable (I have not faced this decision)/Not imputable"
replace padeg_number = . if padeg == ".m:  DK, NA, IAP"
sum padeg_number

** Mother's Degree
gen madeg_number = 0
replace madeg_number = 0 if madeg == "LT HIGH SCHOOL"
replace madeg_number = 1 if madeg == "LT HIGH SCHOOL"
replace madeg_number = 2 if madeg == "ASSOCIATE/JUNIOR COLLEGE"
replace madeg_number = 3 if madeg == "BACHELOR"
replace madeg_number = 4 if madeg == "GRADUATE"
replace madeg_number = . if madeg == ".r:  Refused"
replace madeg_number = . if madeg == ".y:  Not available in this year"
replace madeg_number = . if madeg == ".j:  I do not have a job"
replace madeg_number = . if madeg == ".p:  Not applicable (I have not faced this decision)/Not imputable"
replace madeg_number = . if madeg == ".m:  DK, NA, IAP"

**Create Region Dummy Variables
tabulate region, generate(dum)
rename dum1 Dum_East_north_central
rename dum2 Dum_East_south_atlantic
rename dum3 Dum_Middle_atlantic
rename dum4 Dum_Mountain
rename dum5 Dum_New_england
rename dum6 Dum_Pacific
rename dum7 Dum_South_atlantic
rename dum8 Dum_West_north_central
rename dum9 Dum_West_south_central


*Create Religion Dummy Variable
gen religious = 0
replace religious = 1 if reliten == "Strong"
replace religious = 1 if reliten == "Somewhat strong (vol.)"

replace reliten = "." if reliten == ".i:  Inapplicable"
replace reliten = "." if reliten == ".n:  No answer"
replace reliten ="." if reliten == ".d:  Do not Know/Cannot Choose"

*Create Health Dummy"
gen great_health = 0
replace great_health = 1 if health == "Excellent"
replace great_health = 1 if health == "Good"
replace health = "." if reliten == ".i:  Inapplicable"
replace health = "." if reliten == ".n:  No answer"
replace health ="." if reliten == ".d:  Do not Know/Cannot Choose"

*Create Drug Dummy Variables
gen drug_history = 0
replace drug_history = 1 if idu30 == "MORE THAN 3 YEARS AGO"
replace drug_history = 1 if idu30 == "WITHIN THE PAST 30 DAYS"
replace drug_history = 1 if idu30 == "MORE THAN 12 MONTHS AGO BUT WITHIN THE PAST 3 YEARS"
replace drug_history = 1 if idu30 == "MORE THAN 30 DAYS AGO BUT WITHIN THE PAST 12 MONTHS"


*Create Prestige Score Control Variable (it's a numerical variable)
replace prestg10 = "." if prestg10 == ".i:  Inapplicable"

*Create Father'ｓ　Ｊｏｂ Prestige Score Control Variable (it's a numerical variable)
replace papres10 = "." if papres10 == ".i:  Inapplicable"

*Create Father'ｓ　Ｊｏｂ Prestige Score Control Variable (it's a numerical variable)
replace mapres10 = "." if mapres10 == ".i:  Inapplicable"


*creating variables for specific educational attainments

gen bachelor = 0
replace bachelor = 1 if degree == "Bachelor's"

gen Less_than_hs= 0
replace Less_than_hs = 1 if degree == "Less than high school"

gen High_School = 0
replace High_School = 1 if degree == "High school"

gen Associate_JC = 0
replace Associate_JC = 1 if degree == "Less than high school"

gen Graduate = 0
replace Graduate = 1 if degree == "Graduate"

*Assess Income Group
tab income_numbers
sum income_numbers, d

*Income Group Variable for Probit
gen incomegroupbymedian = 0
replace incomegroupbymedian = 1 if income_numbers >= 32500 
replace incomegroupbymedian = 0 if income_numbers < 32500

**Regress by family income group 

gen newgroupfamilyincome = 0
replace newgroupfamilyincome = 0 if familyincome16_number <= 3
replace newgroupfamilyincome = 1 if familyincome16_number >= 4

