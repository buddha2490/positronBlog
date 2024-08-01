libname NHIS sas7bdat "/users/briancarter/onedrive/myBlogs/positronBlog/data";


proc contents data = one; run;

* subset main data *;
data one; set NHIS.nhisData (keep = 
WTFA_A  SRVY_YR SEX_A AGEP_A
    RACEALLP_A EDUCP_A BLADDCAN_A BLOODCAN_A
    BONECAN_A BRAINCAN_A BREASCAN_A CERVICAN_A
    COLONCAN_A ESOPHCAN_A GALLBCAN_A LARYNCAN_A
    LEUKECAN_A LIVERCAN_A LUNGCAN_A LYMPHCAN_A
    MELANCAN_A MOUTHCAN_A OVARYCAN_A PANCRCAN_A
    PROSTCAN_A RECTUCAN_A SKNMCAN_A SKNNMCAN_A
    SKNDKCAN_A STOMACAN_A THROACAN_A THYROCAN_A
    UTERUCAN_A HDNCKCAN_A COLRCCAN_A OTHERCANP_A
    SMKEV_A SMKNOW_A SMKCIGST_A CIGNOW_A HEIGHTTC_A
    WEIGHTLBTC_A);
run;

proc format library = work;

value agecat
    1 = "<30"
    2 = "30-39"
    3 = "40-49"
    4 = "50-59"
    5 = "60-69"
    6 = "70-79"
    7 = "80+"
    ;
    value racenew
    1 = "White"
    2 = "Black"
    3 = "Asian"
    4 = "AIAN"
    5 = "Mixed"
    ;


    value educ
    1 = "<HS"
    2 = "HS Grad"
    3 = "Some College"
    4 = "College Graduate"
    5 = "Graduate/Professional degree"
    9 = "Missing"
    ;


    value smokestatus
    1 = "Never smoker"
    2 = "Former smoker"
    3 = "Current smoker"
    4 = "Ever smoker"
    9 = "Missing"
    ;

value bmicat
    1 = "Underweight"
    2 = "Normal weight"
    3 = "Overweight"
    4 = "Obese"
    9 = "Missing"
    ;
run;


* prepare my cohort *;
data two;  set one;

* Sex *;
    if SEX_A = 2 then sex = "Female";
else if SEX_A = 1 then sex = "Male";
else sex = "";

* Age *;
    if AGEP_A in (97, 98, 99) then age = .;
else age = AGEP_A;

* age categories *;
    if .<age < 30 then agecat = 1;
else if 30<=age<40 then agecat = 2;
else if 40<=age<50 then agecat = 3;
else if 50<=age<60 then agecat = 4;
else if 60<=age<70 then agecat = 5;
else if 70<=age<80 then agecat = 6;
else if age NE . then agecat = 7;
else agecat = .;
format agecat agecat.;



* race *;
    if RACEALLP_A = 1 then racenew = 1;
else if RACEALLP_A = 2 then racenew = 2;
else if RACEALLP_A = 3 then racenew = 3;
else if RACEALLP_A = 4 then racenew = 4;
else if RACEALLP_A in (5,6) then racenew = 5;
else racenew = 9;
format racenew racenew.;

* Education *;
    if EDUCP_A in(0,1,2) then educ = 1; 
else if EDUCP_A in(3,4) then educ = 2;
else if EDUCP_A in(5,6,7) then educ = 3;
else if EDUCP_A = 8 then educ = 4;
else if EDUCP_A in(9,10) then educ = 5;
else if EDUCP_A in(97,98,99,.) then educ = 9;
format educ educ.;


array orig (*) BLADDCAN_A BLOODCAN_A
    BONECAN_A BRAINCAN_A BREASCAN_A CERVICAN_A
    ESOPHCAN_A GALLBCAN_A LARYNCAN_A
    LEUKECAN_A LIVERCAN_A LUNGCAN_A LYMPHCAN_A
    MELANCAN_A MOUTHCAN_A OVARYCAN_A PANCRCAN_A
    PROSTCAN_A
    STOMACAN_A THROACAN_A THYROCAN_A
    UTERUCAN_A HDNCKCAN_A COLRCCAN_A OTHERCANP_A;

array derived (*) bladder blood bone brain breast cervix
              esoph gallbladder larynx leukemia
              liver lung lymphoma melanoma oral ovary
              pancreas prostate stomach throat
              thyroid uterine hodgkins crc other;
do i = 1 to dim(orig);
    if orig{i} = 1 then derived{i} = 1;
    else derived{i} = 0;
end;


* recode sex-specific sites *
if sex = "Male" then breast = .;
if sex = "Male" then uterine = .;
if sex = "Male" then cervix = .;
if sex = "Female" then prostate = .;


* Smoking variables *;
    if  smkev_a = 2 then smokestatus = 1;
else if smkev_a = 1 and smknow_a in (1,2) then smokestatus = 3;
else if smkev_a = 1 and smknow_a = 3 then smokestatus = 2;
else smokestatus = 9;
format smokestatus smokestatus.;


* Cigarettes per day *;
if smkev_a = 2 and CIGNOW_A not in (97,98,99) then cpdnow = CIGNOW_A;

* Anthropometry *;

* Height in inches to CM *;
if HEIGHTTC_A NOT in (96,97,98,99,.) then heightcm = HEIGHTTC_A * 2.54;

* Weight in pounds to kilograms *;
if WEIGHTLBTC_A NOT in (996, 997, 998, 999) then weightkg = WEIGHTLBTC_A * 0.453592;

* BMI = weightkg / m**2;
bmi = weightkg / (heightcm / 100)**2;

* BMI Categories *;
if . < bmi < 18.5 then bmicat = 1;
else if 18.5 <= bmi < 25 then bmicat = 2;
else if 25 <= bmi < 30 then bmicat = 3;
else if 30 <= bmi then bmicat = 4;
else bmicat = 9;
format bmicat bmicat.;


run;




data NHIS.analytic; set two (keep = bmi bmicat weightkg heightcm cpdnow smokestatus
        bladder blood bone brain breast cervix
        esoph gallbladder larynx leukemia
        liver lung lymphoma melanoma oral ovary
        pancreas prostate stomach throat
        thyroid uterine hodgkins crc other educ
        racenew agecat age sex WTFA_A SRVY_YR);





* exclusions *;
* 1. Missing Age
* 2. Missing smoking
* 3. Missing sex
;

    if age = . then exclusion = 1;
else if smokestatus = 9 then exclusion = 2;
else if sex = "" then exclusion = 3;
else exclusion = 9;


if exclusion = 9;


label bmi= "BMI (kg/m2)";
label bmicat = "WHO BMI Categories";
label weightkg = "Weight in KG";
label heightcm = "Height (cm)";
label cpdnow = "Cigarettes per day (current smokers)";
label smokestatus = "Smoking status";
label educ = "Education level";
label racenew = "Self-identified race";
label agecat = "Age categories";
label age = "Age at baseline";
label sex = "Sex at birth";
label WTFA_A = "Sampling weight";
label SRVY_YR = "Survey year";


label bladder = "Bladder cancer";
label blood  = "Heme cancer";
label bone = "Bone cancer";
label brain = "Brian cancer";
label breast = "Breast cancer";
label cervix = "Cervical cancer"
label esoph  = "Esophageal cancer";
label gallbladder  = "Gallbladder cnacer";
label larynx  = "Laryngeal cancer";
label leukemia = "Leukemia";
label liver = "Liver cancer";
label lung = "Lung cancer";
label lymphoma = "Lymphoma";
label melanoma = "Melanoma";
label oral = "Oral cancer";
label ovary = "Ovarian cancer";
label pancreas = "Pancreatic cancer";
label prostate = "Prostate cancer";
label stomach  = "Stomach cancer";
label throat = "Throat cancer";
label thyroid = "Thyroid cancer";
label uterine  = "Uterine cancer";
label hodgkins = "Hodgins lymphoma";
label crc = "Colorectal cancer";
label other = "All other cancers";



run;



proc contents data = NHIS.analytic; run;