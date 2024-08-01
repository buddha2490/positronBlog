/* ----------------------------------------------------------------------------
 
   The National Health Interview Survey (NHIS) 2023;
 
                 Sample Adult data file
 
    This program loads the NHIS sample adult ASCII data file downloaded from the
    NCHS website (https://www.cdc.gov/nchs/nhis/index.htm) to a SAS dataset.
    The program creates descriptive variable labels and formats with meaningful
    category labels. It sets the variable lengths and uses input statements to
    read in the data. It ends with some sample proc freq calls to verify that
    the data were correctly loaded.
 
    Before running this program, please:
    - Download the sample adult ASCII file to a folder called C:\NHIS2023
      (on a machine running Windows)
    - Configure the macro variables 'nhisfolder', 'adultds' and 'formatcat' below.
      These variables set: the local folder where the ASCII file is located and
      where the SAS dataset will be saved, the name of the sample adult dataset,
      and the name of the catalog where formats are to be saved, respectively.
*/

/* 
    To prevent format associations from being stored with data set, when running the 
    'SAS input statements,' either put an asterisk(*) before the word "format"
    in the section of the program for 'format associations,' [scroll about 3/4 of the way
    down the program] or, add "FORMAT _ALL_;" in the frequency procedure to see the values
    of the variables without their value label.
*/

/* 
    Path to the folder where the NHIS ASCII file is located. Also where the
    permanent SAS dataset will be stored
*/
%let nhisfolder= /users/briancarter/onedrive/myBlogs/positronBlog/data;


/* name of the dataset to load into */
%let adultds=nhisData;

/* formats are stored temporarily in catalog in WORK.formats */
%let formatcat=WORK.formats;

/* --- DO NOT EDIT BELOW THIS LINE --- */
libname NHIS sas7bdat "&nhisfolder";
filename ASCIIDAT "&nhisfolder/adult23.dat";
 
/* formats for variables */
proc format library=&formatcat;
 
    VALUE SA001X
         00               = "00 0"
         1-9              = "1-9"
         10               = "10 10+"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA002X
         1-84             = "1-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA003X
         18-84            = "18-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA004X
         20               = "20 years or younger"
         21-84            = "21-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA005X
         18               = "18 years or younger"
         19-84            = "19-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA006X
         59-76            = "59-76 inches"
         96               = "96 Not available"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA007X
         1                = "1 Underweight"
         2                = "2 Healthy weight"
         3                = "3 Overweight"
         4                = "4 Obese"
         9                = "9 Unknown"
    ;
 
    VALUE SA008X
         1                = "1 Reassigned to CHIP from private"
    ;
 
    VALUE SA009X
         1                = "1 Yes, a citizen of the United States"
         2                = "2 No, not a citizen of the United States"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA010X
         1                = "1 Private"
         2                = "2 Medicaid and other public"
         3                = "3 Other coverage"
         4                = "4 Uninsured"
         5                = "5 Don't Know"
    ;
 
    VALUE SA011X
         1                = "1 Private"
         2                = "2 Dual eligible"
         3                = "3 Medicare Advantage"
         4                = "4 Medicare only excluding Medicare Advantage"
         5                = "5 Other coverage"
         6                = "6 Uninsured"
         7                = "7 Don't Know"
    ;
 
    VALUE SA012X
         0-129            = "0-129 days"
         130              = "130 130+ days"
         997              = "997 Refused"
         998              = "998 Not Ascertained"
         999              = "999 Don't Know"
    ;
 
    VALUE SA013X
         00               = "00 0 days"
         1-9              = "1-9 days"
         10               = "10 10+ days"
         91               = "91 Did not work"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA014X
         1                = "1"
         2                = "2"
         3                = "3"
         4                = "4"
         5                = "5 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA015X
         00               = "00 Within past year"
         1-84             = "1-84 years"
         96               = "96 Age 85+ and diagnosed at age 85+"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA016X
         1                = "1 Current e-cigarette user"
         2                = "2 Used e-cigarette, not current user"
         3                = "3 Never e-cigarette user"
         4                = "4 E-cigarette user, current status unknown"
         9                = "9 Unknown if ever used e-cigarette"
    ;
 
    VALUE SA017X
         01               = "01 Grade 0-11"
         02               = "02 12th grade, no diploma"
         03               = "03 GED or equivalent"
         04               = "04 High School Graduate"
         05               = "05 Some college, no degree"
         06               = "06 Associate degree: occupational, technical, or vocational program"
         07               = "07 Associate degree: academic program"
         08               = "08 Bachelor's degree (Example: BA, AB, BS, BBA)"
         09               = "09 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
         10               = "10 Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA018X
         0                = "0 times"
         1                = "1 time"
         2                = "2 times"
         3                = "3 times"
         4                = "4 4+ times"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA019X
         1-94             = "1-94 hours"
         95               = "95 95+ hours"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA020X
         1                = "1 Exchange plan"
         2                = "2 Not exchange plan"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA021X
         1                = "1 Company provides exchange plans"
         2                = "2 Not an exchange company"
         3                = "3 Exchange Portal or exact exchange plan name"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA022X
         1                = "1 Food secure"
         2                = "2 Low food security"
         3                = "3 Very low food security"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA023X
         1                = "1 High food security"
         2                = "2 Marginal food security"
         3                = "3 Low food security"
         4                = "4 Very low food security"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA024X
         1                = "1 Positive"
         2                = "2 Negative"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA025X
         1                = "1 Person is sample adult"
    ;
 
    VALUE SA026X
         1-39999          = "$1 - $39,999"
         40000            = "40000 $40,000 or more"
         99997            = "99997 Refused"
         99998            = "99998 Not Ascertained"
         99999            = "99999 Don't Know"
    ;
 
    VALUE SA027X
         1                = "1 Hispanic (Mexican/Mexican American)"
         2                = "2 Hispanic (all other groups)"
         3                = "3 Not Hispanic"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA028X
         01               = "01 Hispanic"
         02               = "02 Non-Hispanic White only"
         03               = "03 Non-Hispanic Black/African American only"
         04               = "04 Non-Hispanic Asian only"
         05               = "05 Non-Hispanic AIAN only"
         06               = "06 Non-Hispanic AIAN and any other group"
         07               = "07 Other single and multiple races"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE $SA029X
         '0'              = "'0' Income reported"
         '1'              = "'1' Income imputed; no other information"
         '2'              = "'2' Income imputed; reported in income brackets"
         'Blank'          = "'Blank' No Sample Adult or Sample Child in household"
    ;
 
    VALUE SA030X
         01               = "01 Crop production"
         02               = "02 Animal production and aquaculture"
         03               = "03 Forestry and logging"
         04               = "04 Fishing, hunting, and trapping"
         05               = "05 Support activities for agriculture and forestry"
         06               = "06 Oil and gas extraction"
         07               = "07 Mining (except oil and gas)"
         08               = "08 Support activities for mining"
         09               = "09 Utilities industries"
         10               = "10 Construction industries"
         11               = "11 Food manufacturing"
         12               = "12 Beverage and tobacco product manufacturing"
         13               = "13 Textile mills"
         14               = "14 Textile product mills"
         15               = "15 Apparel manufacturing"
         16               = "16 Leather and allied product manufacturing"
         17               = "17 Wood product manufacturing"
         18               = "18 Paper manufacturing"
         19               = "19 Printing and related support activities"
         20               = "20 Petroleum and coal products manufacturing"
         21               = "21 Chemical manufacturing"
         22               = "22 Plastics and rubber products manufacturing"
         23               = "23 Nonmetallic mineral product manufacturing"
         24               = "24 Primary metal manufacturing"
         25               = "25 Fabricated metal product manufacturing"
         26               = "26 Machinery manufacturing"
         27               = "27 Computer and electronic product manufacturing"
         28               = "28 Electrical equipment, appliance, and component manufacturing"
         29               = "29 Transportation equipment manufacturing"
         30               = "30 Furniture and related product manufacturing"
         31               = "31 Miscellaneous manufacturing"
         32               = "32 Merchant wholesalers, durable goods"
         33               = "33 Merchant wholesalers, nondurable goods"
         34               = "34 Non-specified wholesale trade"
         35               = "35 Motor vehicle and parts dealers"
         36               = "36 Furniture and home furnishings stores"
         37               = "37 Electronics and appliance stores"
         38               = "38 Building material and garden equipment and supplies dealers"
         39               = "39 Food and beverage stores"
         40               = "40 Health and personal care stores"
         41               = "41 Gasoline stations"
         42               = "42 Clothing, shoe, jewelry, luggage, and leather goods stores"
         43               = "43 Sporting goods, camera, hobby, book and music stores"
         44               = "44 General merchandise stores"
         45               = "45 Miscellaneous store retailers"
         46               = "46 Nonstore retailers and non-specified retail trade"
         47               = "47 Transportation (including support activities for transportation)"
         48               = "48 Postal service, couriers, and messengers"
         49               = "49 Warehousing and storage"
         50               = "50 Newspaper, periodical, book, and software publishing industries"
         51               = "51 Motion picture, video, and sound recording industries"
         52               = "52 Broadcasting and telecommunications"
         53               = "53 Libraries and archives, internet publishing, web search portals, data processing and hosting services, and other information services"
         54               = "54 Monetary authorities -- central bank"
         55               = "55 Credit intermediation and related activities"
         56               = "56 Securities, commodity contracts, and other financial investments and related activities"
         57               = "57 Insurance carriers and related activities"
         58               = "58 Real estate"
         59               = "59 Automotive and other consumer goods rental and leasing services"
         60               = "60 Commercial, industrial, and other intangible assets (except copyrighted works)"
         61               = "61 Professional, scientific, and technical services industries"
         62               = "62 Management of companies and enterprises industries"
         63               = "63 Administrative and support and waste management and remediation services industries"
         64               = "64 Education services industries"
         65               = "65 Ambulatory health care services"
         66               = "66 Hospitals"
         67               = "67 Nursing and residential care facilities"
         68               = "68 Social assistance"
         69               = "69 Performing arts, spectator sports, promoters, agents, artists, writers and related industries"
         70               = "70 Museums, historical sites, and similar institutions"
         71               = "71 Amusement, gambling, and recreation industries"
         72               = "72 Accommodation"
         73               = "73 Food services and drinking places"
         74               = "74 Repair and maintenance"
         75               = "75 Personal services (barber shops, beauty salons, nail salons, laundry, funeral homes and cemetaries)"
         76               = "76 Religious, grantmaking, civic, labor, professional, and similar organizations"
         77               = "77 Private households"
         78               = "78 Public administration industries"
         79               = "79 Armed forces"
         97               = "97 Refused, classified"
         98               = "98 Not ascertained"
         99               = "99 Don't know"
    ;
 
    VALUE SA031X
         01               = "01 Agriculture, Forestry, Fishing, and Hunting Industries"
         02               = "02 Mining Industries"
         03               = "03 Utilities Industries"
         04               = "04 Construction Industries"
         05               = "05 Manufacturing Industries"
         06               = "06 Wholesale Trade Industries"
         07               = "07 Retail Trade Industries"
         08               = "08 Transportation and Warehousing Industries"
         09               = "09 Information Industries"
         10               = "10 Finance and Insurance Industries"
         11               = "11 Real Estate and Rental and Leasing Industries"
         12               = "12 Professional, Scientific, and Technical Services Industries"
         13               = "13 Management of Companies and Enterprises Industries"
         14               = "14 Administrative and Support and Waste Management and Remediation Services Industries"
         15               = "15 Education Services Industries"
         16               = "16 Health Care and Social Assistance Industries"
         17               = "17 Arts, Entertainment, and Recreation Industries"
         18               = "18 Accommodation and Food Services Industries"
         19               = "19 Other Services (except Public Administration) Industries"
         20               = "20 Public Administration Industries"
         21               = "21 Armed Forces"
         97               = "97 Refused, classified"
         98               = "98 Not ascertained"
         99               = "99 Don't know"
    ;
 
    VALUE SA032X
         1                = "1 Yes, information"
         2                = "2 Yes, but no information"
         3                = "3 No"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA033X
         01               = "01 January"
         02               = "02 February"
         03               = "03 March"
         04               = "04 April"
         05               = "05 May"
         06               = "06 June"
         07               = "07 July"
         08               = "08 August"
         09               = "09 September"
         10               = "10 October"
         11               = "11 November"
         12               = "12 December"
    ;
 
    VALUE SA034X
         1                = "1 Quarter 1"
         2                = "2 Quarter 2"
         3                = "3 Quarter 3"
         4                = "4 Quarter 4"
    ;
 
    VALUE SA035X
         1                = "1 Spanish"
         2                = "2 Other Language"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA036X
         100-299          = "100-299 pounds"
         996              = "996 Not available"
         997              = "997 Refused"
         998              = "998 Not Ascertained"
         999              = "999 Don't Know"
    ;
 
    VALUE SA037X
         1                = "1 Separated"
         2                = "2 Divorced"
         3                = "3 Married"
         4                = "4 Single/never married"
         5                = "5 Widowed"
         9                = "9 Unknown legal marital status"
    ;
 
    VALUE SA038X
         1                = "1 Reassigned to Medicaid from private"
    ;
 
    VALUE SA039X
         1                = "1 Married, spouse is present"
         2                = "2 Married, spouse is not present"
         3                = "3 Married, spouse presence unknown"
         4                = "4 Widowed"
         5                = "5 Divorced"
         6                = "6 Separated"
         7                = "7 Never married"
         8                = "8 Living with a partner"
         9                = "9 Unknown marital status"
    ;
 
    VALUE SA040X
         1                = "1 Medicare Advantage"
         2                = "2 Private plan not Medicare Advantage"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA041X
         1                = "1 Mentioned"
         2                = "2 Not mentioned"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA042X
         1                = "1 Multiple families in household"
         2                = "2 Only one family in household"
         9                = "9 Unknown"
    ;
 
    VALUE SA043X
         0                = "0 None"
         1                = "1 or more"
    ;
 
    VALUE SA044X
         1                = "1 Not covered"
         2                = "2 Covered"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA045X
         01               = "01 Chief executives; general and operations managers; legislators"
         02               = "02 Advertising, marketing, promotions, public relations, and sales managers"
         03               = "03 Administrative services, compensation/benefits, human resources, training, production, purchasing, and transportion/distribution, and other operations managers"
         04               = "04 All other management occupations"
         05               = "05 Business operations specialists"
         06               = "06 Financial specialists"
         07               = "07 Computer specialists"
         08               = "08 Mathematical science occupations"
         09               = "09 Architects, surveyors, and cartographers"
         10               = "10 Engineers"
         11               = "11 Drafters, engineering, and mapping technicians"
         12               = "12 Life scientists"
         13               = "13 Physical scientists"
         14               = "14 Social scientists and related workers"
         15               = "15 Life, physical, and social science technicians"
         16               = "16 Counselors, social workers, and other community and social service specialists"
         17               = "17 Religious workers"
         18               = "18 Lawyers, judges, and related workers"
         19               = "19 Legal support workers"
         20               = "20 Postsecondary teachers"
         21               = "21 Primary, secondary, and special education school teachers"
         22               = "22 Other teachers and instructors"
         23               = "23 Librarians, curators, and archivists"
         24               = "24 Other educational instruction and library occupations"
         25               = "25 Art and design workers"
         26               = "26 Entertainers and performers, sports and related workers"
         27               = "27 Media and communication workers"
         28               = "28 Media and communication equipment workers"
         29               = "29 Health diagnosing and treating practitioners"
         30               = "30 Health technologists and technicians"
         31               = "31 Other healthcare practitioners and technical occupations"
         32               = "32 Nursing, psychiatric, and home health aides"
         33               = "33 Occupational and physical therapist assistants and aides"
         34               = "34 Other healthcare support occupations"
         35               = "35 First-line supervisors/managers, protective service workers"
         36               = "36 Fire fighting and prevention workers"
         37               = "37 Law enforcement workers"
         38               = "38 Other protective service workers"
         39               = "39 Supervisors, food preparation and serving workers"
         40               = "40 Cooks and food preparation workers"
         41               = "41 Food and beverage serving workers"
         42               = "42 Other food preparation and serving related workers"
         43               = "43 Supervisors, building and grounds cleaning and maintenance workers"
         44               = "44 Building cleaning and pest control workers"
         45               = "45 Grounds maintenance workers"
         46               = "46 Supervisors, personal care and service workers"
         47               = "47 Animal care and service workers"
         48               = "48 Entertainment attendants and related workers"
         49               = "49 Funeral service workers"
         50               = "50 Personal appearance workers"
         51               = "51 Transportation, tourism, and lodging attendants"
         52               = "52 Other personal care and service workers"
         53               = "53 Supervisors, sales workers"
         54               = "54 Retail sales workers"
         55               = "55 Sales representatives, services"
         56               = "56 Sales representatives, wholesale and manufacturing"
         57               = "57 Other sales and related workers"
         58               = "58 Supervisors, office and administrative support workers"
         59               = "59 Communications equipment operators"
         60               = "60 Financial clerks"
         61               = "61 Information and record clerks"
         62               = "62 Material recording, scheduling, dispatching, and distributing workers"
         63               = "63 Secretaries and administrative assistants"
         64               = "64 Other office and administrative support workers"
         65               = "65 Supervisors, farming, fishing, and forestry workers"
         66               = "66 Agricultural workers"
         67               = "67 Fishing and hunting workers"
         68               = "68 Forest, conservation, and logging workers"
         69               = "69 Supervisors, construction and extraction workers"
         70               = "70 Construction trades workers"
         71               = "71 Helpers, construction trades"
         72               = "72 Other construction and related workers"
         73               = "73 Extraction workers"
         74               = "74 Supervisors of installation, maintenance, and repair workers"
         75               = "75 Electrical and electronic equipment mechanics, installers, and repairers"
         76               = "76 Vehicle and mobile equipment mechanics, installers, and repairers"
         77               = "77 Other installation, maintenance, and repair occupations"
         78               = "78 Supervisors, production workers"
         79               = "79 Assemblers and fabricators"
         80               = "80 Food processing workers"
         81               = "81 Metal workers and plastic workers"
         82               = "82 Printing workers"
         83               = "83 Textile, apparel, and furnishings workers"
         84               = "84 Woodworkers"
         85               = "85 Plant and system operators"
         86               = "86 Other production occupations"
         87               = "87 Supervisors, transportation and material moving workers"
         88               = "88 Air transportation workers"
         89               = "89 Motor vehicle operators"
         90               = "90 Rail transportation workers"
         91               = "91 Water transportation workers"
         92               = "92 Other transportation workers"
         93               = "93 Material moving workers"
         94               = "94 Military specific occupations"
         97               = "97 Refused, classified"
         98               = "98 Not ascertained"
         99               = "99 Don't know"
    ;
 
    VALUE SA046X
         01               = "01 Management Occupations"
         02               = "02 Business and Financial Operations Occupations"
         03               = "03 Computer and Mathematical Occupations"
         04               = "04 Architecture and Engineering Occupations"
         05               = "05 Life, Physical, and Social Science Occupations"
         06               = "06 Community and Social Services Occupations"
         07               = "07 Legal Occupations"
         08               = "08 Educational Instruction and Library Occupations"
         09               = "09 Arts, Design, Entertainment, Sports and Media Occupations"
         10               = "10 Healthcare Practitioners and Technical Occupations"
         11               = "11 Healthcare Support Occupations"
         12               = "12 Protective Service Occupations"
         13               = "13 Food Preparation and Serving Related Occupations"
         14               = "14 Building and Grounds Cleaning and Maintenance Occupations"
         15               = "15 Personal Care and Service Occupations"
         16               = "16 Sales and Related Occupations"
         17               = "17 Office and Administrative Support Occupations"
         18               = "18 Farming, Fishing, and Forestry Occupations"
         19               = "19 Construction and Extraction Occupations"
         20               = "20 Installation, Maintenance, and Repair Occupations"
         21               = "21 Production Occupations"
         22               = "22 Transportation and Material Moving Occupations"
         23               = "23 Military Specific Occupations"
         97               = "97 Refused, classified"
         98               = "98 Not ascertained"
         99               = "99 Don't know"
    ;
 
    VALUE SA047X
         1                = "1 Reassigned to other government from private"
    ;
 
    VALUE SA048X
         1                = "1 ^GayLesbian"
         2                = "2 Straight, that is, not ^gaylesbian"
         3                = "3 Bisexual"
         4                = "4 Something else"
         5                = "5 I don't know the answer"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA049X
         1                = "1 Reassigned to other public from private"
    ;
 
    VALUE SA050X
         1                = "1 Yes, the sample adult is a parent of a child residing in the family"
         2                = "2 There are minor children residing in family but sample adult is not their parent"
         3                = "3 There are no minor children residing in the family"
         9                = "9 Unknown"
    ;
 
    VALUE SA051X
         0                = "0 adults"
         1                = "1 adult"
         2                = "2 adults"
         3                = "3 3+ adults"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA052X
         1                = "1 adult"
         2                = "2 adults"
         3                = "3 3+ adults"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA053X
         0                = "0 adults"
         1                = "1 adult"
         2                = "2 adults"
         3                = "3 3+ adults (at least 3, may have unknown)"
         5                = "5 at least 2 adults, has unknown"
         6                = "6 at least 1 adult, has unknown"
         7                = "7 0 adults, has unknown"
         8                = "8 not ascertained (all unknown)"
    ;
 
    VALUE SA054X
         0                = "0 children"
         1                = "1 child"
         2                = "2 children"
         3                = "3 3+ children"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA055X
         01               = "01 Through an employer, union, or professional organization"
         02               = "02 Purchased directly"
         03               = "03 Through Healthcare.gov or the Affordable Care Act, also known as Obamacare"
         04               = "04 Through a state or local government or community program"
         05               = "05 Other"
         06               = "06 Through school"
         07               = "07 Through parents"
         08               = "08 Through other relative"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA056X
         0-10.99          = "0.00 to 10.99"
         11.00            = "11.00+"
    ;
 
    VALUE SA057X
         1                = "1 Reassigned to private from public"
    ;
 
    VALUE SA058X
         1                = "1 Deductible is less than $1,500"
         2                = "2 Deductible is $1,500 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA059X
         1                = "1 White only"
         2                = "2 Black/African American only"
         3                = "3 Asian only"
         4                = "4 AIAN only"
         5                = "5 AIAN and any other group"
         6                = "6 Other single and multiple races"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA060X
         01               = "01 0.00 - 0.49"
         02               = "02 0.50 - 0.74"
         03               = "03 0.75 - 0.99"
         04               = "04 1.00 - 1.24"
         05               = "05 1.25 - 1.49"
         06               = "06 1.50 - 1.74"
         07               = "07 1.75 - 1.99"
         08               = "08 2.00 - 2.49"
         09               = "09 2.50 - 2.99"
         10               = "10 3.00 - 3.49"
         11               = "11 3.50 - 3.99"
         12               = "12 4.00 - 4.49"
         13               = "13 4.50 - 4.99"
         14               = "14 5.00 or greater"
         98               = "98 Not Ascertained"
    ;
 
    VALUE SA061X
         10               = "10 Sample Adult"
         20               = "20 Sample Child"
         30               = "30 Sample Adult Income"
         40               = "40 Sample Child Income"
         50               = "50 Paradata"
    ;
 
    VALUE SA062X
         1                = "1 Northeast"
         2                = "2 Midwest"
         3                = "3 South"
         4                = "4 West"
    ;
 
    VALUE SA063X
         1                = "1 Sample adult is parent of sample child"
         2                = "2 Sample adult is not parent of  sample child"
         3                = "3 No sample child in sample adult's family"
         9                = "9 Unknown"
    ;
 
    VALUE SA064X
         00               = "00 None"
         1-39             = "1-39 days"
         40               = "40 40+ days"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA065X
         2006-2023        = "2006-2023"
         9996             = "9996 Reported year before 2006"
         9997             = "9997 Refused"
         9998             = "9998 Not Ascertained"
         9999             = "9999 Don't Know"
    ;
 
    VALUE SA066X
         1                = "1 Current every day smoker"
         2                = "2 Current some day smoker"
         3                = "3 Former smoker"
         4                = "4 Never smoker"
         5                = "5 Smoker, current status unknown"
         9                = "9 Unknown if ever smoked"
    ;
 
    VALUE SA067X
         1963-2023        = "Survey year"
    ;
 
    VALUE SA068X
         0                = "0 times"
         1                = "1 time"
         2                = "2 times"
         3                = "3 times"
         4                = "4 times"
         5                = "5 5+ times"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA069X
         1                = "1 Large central metro"
         2                = "2 Large fringe metro"
         3                = "3 Medium and small metro"
         4                = "4 Nonmetropolitan"
    ;
 
    VALUE SA070X
         1900-2030        = "Year"
         9997             = "9997 Refused"
         9998             = "9998 Not Ascertained"
         9999             = "9999 Don't Know"
    ;
 
    VALUE SA071X
         1                = "1 Yes"
         2                = "2 No"
         9                = "9 Don't Know"
    ;
 
    VALUE SA072X
         0                = "0 No"
         1                = "1 Yes"
    ;
 
    VALUE SA073X
         1                = "1 Yes"
         2                = "2 No"
         3                = "3 Unknown"
    ;
 
    VALUE SA074X
         1                = "1 Yes"
    ;
 
    VALUE SA075X
         1                = "1 Less than 1 year"
         2                = "2 1 to less than 5 years"
         3                = "3 5 to less than 10 years"
         4                = "4 10 to less than 15 years"
         5                = "5 15 years or more"
         9                = "9 Unknown"
    ;
 
    VALUE SA076X
         1                = "1 Less than 65"
         2                = "2 65 or older"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA077X
         1                = "1 Very worried"
         2                = "2 Somewhat worried"
         3                = "3 Not at all worried"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA078X
         1                = "1 No problem"
         2                = "2 A small problem"
         3                = "3 A moderate problem"
         4                = "4 A big problem"
         5                = "5 A very big problem"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA079X
         1                = "1 A few things"
         2                = "2 A lot of things"
         3                = "3 Almost everything"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA080X
         1                = "1 Sometimes"
         2                = "2 Often"
         3                = "3 All of the time"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA081X
         1                = "1 Difficulty remembering only"
         2                = "2 Difficulty concentrating only"
         3                = "3 Difficulty with both remembering and concentrating"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA082X
         1                = "1 Colonoscopy"
         2                = "2 Sigmoidoscopy"
         3                = "3 Both"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA083X
         1                = "1 Part of a routine exam"
         2                = "2 Because of a problem"
         3                = "3 Follow-up test of an earlier test or screening exam"
         4                = "4 Other reason"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA084X
         1                = "1 vaccination"
         2                = "2 vaccinations"
         3                = "3 vaccinations"
         4                = "4 vaccinations"
         5                = "5 vaccinations"
         6                = "6 or more vaccinations"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA085X
         1                = "1 Pfizer-BioNTech Comirnaty� shot"
         2                = "2 Moderna Spikevax� shot"
         3                = "3 Johnson and Johnson (Janssen) shot"
         4                = "4 Novavax shot"
         5                = "5 One of the brands that requires two initial shots, but not sure which brand"
         6                = "6 None of these brands"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA086X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA087X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA088X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA089X
         1                = "1 Less than 1 month"
         2                = "2 1 month to less than 6 months"
         3                = "3 6 months to less than 1 year"
         4                = "4 1 year or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA090X
         1                = "1 Type 1"
         2                = "2 Type 2"
         3                = "3 Other type of diabetes"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA091X
         1                = "1 No difficulty"
         2                = "2 Some difficulty"
         3                = "3 A lot of difficulty"
         4                = "4 Cannot do at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA092X
         00               = "00 Never attended/kindergarten only"
         01               = "01 Grade 1-11"
         02               = "02 12th grade, no diploma"
         03               = "03 GED or equivalent"
         04               = "04 High School Graduate"
         05               = "05 Some college, no degree"
         06               = "06 Associate degree: occupational, technical, or vocational program"
         07               = "07 Associate degree: academic program"
         08               = "08 Bachelor's degree (Example: BA, AB, BS, BBA)"
         09               = "09 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
         10               = "10 Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA093X
         1                = "1 Employee of a PRIVATE company for wages"
         2                = "2 A FEDERAL government employee"
         3                = "3 A STATE government employee"
         4                = "4 A LOCAL government employee"
         5                = "5 Self-employed in OWN business, professional practice or farm"
         6                = "6 Working WITHOUT PAY in a family-owned business or farm"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA094X
         1                = "1 Within the past 12 months"
         2                = "2 1-5 years ago"
         3                = "3 Over 5 years ago"
         4                = "4 Never worked"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA095X
         1                = "1 Within the past 12 months"
         2                = "2 1-5 years ago"
         3                = "3 Over 5 years ago"
         4                = "4 Never worked"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA096X
         01               = "01 Unemployed, laid off, looking for work"
         02               = "02 Seasonal/contract work"
         03               = "03 Retired"
         04               = "04 Unable to work for health reasons/disabled"
         05               = "05 Taking care of house or family"
         06               = "06 Going to school"
         07               = "07 Working at a family-owned job or business not for pay"
         08               = "08 Other"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA097X
         0                = "0"
         1                = "1"
         2                = "2 or 3"
         3                = "3 4 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA098X
         1                = "1 Part of a routine exam"
         2                = "2 Because of a problem"
         3                = "3 Other reason"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA099X
         1                = "1 Every day"
         2                = "2 Some days"
         3                = "3 Not at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA100X
         1                = "1 Hearing aid fit by a health care professional"
         2                = "2 Hearing aid purchased online or over the counter without assistance from a health care professional"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA101X
         1                = "1 All of the time"
         2                = "2 Some of the time"
         3                = "3 Rarely"
         4                = "4 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA102X
         1                = "1 Excellent"
         2                = "2 Good"
         3                = "3 A little trouble hearing"
         4                = "4 Moderate trouble"
         5                = "5 A lot of trouble"
         6                = "6 Deaf"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA103X
         1                = "1 Owned or being bought"
         2                = "2 Rented"
         3                = "3 Other arrangement"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA104X
         1                = "1 Less than a year ago"
         2                = "2 1 to 2 years ago"
         3                = "3 to 4 years ago"
         4                = "4 5 to 9 years ago"
         5                = "5 10 or more years ago"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA105X
         1                = "1 Less than 1 year"
         2                = "2 1 to 2 years"
         3                = "3 to 4 years"
         4                = "4 5 to 9 years"
         5                = "5 10 years or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA106X
         1                = "1 Never"
         2                = "2 Some days"
         3                = "3 Most days"
         4                = "4 Every day"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA107X
         1                = "1 Daily"
         2                = "2 Weekly"
         3                = "3 Monthly"
         4                = "4 A few times a year"
         5                = "5 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA108X
         1                = "1 At least once a week"
         2                = "2 A few times a month"
         3                = "3 A few times a year"
         4                = "4 Less than once a year"
         5                = "5 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA109X
         1                = "1 English"
         2                = "2 Other language"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA110X
         1                = "1 A little"
         2                = "2 A lot"
         3                = "3 Somewhere in between a little and a lot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA111X
         1                = "1 Not at all"
         2                = "2 A little"
         3                = "3 A lot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA112X
         01               = "01 No reason/never thought about it"
         02               = "02 Didn't need it/didn't know I needed this type of test"
         03               = "03 Doctor didn't order it/didn't say I needed it"
         04               = "04 Haven't had any problems"
         05               = "05 Put it off/didn't get around to it"
         06               = "06 Too expensive/no insurance/cost"
         07               = "07 Too painful, unpleasant, or embarrassing"
         08               = "08 Don't have a doctor"
         09               = "09 I am too old"
         10               = "10 I am too young"
         11               = "11 Other"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA113X
         1                = "1 Married"
         2                = "2 Living with a partner together as an unmarried couple"
         3                = "3 Neither"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA114X
         1                = "1 Part A- hospital only"
         2                = "2 Part B- medical only"
         3                = "3 Both Part A and Part B"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA115X
         1                = "1 Menthol"
         2                = "2 Non-menthol"
         3                = "3 No usual type"
         7                = "7 Refused"
         8                = "8 Not ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA116X
         1                = "1 Mentioned"
         2                = "2 Not mentioned"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA117X
         01               = "01 January"
         02               = "02 February"
         03               = "03 March"
         04               = "04 April"
         05               = "05 May"
         06               = "06 June"
         07               = "07 July"
         08               = "08 August"
         09               = "09 September"
         10               = "10 October"
         11               = "11 November"
         12               = "12 December"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA118X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA119X
         1                = "1 A follow up of an abnormal mammogram"
         2                = "2 Because of a breast problem"
         3                = "3 I am high risk due to family history, genetic test, or another reason"
         4                = "4 Part of a routine exam"
         5                = "5 Other"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA120X
         1                = "1 Not at all"
         2                = "2 A little"
         3                = "3 A lot"
         4                = "4 Somewhere in between a little and a lot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA121X
         1                = "1 time"
         2                = "2 times"
         3                = "3 to 4 times"
         4                = "4 5 to 7 times"
         5                = "5 8 or more times"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA122X
         0                = "0 No cancer"
         1-3              = "1-3 cancers"
         4                = "4 or more cancers"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA123X
         1                = "1 relative"
         2                = "2 relatives"
         3                = "3 or more relatives"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA124X
         0                = "0 relatives"
         1                = "1 relative"
         2                = "2 relatives"
         3                = "3 or more relatives"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA125X
         1                = "1 Not at all"
         2                = "2 Several days"
         3                = "3 More than half the days"
         4                = "4 Nearly every day"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA126X
         1                = "1 Excellent"
         2                = "2 Very Good"
         3                = "3 Good"
         4                = "4 Fair"
         5                = "5 Poor"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA127X
         1                = "1 A doctor's office or health center"
         2                = "2 Urgent care center or clinic in a drug store or grocery store"
         3                = "3 Hospital emergency room"
         4                = "4 A VA Medical Center or VA outpatient clinic"
         5                = "5 Some other place"
         6                = "6 Does not go to one place most often"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA128X
         1                = "1 Less than ^HDHPAMT_A"
         2                = "2 ^HDHPAMT_A or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA129X
         1                = "1 Relative who lives in household"
         2                = "2 Relative who doesn't live in household"
         3                = "3 Nonrelative who lives in household"
         4                = "4 Nonrelative who does not live in household"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA130X
         1                = "1 Child"
         2                = "2 Spouse"
         3                = "3 Former spouse"
         4                = "4 Some other relationship"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA131X
         0                = "0 tests"
         1                = "1 test"
         2                = "2 tests"
         3                = "3 tests"
         4                = "4 tests"
         5                = "5 tests"
         6                = "6 or more tests"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA132X
         1                = "1 One pneumonia shot"
         2                = "2 Two pneumonia shots"
         3                = "3 More than two pneumonia shots"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA133X
         1                = "1 Available"
         2                = "2 Not Available or not able to answer right now"
         3                = "3 Physical or mental condition prohibits responding"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA134X
         1                = "1 Very satisfied"
         2                = "2 Satisfied"
         3                = "3 Dissatisfied"
         4                = "4 Very dissatisfied"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA135X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA136X
         1                = "1 Always"
         2                = "2 Usually"
         3                = "3 About half the time"
         4                = "4 Seldom"
         5                = "5 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA137X
         1                = "1 Male"
         2                = "2 Female"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA138X
         1                = "1 First shot"
         2                = "2 Second shot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA139X
         1                = "1 One Shingrix shot"
         2                = "2 Two Shingrix shots"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA140X
         1                = "1 SSI"
         2                = "2 SSDI"
         3                = "3 Both SSI and SSDI"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA141X
         0                = "0 Not applicable/None eligible"
         1                = "1 Completed"
         2                = "2 HH member selected"
         3                = "3 Reached Sample Adult"
         4                = "4 Started HIS section"
         5                = "5 Sufficient Partial"
         6                = "6 HH member selected and no longer eligible"
         7                = "7 Refused"
    ;
 
    VALUE SA142X
         0                = "0 Never"
         1                = "1 Within the past year (anytime less than 12 months ago)"
         2                = "2 Within the last 2 years (1 year but less than 2 years ago)"
         3                = "3 Within the last 3 years (2 years but less than 3 years ago)"
         4                = "4 Within the last 5 years (3 years but less than 5 years ago)"
         5                = "5 years ago or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA143X
         1                = "1 Within the past year (anytime less than 12 months ago)"
         2                = "2 Within the past 2 years (1 year but less than 2 years ago)"
         3                = "3 Within the past 3 years (2 years but less than 3 years ago)"
         4                = "4 Within the past 5 years (3 years but less than 5 years ago)"
         5                = "5 Within the past 10 years (5 years but less than 10 year ago)"
         6                = "6 10 years ago or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA144X
         0                = "0 Never"
         1                = "1 Within the past year (anytime less than 12 months ago)"
         2                = "2 Within the last 2 years (1 year but less than 2 years ago)"
         3                = "3 Within the last 3 years (2 years but less than 3 years ago)"
         4                = "4 Within the last 5 years (3 years but less than 5 years ago)"
         5                = "5 Within the last 10 years (5 years but less than 10 years ago)"
         6                = "6 10 years ago or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA145X
         1                = "1 Less than 1 year"
         2                = "2 1 to 3 years"
         3                = "3 4 to 10 years"
         4                = "4 11 to 20 years"
         5                = "5 More than 20 years"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA146X
         1                = "1 Less than 100 rounds"
         2                = "2 100 to less than 1,000 rounds"
         3                = "3 1,000 to less than 10,000 rounds"
         4                = "4 10,000 rounds or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA147X
         1                = "1 Often true"
         2                = "2 Sometimes true"
         3                = "3 Never true"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA148X
         1                = "1 Yes"
         2                = "2 There is NO place"
         3                = "3 There is MORE THAN ONE place"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA149X
         1                = "1 Yes"
         2                = "2 No"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA150X
         0                = "0"
         1                = "1"
         2                = "2"
         3                = "3"
         4                = "4"
         5                = "5 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA151X
         1                = "1 Before pregnancy"
         2                = "2 During pregnancy"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA152X
         1                = "1 Before pregnancy"
         2                = "2 During pregnancy"
         3                = "3 After pregnancy"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
run;
 
/* data step to load ASCII file into a SAS dataset */
data NHIS.&adultds;
    infile ASCIIDAT pad;
 
    /* define variable lengths */
    length 
         /* IDN  LENGTHS */
         RECTYPE                  3    SRVY_YR                  3    HHX                 $    7  
         WTFA_A                   8  
 
         /* UCF  LENGTHS */
         URBRRL                   3    REGION                   3    PSTRAT                   3  
         PPSU                     3  
 
         /* FLG  LENGTHS */
         HHRESPSA_FLG             3  
 
         /* GEN  LENGTHS */
         INTV_QRT                 3    INTV_MON                 3    HHSTAT_A                 3  
         ASTATNEW                 3    AVAIL_A                  3    PROXY_A                  3  
         PROXYREL_A               3  
 
         /* HHC  LENGTHS */
         SEX_A                    3    AGEP_A                   3    AGE65                    3  
         HISP_A                   3    HISPALLP_A               3    RACEALLP_A               3  
         HISDETP_A                3    AFNOW                    3    EDUCP_A                  3  
         PCNT18UPTC               3    PCNTLT18TC               3  
 
         /* FAM  LENGTHS */
         PCNTADLT_A               3    PCNTKIDS_A               3    OVER65FLG_A              3  
         MLTFAMFLG_A              3    MAXEDUCP_A               3  
 
         /* HIS  LENGTHS */
         PHSTAT_A                 3  
 
         /* LSF  LENGTHS */
         LSATIS4_A                3  
 
         /* HYP  LENGTHS */
         HYPEV_A                  3    HYPDIF_A                 3    HYP12M_A                 3  
         HYPMED_A                 3  
 
         /* CHL  LENGTHS */
         CHLEV_A                  3    CHL12M_A                 3    CHLMED_A                 3  
 
 
         /* CVC  LENGTHS */
         CHDEV_A                  3    ANGEV_A                  3    MIEV_A                   3  
         STREV_A                  3  
 
         /* ASP  LENGTHS */
         ASPMEDEV_A               3    ASPMEDNOWN_A             3    ASPMEDSTP_A              3  
         ASPONOWN_A               3  
 
         /* AST  LENGTHS */
         ASEV_A                   3    ASTILL_A                 3    ASAT12M_A                3  
         ASER12M_A                3  
 
         /* CAN  LENGTHS */
         CANEV_A                  3    BLADDCAN_A               3    BLADDAGETC_A             3  
         BLOODCAN_A               3    BLOODAGETC_A             3    BONECAN_A                3  
         BONEAGETC_A              3    BRAINCAN_A               3    BRAINAGETC_A             3  
         BREASCAN_A               3    BREASAGETC_A             3    CERVICAN_A               3  
         CERVIAGETC_A             3    COLONCAN_A               3    COLONAGETC_A             3  
         ESOPHCAN_A               3    ESOPHAGETC_A             3    GALLBCAN_A               3  
         GALLBAGETC_A             3    LARYNCAN_A               3    LARYNAGETC_A             3  
         LEUKECAN_A               3    LEUKEAGETC_A             3    LIVERCAN_A               3  
         LIVERAGETC_A             3    LUNGCAN_A                3    LUNGAGETC_A              3  
         LYMPHCAN_A               3    LYMPHAGETC_A             3    MELANCAN_A               3  
         MELANAGETC_A             3    MOUTHCAN_A               3    MOUTHAGETC_A             3  
         OVARYCAN_A               3    OVARYAGETC_A             3    PANCRCAN_A               3  
         PANCRAGETC_A             3    PROSTCAN_A               3    PROSTAGETC_A             3  
         RECTUCAN_A               3    RECTUAGETC_A             3    SKNMCAN_A                3  
         SKNMAGETC_A              3    SKNNMCAN_A               3    SKNNMAGETC_A             3  
         SKNDKCAN_A               3    SKNDKAGETC_A             3    STOMACAN_A               3  
         STOMAAGETC_A             3    THROACAN_A               3    THROAAGETC_A             3  
         THYROCAN_A               3    THYROAGETC_A             3    UTERUCAN_A               3  
         UTERUAGETC_A             3    HDNCKCAN_A               3    HDNCKAGETC_A             3  
         COLRCCAN_A               3    COLRCAGETC_A             3    OTHERCANP_A              3  
         OTHERAGETC_A             3    NUMCAN_A                 3  
 
         /* DIB  LENGTHS */
         PREDIB_A                 3    GESDIB_A                 3    DIBEV_A                  3  
         DIBAGETC_A               3    DIFYRSTC1_A              3    DIBPILL_A                3  
         DIBINS_A                 3    DIBINSTIME_A             3    DIBINSSTOP_A             3  
         DIBINSSTYR_A             3    DIBTYPE_A                3  
 
         /* CON  LENGTHS */
         COPDEV_A                 3    ARTHEV_A                 3    DEMENEV_A                3  
         ANXEV_A                  3    DEPEV_A                  3  
 
         /* SCE  LENGTHS */
         HEPEV_A                  3    CROHNSEV_A               3    ULCCOLEV_A               3  
         PSOREV_A                 3  
 
         /* CFS  LENGTHS */
         CFSEV_A                  3    CFSNOW_A                 3  
 
         /* ISN  LENGTHS */
         MEDRXTRT_A               3    HLTHCOND_A               3  
 
         /* EPI  LENGTHS */
         EPIEV_A                  3    EPIMED_A                 3    EPINUMSEZP_A             3  
         EPIDR_A                  3  
 
         /* SVC  LENGTHS */
         VIMDREV_A                3    VIMLSDR_A                3    VIMGLEV_A                3  
         VIMLSGL_A                3    VIMMDEV_A                3    VIMLSMD_A                3  
         VIMCSURG_A               3    VIMCAEV_A                3    VIMLSCA_A                3  
 
 
         /* BMI  LENGTHS */
         PREGNOW_A                3    HEIGHTTC_A               3    WEIGHTLBTC_A             3  
         BMICAT_A                 3  
 
         /* VIS  LENGTHS */
         WEARGLSS_A               3    VISIONDF_A               3  
 
         /* HEA  LENGTHS */
         HEARAID_A                3    HEARAIDFR_A              3    HEARINGDF_A              3  
 
 
         /* MOB  LENGTHS */
         DIFF_A                   3    EQUIP_A                  3    WLK100_A                 3  
         WLK13M_A                 3    STEPS_A                  3    CANEWLKR_A               3  
         WCHAIR_A                 3    PERASST_A                3    NOEQWLK100_A             3  
         NOEQWLK13M_A             3    NOEQSTEPS_A              3    EQWLK100_A               3  
         EQWLK13M_A               3    EQSTEPS_A                3  
 
         /* COM  LENGTHS */
         COMDIFF_A                3  
 
         /* COG  LENGTHS */
         COGMEMDFF_A              3    COGTYPEDFF_A             3    COGFRQDFF_A              3  
         COGAMTDFF_A              3  
 
         /* UPP  LENGTHS */
         UPPSLFCR_A               3    UPPRAISE_A               3    UPPOBJCT_A               3  
         DISAB3_A                 3  
 
         /* SOC  LENGTHS */
         SOCERRNDS_A              3    SOCSCLPAR_A              3    SOCWRKLIM_A              3  
 
 
         /* ADO  LENGTHS */
         DEVDONSET_A              3  
 
         /* INS  LENGTHS */
         NOTCOV_A                 3    COVER_A                  3    COVER65_A                3  
         SINCOVDE_A               3    SINCOVVS_A               3    SINCOVRX_A               3  
         MEDICARE_A               3    MCPART_A                 3    MCCHOICE_A               3  
         MCHMO_A                  3    MCADVR_A                 3    MCDNCOV_A                3  
         MCVSCOV_A                3    MCPARTD_A                3    MEDICAID_A               3  
         MAXCHNG_A                3    MAPREM_A                 3    MADEDUC_A                3  
         MAHDHP_A                 3    MAFLG_A                  3    PRIVATE_A                3  
         EXCHANGE_A               3    POLHLD1_A                3    PRPLCOV1_A               3  
         PRPOLH1_A                3    PRPLCOV1_C_A             3    PLNWRKR1_A               3  
         PLNEXCHG1_A              3    PLN1PAY1_A               3    PLN1PAY2_A               3  
         PLN1PAY3_A               3    PLN1PAY4_A               3    PLN1PAY5_A               3  
         PLN1PAY6_A               3    HICOSTR1_A               3    PRDEDUC1_A               3  
         PRHDHP1_A                3    HSAHRA1_A                3    PRRXCOV1_A               3  
         PRDNCOV1_A               3    PRVSCOV1_A               3    EXCHPR1_A                3  
         PRFLG_A                  3    PXCHNG1_A                3    PRPREM1_A                3  
         PLEXCHPR1_A              3    POLHLD2_A                3    PRPLCOV2_A               3  
         PRPOLH2_A                3    PRPLCOV2_C_A             3    PLNWRKR2_A               3  
         PLNEXCHG2_A              3    PLN2PAY1_A               3    PLN2PAY2_A               3  
         PLN2PAY3_A               3    PLN2PAY4_A               3    PLN2PAY5_A               3  
         PLN2PAY6_A               3    HICOSTR2_A               3    PRDEDUC2_A               3  
         PRHDHP2_A                3    HSAHRA2_A                3    PRRXCOV2_A               3  
         PRDNCOV2_A               3    PRVSCOV2_A               3    EXCHPR2_A                3  
         CHIP_A                   3    CHXCHNG_A                3    CHPREM_A                 3  
         CHDEDUC_A                3    CHHDHP_A                 3    CHFLG_A                  3  
         OTHPUB_A                 3    OPXCHNG_A                3    OPPREM_A                 3  
         OPDEDUC_A                3    OPHDHP_A                 3    PLEXCHOP_A               3  
         OPFLG_A                  3    OTHGOV_A                 3    OGXCHNG_A                3  
         OGPREM_A                 3    OGDEDUC_A                3    OGHDHP_A                 3  
         PLEXCHOG_A               3    OGFLG_A                  3    MILITARY_A               3  
         MILSPC1R_A               3    MILSPC2_A                3    MILSPC3_A                3  
         IHS_A                    3    HILAST_A                 3    HILASTMY_A               3  
         HISTOPJOB_A              3    HISTOPMISS_A             3    HISTOPAGE_A              3  
         HISTOPCOST_A             3    HISTOPELIG_A             3    RSNHICOST_A              3  
         RSNHIWANT_A              3    RSNHIELIG_A              3    RSNHICONF_A              3  
         RSNHIMEET_A              3    RSNHIWAIT_A              3    RSNHIOTH_A               3  
         RSNHIJOB_A               3    RSNHIMISS_A              3    HINOTYR_A                3  
         HINOTMYR_A               3    MILSPC1_A                3    HICOV_A                  3  
         HIKIND01_A               3    HIKIND02_A               3    HIKIND03_A               3  
         HIKIND04_A               3    HIKIND05_A               3    HIKIND06_A               3  
         HIKIND07_A               3    HIKIND08_A               3    HIKIND09_A               3  
         HIKIND10_A               3    MCAREPRB_A               3    MCAIDPRB_A               3  
 
 
         /* PAY  LENGTHS */
         PAYBLL12M_A              3    PAYNOBLLNW_A             3    PAYWORRY_A               3  
 
 
         /* CVL  LENGTHS */
         EVERCOVD_A               3    LONGCOVD1_A              3    SYMPNOW1_A               3  
         LCVDACT_A                3  
 
         /* DNC  LENGTHS */
         DENPREV_A                3    DENDL12M_A               3    DENNG12M_A               3  
 
 
         /* UTZ  LENGTHS */
         LASTDR_A                 3    WELLNESS_A               3    WELLVIS_A                3  
         USUALPL_A                3    USPLKIND_A               3    URGNT12MTC_A             3  
         EMERG12MTC_A             3    HOSPONGT_A               3    MEDDL12M_A               3  
         MEDNG12M_A               3  
 
         /* TLH  LENGTHS */
         VIRAPP12M_A              3  
 
         /* HIT  LENGTHS */
         ACCSSINT_A               3    ACCSSHOM_A               3    HITLOOK_A                3  
         HITCOMM_A                3    HITTEST_A                3  
 
         /* PMD  LENGTHS */
         RX12M_A                  3    RXSK12M_A                3    RXLS12M_A                3  
         RXDL12M_A                3    RXDG12M_A                3  
 
         /* PRV  LENGTHS */
         BPLAST_A                 3    CHOLLAST_A               3    DIBLAST1_A               3  
         DIBA1CLAST_A             3    DIBA1CNMT_A              3    COLORECTEV_A             3  
         COLORECTYP_A             3    COLWHEN_A                3    COLREASON1_A             3  
         COLSIGWHEN_A             3    SIGWHEN_A                3    CTCOLEV1_A               3  
         CTCOLWHEN1_A             3    FITHEV1_A                3    FITHWHEN1_A              3  
         COLOGUARD1_A             3    FITCOLG1_A               3    CGUARDWHE1_A             3  
         COLPROB1_A               3    COLTEST1_A               3    COLTEST2_A               3  
         COLTEST3_A               3    COLTEST4_A               3    COLTEST5_A               3  
         COLTEST6_A               3    PSATEST_A                3    PSAWHEN_A                3  
         PSAREASON_A              3    PSA5YR1_A                3    CERVICEV1_A              3  
         CERVICWHEN_A             3    HYSTEV2_A                3    MAMEV_A                  3  
         MAMWHEN_A                3    MAMREASON_A              3    MAMNOT1_A                3  
         MRIHAD_A                 3    MRIWHEN_A                3    MRIREA_A                 3  
 
 
         /* GCT  LENGTHS */
         GTPOSS1_A                3    GTGRISK_A                3  
 
         /* FHC  LENGTHS */
         FHCANEV_A                3    FHBCANEV_A               3    FHBCANNUM_A              3  
         FHBCAN50_A               3    FHOVCANEV_A              3    FHOVCANNUM_A             3  
         FHCANRISK_A              3  
 
         /* IMS  LENGTHS */
         PREGFLUYR_A              3    LIVEBIRTH_A              3    SHTFLU12M_A              3  
         SHTFLUM_A                3    SHTFLUY_A                3    FLUPREG_A                3  
         FLUPREG2_A               3    SHTCVD191_A              3    SHTCVD19NM1_A            3  
         CVDVAC1M1_A              3    CVDVAC1Y1_A              3    SHOTTYPE2_A              3  
         SHTPNUEV_A               3    SHTPNEUNB_A              3    SHTSHINGL1_A             3  
         SHINGYEARP_A             3    SHINGWHEN1_A             3    SHINGRIX3_A              3  
         SHINGRIXN3_A             3    SHINGRIXFS1_A            3    TDAPPREG_A               3  
         SHTHEPB1_A               3    LIVEHEP_A                3    WORKHEALTH_A             3  
         WRKHLTHFC_A              3    TRAVEL_A                 3  
 
         /* PTC  LENGTHS */
         EYEEX12M_A               3    THERA12M_A               3    HOMEHC12M_A              3  
 
 
         /* ANX  LENGTHS */
         ANXFREQ_A                3    ANXMED_A                 3    ANXLEVEL_A               3  
 
 
         /* DEP  LENGTHS */
         DEPFREQ_A                3    DEPMED_A                 3    DEPLEVEL_A               3  
 
 
         /* MHC  LENGTHS */
         MHRX_A                   3    MHTHRPY_A                3    MHTPYNOW_A               3  
         MHTHDLY_A                3    MHTHND_A                 3  
 
         /* MHA  LENGTHS */
         PHQ41_A                  3    PHQ42_A                  3    PHQ2SCREEN_A             3  
         PHQ43_A                  3    PHQ44_A                  3    GAD2SCREEN_A             3  
 
 
         /* EDS  LENGTHS */
         DISCRIM1_A               3    DISCRIM2_A               3    DISCRIM3_A               3  
         DISCRIM4_A               3    DISCRIM5_A               3  
 
         /* HVS  LENGTHS */
         VIGIL1_A                 3    VIGIL2_A                 3    VIGIL3_A                 3  
         VIGIL4_A                 3  
 
         /* PAI  LENGTHS */
         PAIFRQ3M_A               3    PAIAMNT_A                3    PAIWKLM3M_A              3  
         PAIAFFM3M_A              3    PAIBACK3M_A              3    PAIULMB3M_A              3  
         PAILLMB3M_A              3    PAIHDFC3M_A              3    PAIAPG3M_A               3  
         PAITOOTH3M_A             3  
 
         /* REP  LENGTHS */
         REPSTRAIN_A              3    REPLIMIT_A               3    REPSAWDOC_A              3  
         REPWRKDYTC_A             3    REPFUTWRK_A              3    REPSTOPCHG_A             3  
         REPREDUCE_A              3    REPWRKCAUS_A             3  
 
         /* INJ  LENGTHS */
         ANYINJURY_A              3    INJLIMIT_A               3    NUMINJTC_A               3  
         INJHOME_A                3    INJWORK_A                3    INJSPORTS_A              3  
         INJFALL_A                3    INJFALLHOM_A             3    INJFALLWRK_A             3  
         INJMOTOR_A               3    INJMVTYPE1_A             3    INJMVTYPE2_A             3  
         INJMVTYPE3_A             3    INJMVTYPE4_A             3    INJMVTYPE5_A             3  
         INJCHORES_A              3    INJSAWDOC_A              3    INJER_A                  3  
         INJHOSP_A                3    INJBONES_A               3    INJSTITCH_A              3  
         INJWRKDYTC_A             3    INJFUTWRK_A              3    INJSTOPCHG_A             3  
         INJREDUCE_A              3  
 
         /* TBI  LENGTHS */
         TBILCDCMG_A              3    TBIHLSBMC_A              3    TBISPORT_A               3  
         TBILEAGUE_A              3    TBIEVAL_A                3  
 
         /* ART  LENGTHS */
         JNTSYMP_A                3    JNTPN_A                  3    ARTHLMT_A                3  
         ARTHWRK_A                3    ARTHPH_A                 3  
 
         /* CIG  LENGTHS */
         SMKEV_A                  3    SMKNOW_A                 3    SMKCIGST_A               3  
         CIGNOW_A                 3    SMK30D_A                 3    CIG30D_A                 3  
         MENTHOLC_A               3    ECIGEV_A                 3    ECIGNOW_A                3  
         SMKECIGST_A              3  
 
         /* OTB  LENGTHS */
         CIGAREV_A                3    CIGARCUR_A               3    CIGAR30D_A               3  
         PIPEEV_A                 3    PIPECUR_A                3    SMOKELSEV_A              3  
         SMOKELSCUR_A             3  
 
         /* SVI  LENGTHS */
         AVISEXAM_A               3    AVISREH_A                3    AVISDEV_A                3  
         AVISSADV_A               3    VIMREAD_A                3    VIMDRIVE_A               3  
 
 
         /* SHE  LENGTHS */
         AHEARST1_A               3    HRWHISP_A                3    EARINFECT_A              3  
         EARINFECT3_A             3    CBALHDINJ_A              3    CBALHDNO_A               3  
         HRTEST_A                 3    HRTESTLAST_A             3    HRAIDAQR_A               3  
         BALDIZZ_A                3    BALDPROB_A               3    BALDHP_A                 3  
         BFALL12M_A               3    BFALLTIMES_A             3    HRTINNITUS_A             3  
         HRTINLNG_A               3    HRTINPROB_A              3    HRTINMEDSP_A             3  
         HRLOUDJOB_A              3    HRLOUDJBYR_A             3    HRLOUDJB12M_A            3  
         HRJOBPROT_A              3    HRFIREEV_A               3    HRFIRETOTR_A             3  
         HRFIRE12M_A              3    HRFIREPROT_A             3    HRVLOUD12M_A             3  
         HRVLDPROT_A              3  
 
         /* SWE  LENGTHS */
         HRJBEXP12M_A             3    HRJBEXP4HR_A             3    HRJBEXPTB_A              3  
 
 
         /* ORN  LENGTHS */
         ORIENT_A                 3  
 
         /* MAR  LENGTHS */
         MARITAL_A                3    SPOUSLIV_A               3    SPOUSEP_A                3  
         EVRMARRIED_A             3    MARSTAT_A                3    LEGMSTAT_A               3  
         SPOUSESEX_A              3    SASPPRACE_A              3    SASPPHISP_A              3  
         SPOUSAGETC_A             3    SPOUSEDUCP_A             3    SPOUSWRK_A               3  
         SPOUSWKFT_A              3    PRTNRSEX_A               3    PRTNRAGETC_A             3  
         PRTNREDUCP_A             3    PRTNRWRK_A               3    PRTNRWKFT_A              3  
         SAPARENTSC_A             3    PARSTAT_A                3  
 
         /* VET  LENGTHS */
         AFVET_A                  3    AFVETTRN_A               3    COMBAT_A                 3  
         VADISB_A                 3    VAHOSP_A                 3    VACAREEV_A               3  
 
 
         /* NAT  LENGTHS */
         NATUSBORN_A              3    YRSINUS_A                3    CITZNSTP_A               3  
 
 
         /* LNG  LENGTHS */
         LANGHM_A                 3    LANGSPECR_A              3    LANGMED_A                3  
         LANGDOC_A                3    LANGSOC_A                3  
 
         /* SCH  LENGTHS */
         SCHCURENR_A              3    SCHDYMSSTC_A             3  
 
         /* EMP  LENGTHS */
         EMPLASTWK_A              3    EMPNOWRK_A               3    EMPWHYNOT_A              3  
         EMPWHENWRK_A             3    EMPWRKLSW1_A             3    EMPLSTWOR1_A             3  
         EMPWKHRS3_A              3    EMPWRKFT1_A              3    EMPSICKLV_A              3  
         EMPHEALINS_A             3    EMPDYSMSS3_A             3  
 
         /* EMD  LENGTHS */
         EMDINDSTN1_A             3    EMDINDSTN2_A             3    EMDOCCUPN1_A             3  
         EMDOCCUPN2_A             3    EMDSUPER_A               3    EMDWRKCAT1_A             3  
 
 
         /* VOL  LENGTHS */
         CEVOLUN1_A               3    CEVOLUN2_A               3  
 
         /* FEM  LENGTHS */
         PCNTADWKP1_A             3    PCNTADWFP1_A             3  
 
         /* INC  LENGTHS */
         INCWRKO_A                3    INCINTER_A               3    INCSSRR_A                3  
         INCSSISSDI_A             3    SSISSDIBTH_A             3    SSISSDIDSB_A             3  
         INCWELF_A                3    INCRETIRE_A              3    INCOTHR_A                3  
         IMPNUM_A                 3    POVRATTC_A               8    RATCAT_A                 3  
         IMPINCFLG_A         $    5    INCTCFLG_A               3  
 
         /* FOO  LENGTHS */
         FSNAP12M_A               3    FSNAP30D_A               3    FWIC12M_A                3  
         FLUNCH12M1_A             3  
 
         /* FDS  LENGTHS */
         FDSRUNOUT_A              3    FDSLAST_A                3    FDSBALANCE_A             3  
         FDSSKIP_A                3    FDSSKIPDYS_A             3    FDSLESS_A                3  
         FDSHUNGRY_A              3    FDSWEIGHT_A              3    FDSNOTEAT_A              3  
         FDSNEDAYS_A              3    FDSCAT3_A                3    FDSCAT4_A                3  
 
 
         /* HOU  LENGTHS */
         HOUYRSLIV_A              3    HOUTENURE_A              3    HOUGVASST_A              3  
 
 
         /* SDH  LENGTHS */
         HOUSECOST_A              3  
 
         /* TBH  LENGTHS */
         TRANSPOR_A               3  
 
         /* CIV  LENGTHS */
         CEMMETNG_A               3    CEVOTELC_A               3  
    ;
 
/* input the data from the ASCII file */
    input 
         /* IDN  LOCATIONS */
         RECTYPE               1  - 2          SRVY_YR               3  - 6  
         HHX                 $ 7  -   13       WTFA_A                14  - 23  
 
         /* UCF  LOCATIONS */
         URBRRL                24  - 24        REGION                25  - 25  
         PSTRAT                26  - 28        PPSU                  29  - 31  
 
         /* FLG  LOCATIONS */
         HHRESPSA_FLG          32  - 32  
 
         /* GEN  LOCATIONS */
         INTV_QRT              33  - 33        INTV_MON              34  - 35  
         HHSTAT_A              36  - 36        ASTATNEW              37  - 37  
         AVAIL_A               38  - 38        PROXY_A               39  - 39  
         PROXYREL_A            40  - 40  
 
         /* HHC  LOCATIONS */
         SEX_A                 41  - 41        AGEP_A                42  - 43  
         AGE65                 44  - 44        HISP_A                45  - 45  
         HISPALLP_A            46  - 47        RACEALLP_A            48  - 48  
         HISDETP_A             49  - 49        AFNOW                 50  - 50  
         EDUCP_A               51  - 52        PCNT18UPTC            53  - 53  
         PCNTLT18TC            54  - 54  
 
         /* FAM  LOCATIONS */
         PCNTADLT_A            55  - 55        PCNTKIDS_A            56  - 56  
         OVER65FLG_A           57  - 57        MLTFAMFLG_A           58  - 58  
         MAXEDUCP_A            59  - 60  
 
         /* HIS  LOCATIONS */
         PHSTAT_A              61  - 61  
 
         /* LSF  LOCATIONS */
         LSATIS4_A             62  - 62  
 
         /* HYP  LOCATIONS */
         HYPEV_A               63  - 63        HYPDIF_A              64  - 64  
         HYP12M_A              65  - 65        HYPMED_A              66  - 66  
 
 
         /* CHL  LOCATIONS */
         CHLEV_A               67  - 67        CHL12M_A              68  - 68  
         CHLMED_A              69  - 69  
 
         /* CVC  LOCATIONS */
         CHDEV_A               70  - 70        ANGEV_A               71  - 71  
         MIEV_A                72  - 72        STREV_A               73  - 73  
 
 
         /* ASP  LOCATIONS */
         ASPMEDEV_A            74  - 74        ASPMEDNOWN_A          75  - 75  
         ASPMEDSTP_A           76  - 76        ASPONOWN_A            77  - 77  
 
 
         /* AST  LOCATIONS */
         ASEV_A                78  - 78        ASTILL_A              79  - 79  
         ASAT12M_A             80  - 80        ASER12M_A             81  - 81  
 
 
         /* CAN  LOCATIONS */
         CANEV_A               82  - 82        BLADDCAN_A            83  - 83  
         BLADDAGETC_A          84  - 85        BLOODCAN_A            86  - 86  
         BLOODAGETC_A          87  - 88        BONECAN_A             89  - 89  
         BONEAGETC_A           90  - 91        BRAINCAN_A            92  - 92  
         BRAINAGETC_A          93  - 94        BREASCAN_A            95  - 95  
         BREASAGETC_A          96  - 97        CERVICAN_A            98  - 98  
         CERVIAGETC_A          99  - 100       COLONCAN_A            101  - 101  
         COLONAGETC_A          102  - 103      ESOPHCAN_A            104  - 104  
         ESOPHAGETC_A          105  - 106      GALLBCAN_A            107  - 107  
         GALLBAGETC_A          108  - 109      LARYNCAN_A            110  - 110  
         LARYNAGETC_A          111  - 112      LEUKECAN_A            113  - 113  
         LEUKEAGETC_A          114  - 115      LIVERCAN_A            116  - 116  
         LIVERAGETC_A          117  - 118      LUNGCAN_A             119  - 119  
         LUNGAGETC_A           120  - 121      LYMPHCAN_A            122  - 122  
         LYMPHAGETC_A          123  - 124      MELANCAN_A            125  - 125  
         MELANAGETC_A          126  - 127      MOUTHCAN_A            128  - 128  
         MOUTHAGETC_A          129  - 130      OVARYCAN_A            131  - 131  
         OVARYAGETC_A          132  - 133      PANCRCAN_A            134  - 134  
         PANCRAGETC_A          135  - 136      PROSTCAN_A            137  - 137  
         PROSTAGETC_A          138  - 139      RECTUCAN_A            140  - 140  
         RECTUAGETC_A          141  - 142      SKNMCAN_A             143  - 143  
         SKNMAGETC_A           144  - 145      SKNNMCAN_A            146  - 146  
         SKNNMAGETC_A          147  - 148      SKNDKCAN_A            149  - 149  
         SKNDKAGETC_A          150  - 151      STOMACAN_A            152  - 152  
         STOMAAGETC_A          153  - 154      THROACAN_A            155  - 155  
         THROAAGETC_A          156  - 157      THYROCAN_A            158  - 158  
         THYROAGETC_A          159  - 160      UTERUCAN_A            161  - 161  
         UTERUAGETC_A          162  - 163      HDNCKCAN_A            164  - 164  
         HDNCKAGETC_A          165  - 166      COLRCCAN_A            167  - 167  
         COLRCAGETC_A          168  - 169      OTHERCANP_A           170  - 170  
         OTHERAGETC_A          171  - 172      NUMCAN_A              173  - 173  
 
 
         /* DIB  LOCATIONS */
         PREDIB_A              174  - 174      GESDIB_A              175  - 175  
         DIBEV_A               176  - 176      DIBAGETC_A            177  - 178  
         DIFYRSTC1_A           179  - 180      DIBPILL_A             181  - 181  
         DIBINS_A              182  - 182      DIBINSTIME_A          183  - 183  
         DIBINSSTOP_A          184  - 184      DIBINSSTYR_A          185  - 185  
         DIBTYPE_A             186  - 186  
 
         /* CON  LOCATIONS */
         COPDEV_A              187  - 187      ARTHEV_A              188  - 188  
         DEMENEV_A             189  - 189      ANXEV_A               190  - 190  
         DEPEV_A               191  - 191  
 
         /* SCE  LOCATIONS */
         HEPEV_A               192  - 192      CROHNSEV_A            193  - 193  
         ULCCOLEV_A            194  - 194      PSOREV_A              195  - 195  
 
 
         /* CFS  LOCATIONS */
         CFSEV_A               196  - 196      CFSNOW_A              197  - 197  
 
 
         /* ISN  LOCATIONS */
         MEDRXTRT_A            198  - 198      HLTHCOND_A            199  - 199  
 
 
         /* EPI  LOCATIONS */
         EPIEV_A               200  - 200      EPIMED_A              201  - 201  
         EPINUMSEZP_A          202  - 202      EPIDR_A               203  - 203  
 
 
         /* SVC  LOCATIONS */
         VIMDREV_A             204  - 204      VIMLSDR_A             205  - 205  
         VIMGLEV_A             206  - 206      VIMLSGL_A             207  - 207  
         VIMMDEV_A             208  - 208      VIMLSMD_A             209  - 209  
         VIMCSURG_A            210  - 210      VIMCAEV_A             211  - 211  
         VIMLSCA_A             212  - 212  
 
         /* BMI  LOCATIONS */
         PREGNOW_A             213  - 213      HEIGHTTC_A            214  - 215  
         WEIGHTLBTC_A          216  - 218      BMICAT_A              219  - 219  
 
 
         /* VIS  LOCATIONS */
         WEARGLSS_A            220  - 220      VISIONDF_A            221  - 221  
 
 
         /* HEA  LOCATIONS */
         HEARAID_A             222  - 222      HEARAIDFR_A           223  - 223  
         HEARINGDF_A           224  - 224  
 
         /* MOB  LOCATIONS */
         DIFF_A                225  - 225      EQUIP_A               226  - 226  
         WLK100_A              227  - 227      WLK13M_A              228  - 228  
         STEPS_A               229  - 229      CANEWLKR_A            230  - 230  
         WCHAIR_A              231  - 231      PERASST_A             232  - 232  
         NOEQWLK100_A          233  - 233      NOEQWLK13M_A          234  - 234  
         NOEQSTEPS_A           235  - 235      EQWLK100_A            236  - 236  
         EQWLK13M_A            237  - 237      EQSTEPS_A             238  - 238  
 
 
         /* COM  LOCATIONS */
         COMDIFF_A             239  - 239  
 
         /* COG  LOCATIONS */
         COGMEMDFF_A           240  - 240      COGTYPEDFF_A          241  - 241  
         COGFRQDFF_A           242  - 242      COGAMTDFF_A           243  - 243  
 
 
         /* UPP  LOCATIONS */
         UPPSLFCR_A            244  - 244      UPPRAISE_A            245  - 245  
         UPPOBJCT_A            246  - 246      DISAB3_A              247  - 247  
 
 
         /* SOC  LOCATIONS */
         SOCERRNDS_A           248  - 248      SOCSCLPAR_A           249  - 249  
         SOCWRKLIM_A           250  - 250  
 
         /* ADO  LOCATIONS */
         DEVDONSET_A           251  - 251  
 
         /* INS  LOCATIONS */
         NOTCOV_A              252  - 252      COVER_A               253  - 253  
         COVER65_A             254  - 254      SINCOVDE_A            255  - 255  
         SINCOVVS_A            256  - 256      SINCOVRX_A            257  - 257  
         MEDICARE_A            258  - 258      MCPART_A              259  - 259  
         MCCHOICE_A            260  - 260      MCHMO_A               261  - 261  
         MCADVR_A              262  - 262      MCDNCOV_A             263  - 263  
         MCVSCOV_A             264  - 264      MCPARTD_A             265  - 265  
         MEDICAID_A            266  - 266      MAXCHNG_A             267  - 267  
         MAPREM_A              268  - 268      MADEDUC_A             269  - 269  
         MAHDHP_A              270  - 270      MAFLG_A               271  - 271  
         PRIVATE_A             272  - 272      EXCHANGE_A            273  - 273  
         POLHLD1_A             274  - 274      PRPLCOV1_A            275  - 275  
         PRPOLH1_A             276  - 276      PRPLCOV1_C_A          277  - 277  
         PLNWRKR1_A            278  - 279      PLNEXCHG1_A           280  - 280  
         PLN1PAY1_A            281  - 281      PLN1PAY2_A            282  - 282  
         PLN1PAY3_A            283  - 283      PLN1PAY4_A            284  - 284  
         PLN1PAY5_A            285  - 285      PLN1PAY6_A            286  - 286  
         HICOSTR1_A            287  - 291      PRDEDUC1_A            292  - 292  
         PRHDHP1_A             293  - 293      HSAHRA1_A             294  - 294  
         PRRXCOV1_A            295  - 295      PRDNCOV1_A            296  - 296  
         PRVSCOV1_A            297  - 297      EXCHPR1_A             298  - 298  
         PRFLG_A               299  - 299      PXCHNG1_A             300  - 300  
         PRPREM1_A             301  - 301      PLEXCHPR1_A           302  - 302  
         POLHLD2_A             303  - 303      PRPLCOV2_A            304  - 304  
         PRPOLH2_A             305  - 305      PRPLCOV2_C_A          306  - 306  
         PLNWRKR2_A            307  - 308      PLNEXCHG2_A           309  - 309  
         PLN2PAY1_A            310  - 310      PLN2PAY2_A            311  - 311  
         PLN2PAY3_A            312  - 312      PLN2PAY4_A            313  - 313  
         PLN2PAY5_A            314  - 314      PLN2PAY6_A            315  - 315  
         HICOSTR2_A            316  - 320      PRDEDUC2_A            321  - 321  
         PRHDHP2_A             322  - 322      HSAHRA2_A             323  - 323  
         PRRXCOV2_A            324  - 324      PRDNCOV2_A            325  - 325  
         PRVSCOV2_A            326  - 326      EXCHPR2_A             327  - 327  
         CHIP_A                328  - 328      CHXCHNG_A             329  - 329  
         CHPREM_A              330  - 330      CHDEDUC_A             331  - 331  
         CHHDHP_A              332  - 332      CHFLG_A               333  - 333  
         OTHPUB_A              334  - 334      OPXCHNG_A             335  - 335  
         OPPREM_A              336  - 336      OPDEDUC_A             337  - 337  
         OPHDHP_A              338  - 338      PLEXCHOP_A            339  - 339  
         OPFLG_A               340  - 340      OTHGOV_A              341  - 341  
         OGXCHNG_A             342  - 342      OGPREM_A              343  - 343  
         OGDEDUC_A             344  - 344      OGHDHP_A              345  - 345  
         PLEXCHOG_A            346  - 346      OGFLG_A               347  - 347  
         MILITARY_A            348  - 348      MILSPC1R_A            349  - 349  
         MILSPC2_A             350  - 350      MILSPC3_A             351  - 351  
         IHS_A                 352  - 352      HILAST_A              353  - 353  
         HILASTMY_A            354  - 355      HISTOPJOB_A           356  - 356  
         HISTOPMISS_A          357  - 357      HISTOPAGE_A           358  - 358  
         HISTOPCOST_A          359  - 359      HISTOPELIG_A          360  - 360  
         RSNHICOST_A           361  - 361      RSNHIWANT_A           362  - 362  
         RSNHIELIG_A           363  - 363      RSNHICONF_A           364  - 364  
         RSNHIMEET_A           365  - 365      RSNHIWAIT_A           366  - 366  
         RSNHIOTH_A            367  - 367      RSNHIJOB_A            368  - 368  
         RSNHIMISS_A           369  - 369      HINOTYR_A             370  - 370  
         HINOTMYR_A            371  - 372      MILSPC1_A             373  - 373  
         HICOV_A               374  - 374      HIKIND01_A            375  - 375  
         HIKIND02_A            376  - 376      HIKIND03_A            377  - 377  
         HIKIND04_A            378  - 378      HIKIND05_A            379  - 379  
         HIKIND06_A            380  - 380      HIKIND07_A            381  - 381  
         HIKIND08_A            382  - 382      HIKIND09_A            383  - 383  
         HIKIND10_A            384  - 384      MCAREPRB_A            385  - 385  
         MCAIDPRB_A            386  - 386  
 
         /* PAY  LOCATIONS */
         PAYBLL12M_A           387  - 387      PAYNOBLLNW_A          388  - 388  
         PAYWORRY_A            389  - 389  
 
         /* CVL  LOCATIONS */
         EVERCOVD_A            390  - 390      LONGCOVD1_A           391  - 391  
         SYMPNOW1_A            392  - 392      LCVDACT_A             393  - 393  
 
 
         /* DNC  LOCATIONS */
         DENPREV_A             394  - 394      DENDL12M_A            395  - 395  
         DENNG12M_A            396  - 396  
 
         /* UTZ  LOCATIONS */
         LASTDR_A              397  - 397      WELLNESS_A            398  - 398  
         WELLVIS_A             399  - 399      USUALPL_A             400  - 400  
         USPLKIND_A            401  - 401      URGNT12MTC_A          402  - 402  
         EMERG12MTC_A          403  - 403      HOSPONGT_A            404  - 404  
         MEDDL12M_A            405  - 405      MEDNG12M_A            406  - 406  
 
 
         /* TLH  LOCATIONS */
         VIRAPP12M_A           407  - 407  
 
         /* HIT  LOCATIONS */
         ACCSSINT_A            408  - 408      ACCSSHOM_A            409  - 409  
         HITLOOK_A             410  - 410      HITCOMM_A             411  - 411  
         HITTEST_A             412  - 412  
 
         /* PMD  LOCATIONS */
         RX12M_A               413  - 413      RXSK12M_A             414  - 414  
         RXLS12M_A             415  - 415      RXDL12M_A             416  - 416  
         RXDG12M_A             417  - 417  
 
         /* PRV  LOCATIONS */
         BPLAST_A              418  - 418      CHOLLAST_A            419  - 419  
         DIBLAST1_A            420  - 420      DIBA1CLAST_A          421  - 421  
         DIBA1CNMT_A           422  - 422      COLORECTEV_A          423  - 423  
         COLORECTYP_A          424  - 424      COLWHEN_A             425  - 425  
         COLREASON1_A          426  - 426      COLSIGWHEN_A          427  - 427  
         SIGWHEN_A             428  - 428      CTCOLEV1_A            429  - 429  
         CTCOLWHEN1_A          430  - 430      FITHEV1_A             431  - 431  
         FITHWHEN1_A           432  - 432      COLOGUARD1_A          433  - 433  
         FITCOLG1_A            434  - 434      CGUARDWHE1_A          435  - 435  
         COLPROB1_A            436  - 436      COLTEST1_A            437  - 437  
         COLTEST2_A            438  - 438      COLTEST3_A            439  - 439  
         COLTEST4_A            440  - 440      COLTEST5_A            441  - 441  
         COLTEST6_A            442  - 442      PSATEST_A             443  - 443  
         PSAWHEN_A             444  - 444      PSAREASON_A           445  - 445  
         PSA5YR1_A             446  - 446      CERVICEV1_A           447  - 447  
         CERVICWHEN_A          448  - 448      HYSTEV2_A             449  - 449  
         MAMEV_A               450  - 450      MAMWHEN_A             451  - 451  
         MAMREASON_A           452  - 452      MAMNOT1_A             453  - 454  
         MRIHAD_A              455  - 455      MRIWHEN_A             456  - 456  
         MRIREA_A              457  - 457  
 
         /* GCT  LOCATIONS */
         GTPOSS1_A             458  - 458      GTGRISK_A             459  - 459  
 
 
         /* FHC  LOCATIONS */
         FHCANEV_A             460  - 460      FHBCANEV_A            461  - 461  
         FHBCANNUM_A           462  - 462      FHBCAN50_A            463  - 463  
         FHOVCANEV_A           464  - 464      FHOVCANNUM_A          465  - 465  
         FHCANRISK_A           466  - 466  
 
         /* IMS  LOCATIONS */
         PREGFLUYR_A           467  - 467      LIVEBIRTH_A           468  - 468  
         SHTFLU12M_A           469  - 469      SHTFLUM_A             470  - 471  
         SHTFLUY_A             472  - 475      FLUPREG_A             476  - 476  
         FLUPREG2_A            477  - 477      SHTCVD191_A           478  - 478  
         SHTCVD19NM1_A         479  - 479      CVDVAC1M1_A           480  - 481  
         CVDVAC1Y1_A           482  - 485      SHOTTYPE2_A           486  - 486  
         SHTPNUEV_A            487  - 487      SHTPNEUNB_A           488  - 488  
         SHTSHINGL1_A          489  - 489      SHINGYEARP_A          490  - 493  
         SHINGWHEN1_A          494  - 494      SHINGRIX3_A           495  - 495  
         SHINGRIXN3_A          496  - 496      SHINGRIXFS1_A         497  - 497  
         TDAPPREG_A            498  - 498      SHTHEPB1_A            499  - 499  
         LIVEHEP_A             500  - 500      WORKHEALTH_A          501  - 501  
         WRKHLTHFC_A           502  - 502      TRAVEL_A              503  - 503  
 
 
         /* PTC  LOCATIONS */
         EYEEX12M_A            504  - 504      THERA12M_A            505  - 505  
         HOMEHC12M_A           506  - 506  
 
         /* ANX  LOCATIONS */
         ANXFREQ_A             507  - 507      ANXMED_A              508  - 508  
         ANXLEVEL_A            509  - 509  
 
         /* DEP  LOCATIONS */
         DEPFREQ_A             510  - 510      DEPMED_A              511  - 511  
         DEPLEVEL_A            512  - 512  
 
         /* MHC  LOCATIONS */
         MHRX_A                513  - 513      MHTHRPY_A             514  - 514  
         MHTPYNOW_A            515  - 515      MHTHDLY_A             516  - 516  
         MHTHND_A              517  - 517  
 
         /* MHA  LOCATIONS */
         PHQ41_A               518  - 518      PHQ42_A               519  - 519  
         PHQ2SCREEN_A          520  - 520      PHQ43_A               521  - 521  
         PHQ44_A               522  - 522      GAD2SCREEN_A          523  - 523  
 
 
         /* EDS  LOCATIONS */
         DISCRIM1_A            524  - 524      DISCRIM2_A            525  - 525  
         DISCRIM3_A            526  - 526      DISCRIM4_A            527  - 527  
         DISCRIM5_A            528  - 528  
 
         /* HVS  LOCATIONS */
         VIGIL1_A              529  - 529      VIGIL2_A              530  - 530  
         VIGIL3_A              531  - 531      VIGIL4_A              532  - 532  
 
 
         /* PAI  LOCATIONS */
         PAIFRQ3M_A            533  - 533      PAIAMNT_A             534  - 534  
         PAIWKLM3M_A           535  - 535      PAIAFFM3M_A           536  - 536  
         PAIBACK3M_A           537  - 537      PAIULMB3M_A           538  - 538  
         PAILLMB3M_A           539  - 539      PAIHDFC3M_A           540  - 540  
         PAIAPG3M_A            541  - 541      PAITOOTH3M_A          542  - 542  
 
 
         /* REP  LOCATIONS */
         REPSTRAIN_A           543  - 543      REPLIMIT_A            544  - 544  
         REPSAWDOC_A           545  - 545      REPWRKDYTC_A          546  - 547  
         REPFUTWRK_A           548  - 548      REPSTOPCHG_A          549  - 549  
         REPREDUCE_A           550  - 550      REPWRKCAUS_A          551  - 551  
 
 
         /* INJ  LOCATIONS */
         ANYINJURY_A           552  - 552      INJLIMIT_A            553  - 553  
         NUMINJTC_A            554  - 555      INJHOME_A             556  - 556  
         INJWORK_A             557  - 557      INJSPORTS_A           558  - 558  
         INJFALL_A             559  - 559      INJFALLHOM_A          560  - 560  
         INJFALLWRK_A          561  - 561      INJMOTOR_A            562  - 562  
         INJMVTYPE1_A          563  - 563      INJMVTYPE2_A          564  - 564  
         INJMVTYPE3_A          565  - 565      INJMVTYPE4_A          566  - 566  
         INJMVTYPE5_A          567  - 567      INJCHORES_A           568  - 568  
         INJSAWDOC_A           569  - 569      INJER_A               570  - 570  
         INJHOSP_A             571  - 571      INJBONES_A            572  - 572  
         INJSTITCH_A           573  - 573      INJWRKDYTC_A          574  - 575  
         INJFUTWRK_A           576  - 576      INJSTOPCHG_A          577  - 577  
         INJREDUCE_A           578  - 578  
 
         /* TBI  LOCATIONS */
         TBILCDCMG_A           579  - 579      TBIHLSBMC_A           580  - 580  
         TBISPORT_A            581  - 581      TBILEAGUE_A           582  - 582  
         TBIEVAL_A             583  - 583  
 
         /* ART  LOCATIONS */
         JNTSYMP_A             584  - 584      JNTPN_A               585  - 586  
         ARTHLMT_A             587  - 587      ARTHWRK_A             588  - 588  
         ARTHPH_A              589  - 589  
 
         /* CIG  LOCATIONS */
         SMKEV_A               590  - 590      SMKNOW_A              591  - 591  
         SMKCIGST_A            592  - 592      CIGNOW_A              593  - 594  
         SMK30D_A              595  - 596      CIG30D_A              597  - 598  
         MENTHOLC_A            599  - 599      ECIGEV_A              600  - 600  
         ECIGNOW_A             601  - 601      SMKECIGST_A           602  - 602  
 
 
         /* OTB  LOCATIONS */
         CIGAREV_A             603  - 603      CIGARCUR_A            604  - 604  
         CIGAR30D_A            605  - 606      PIPEEV_A              607  - 607  
         PIPECUR_A             608  - 608      SMOKELSEV_A           609  - 609  
         SMOKELSCUR_A          610  - 610  
 
         /* SVI  LOCATIONS */
         AVISEXAM_A            611  - 611      AVISREH_A             612  - 612  
         AVISDEV_A             613  - 613      AVISSADV_A            614  - 614  
         VIMREAD_A             615  - 615      VIMDRIVE_A            616  - 616  
 
 
         /* SHE  LOCATIONS */
         AHEARST1_A            617  - 617      HRWHISP_A             618  - 618  
         EARINFECT_A           619  - 619      EARINFECT3_A          620  - 620  
         CBALHDINJ_A           621  - 621      CBALHDNO_A            622  - 622  
         HRTEST_A              623  - 623      HRTESTLAST_A          624  - 624  
         HRAIDAQR_A            625  - 625      BALDIZZ_A             626  - 626  
         BALDPROB_A            627  - 627      BALDHP_A              628  - 628  
         BFALL12M_A            629  - 629      BFALLTIMES_A          630  - 630  
         HRTINNITUS_A          631  - 631      HRTINLNG_A            632  - 632  
         HRTINPROB_A           633  - 633      HRTINMEDSP_A          634  - 634  
         HRLOUDJOB_A           635  - 635      HRLOUDJBYR_A          636  - 636  
         HRLOUDJB12M_A         637  - 637      HRJOBPROT_A           638  - 638  
         HRFIREEV_A            639  - 639      HRFIRETOTR_A          640  - 640  
         HRFIRE12M_A           641  - 641      HRFIREPROT_A          642  - 642  
         HRVLOUD12M_A          643  - 643      HRVLDPROT_A           644  - 644  
 
 
         /* SWE  LOCATIONS */
         HRJBEXP12M_A          645  - 645      HRJBEXP4HR_A          646  - 646  
         HRJBEXPTB_A           647  - 647  
 
         /* ORN  LOCATIONS */
         ORIENT_A              648  - 648  
 
         /* MAR  LOCATIONS */
         MARITAL_A             649  - 649      SPOUSLIV_A            650  - 650  
         SPOUSEP_A             651  - 651      EVRMARRIED_A          652  - 652  
         MARSTAT_A             653  - 653      LEGMSTAT_A            654  - 654  
         SPOUSESEX_A           655  - 655      SASPPRACE_A           656  - 656  
         SASPPHISP_A           657  - 657      SPOUSAGETC_A          658  - 659  
         SPOUSEDUCP_A          660  - 661      SPOUSWRK_A            662  - 662  
         SPOUSWKFT_A           663  - 663      PRTNRSEX_A            664  - 664  
         PRTNRAGETC_A          665  - 666      PRTNREDUCP_A          667  - 668  
         PRTNRWRK_A            669  - 669      PRTNRWKFT_A           670  - 670  
         SAPARENTSC_A          671  - 671      PARSTAT_A             672  - 672  
 
 
         /* VET  LOCATIONS */
         AFVET_A               673  - 673      AFVETTRN_A            674  - 674  
         COMBAT_A              675  - 675      VADISB_A              676  - 676  
         VAHOSP_A              677  - 677      VACAREEV_A            678  - 678  
 
 
         /* NAT  LOCATIONS */
         NATUSBORN_A           679  - 679      YRSINUS_A             680  - 680  
         CITZNSTP_A            681  - 681  
 
         /* LNG  LOCATIONS */
         LANGHM_A              682  - 682      LANGSPECR_A           683  - 683  
         LANGMED_A             684  - 684      LANGDOC_A             685  - 685  
         LANGSOC_A             686  - 686  
 
         /* SCH  LOCATIONS */
         SCHCURENR_A           687  - 687      SCHDYMSSTC_A          688  - 689  
 
 
         /* EMP  LOCATIONS */
         EMPLASTWK_A           690  - 690      EMPNOWRK_A            691  - 691  
         EMPWHYNOT_A           692  - 693      EMPWHENWRK_A          694  - 694  
         EMPWRKLSW1_A          695  - 695      EMPLSTWOR1_A          696  - 696  
         EMPWKHRS3_A           697  - 698      EMPWRKFT1_A           699  - 699  
         EMPSICKLV_A           700  - 700      EMPHEALINS_A          701  - 701  
         EMPDYSMSS3_A          702  - 704  
 
         /* EMD  LOCATIONS */
         EMDINDSTN1_A          705  - 706      EMDINDSTN2_A          707  - 708  
         EMDOCCUPN1_A          709  - 710      EMDOCCUPN2_A          711  - 712  
         EMDSUPER_A            713  - 713      EMDWRKCAT1_A          714  - 714  
 
 
         /* VOL  LOCATIONS */
         CEVOLUN1_A            715  - 715      CEVOLUN2_A            716  - 716  
 
 
         /* FEM  LOCATIONS */
         PCNTADWKP1_A          717  - 717      PCNTADWFP1_A          718  - 718  
 
 
         /* INC  LOCATIONS */
         INCWRKO_A             719  - 719      INCINTER_A            720  - 720  
         INCSSRR_A             721  - 721      INCSSISSDI_A          722  - 722  
         SSISSDIBTH_A          723  - 723      SSISSDIDSB_A          724  - 724  
         INCWELF_A             725  - 725      INCRETIRE_A           726  - 726  
         INCOTHR_A             727  - 727      IMPNUM_A              728  - 729  
         POVRATTC_A            730  - 734      RATCAT_A              735  - 736  
         IMPINCFLG_A         $ 737  -  737     INCTCFLG_A            738  - 738  
 
 
         /* FOO  LOCATIONS */
         FSNAP12M_A            739  - 739      FSNAP30D_A            740  - 740  
         FWIC12M_A             741  - 741      FLUNCH12M1_A          742  - 742  
 
 
         /* FDS  LOCATIONS */
         FDSRUNOUT_A           743  - 743      FDSLAST_A             744  - 744  
         FDSBALANCE_A          745  - 745      FDSSKIP_A             746  - 746  
         FDSSKIPDYS_A          747  - 748      FDSLESS_A             749  - 749  
         FDSHUNGRY_A           750  - 750      FDSWEIGHT_A           751  - 751  
         FDSNOTEAT_A           752  - 752      FDSNEDAYS_A           753  - 754  
         FDSCAT3_A             755  - 755      FDSCAT4_A             756  - 756  
 
 
         /* HOU  LOCATIONS */
         HOUYRSLIV_A           757  - 757      HOUTENURE_A           758  - 758  
         HOUGVASST_A           759  - 759  
 
         /* SDH  LOCATIONS */
         HOUSECOST_A           760  - 760  
 
         /* TBH  LOCATIONS */
         TRANSPOR_A            761  - 761  
 
         /* CIV  LOCATIONS */
         CEMMETNG_A            762  - 762      CEVOTELC_A            763  - 763  
 
         ;
 
    /* set variable labels */
    label 
         /* IDN  LABELS */
         RECTYPE              = "Record type"
         SRVY_YR              = "Year of the National Health Interview Survey"
         HHX                  = "Randomly assigned household number unique to a household"
         WTFA_A               = "Weight - Final Annual"
 
         /* UCF  LABELS */
         URBRRL               = "2013 NCHS Urban-Rural Classification Scheme for Counties"
         REGION               = "Household region"
         PSTRAT               = "Pseudo-stratum for public-use file variance estimation"
         PPSU                 = "Pseudo-PSU for public-use file variance estimation"
 
         /* FLG  LABELS */
         HHRESPSA_FLG         = "Sample Adult is the household respondent or the proxy who lives in the household"
 
         /* GEN  LABELS */
         INTV_QRT             = "Interview quarter"
         INTV_MON             = "Interview month"
         HHSTAT_A             = "Indicates person is the Sample Adult"
         ASTATNEW             = "Recoded ASTAT"
         AVAIL_A              = "Sample Adult Available"
         PROXY_A              = "Proxy Available"
         PROXYREL_A           = "Proxy's Relationship to Sample Adult"
 
         /* HHC  LABELS */
         SEX_A                = "Sex of Sample Adult"
         AGEP_A               = "Age of SA (top coded)"
         AGE65                = "Age 65 or older"
         HISP_A               = "Recode: Hispanic ethnicity of SA"
         HISPALLP_A           = "Single and multiple race groups with Hispanic origin"
         RACEALLP_A           = "Single and multiple race groups"
         HISDETP_A            = "Hispanic origin detail"
         AFNOW                = "Full-time active duty screener"
         EDUCP_A              = "Educational level of sample adult"
         PCNT18UPTC           = "Top-coded count of persons 18 or older in the household"
         PCNTLT18TC           = "Top-coded count of persons under 18 in the household"
 
         /* FAM  LABELS */
         PCNTADLT_A           = "Number of adults in Sample Adult family, top-coded 3+"
         PCNTKIDS_A           = "Number of children in Sample Adult family, top-coded 3+"
         OVER65FLG_A          = "Indicator for at least 1 person aged 65+ in SA family"
         MLTFAMFLG_A          = "Indicator for multifamily households"
         MAXEDUCP_A           = "Highest level of education of all the adults in the SA's family"
 
         /* HIS  LABELS */
         PHSTAT_A             = "General health status"
 
         /* LSF  LABELS */
         LSATIS4_A            = "Life satisfaction/dissatisfaction"
 
         /* HYP  LABELS */
         HYPEV_A              = "Ever been told you had hypertension"
         HYPDIF_A             = "Told had hypertension on two or more visits"
         HYP12M_A             = "Hypertension, past 12 months"
         HYPMED_A             = "Now taking high blood pressure medication"
 
         /* CHL  LABELS */
         CHLEV_A              = "Ever told you had high cholesterol"
         CHL12M_A             = "High cholesterol, past 12 months"
         CHLMED_A             = "Now taking cholesterol medication"
 
         /* CVC  LABELS */
         CHDEV_A              = "Ever been told you had coronary heart disease"
         ANGEV_A              = "Ever been told you had angina"
         MIEV_A               = "Ever been told you had a heart attack"
         STREV_A              = "Ever been told you had a stroke"
 
         /* ASP  LABELS */
         ASPMEDEV_A           = "Told to take low-dose aspirin"
         ASPMEDNOWN_A         = "Now following aspirin advice"
         ASPMEDSTP_A          = "Advise to stop taking aspirin"
         ASPONOWN_A           = "Taking low dose-aspirin on own"
 
         /* AST  LABELS */
         ASEV_A               = "Ever had asthma"
         ASTILL_A             = "Still have asthma"
         ASAT12M_A            = "Asthma episode"
         ASER12M_A            = "Asthma ER visit"
 
         /* CAN  LABELS */
         CANEV_A              = "Ever been told you had cancer"
         BLADDCAN_A           = "Bladder cancer mentioned"
         BLADDAGETC_A         = "Age when first told had bladder cancer"
         BLOODCAN_A           = "Blood cancer mentioned"
         BLOODAGETC_A         = "Age when first told had blood cancer"
         BONECAN_A            = "Bone cancer mentioned"
         BONEAGETC_A          = "Age when first told had bone cancer"
         BRAINCAN_A           = "Brain cancer mentioned"
         BRAINAGETC_A         = "Age when first told had brain cancer"
         BREASCAN_A           = "Breast cancer mentioned"
         BREASAGETC_A         = "Age when first told had breast cancer"
         CERVICAN_A           = "Cervical cancer mentioned"
         CERVIAGETC_A         = "Age when first told had cervical cancer"
         COLONCAN_A           = "Colon cancer mentioned"
         COLONAGETC_A         = "Age when first told had colon cancer"
         ESOPHCAN_A           = "Esophageal cancer mentioned"
         ESOPHAGETC_A         = "Age when first told had esophageal cancer"
         GALLBCAN_A           = "Gallbladder cancer mentioned"
         GALLBAGETC_A         = "Age when first told had gallbladder cancer"
         LARYNCAN_A           = "Larynx-trachea cancer mentioned"
         LARYNAGETC_A         = "Age when first told had larynx-trachea cancer"
         LEUKECAN_A           = "Leukemia mentioned"
         LEUKEAGETC_A         = "Age when first told had leukemia"
         LIVERCAN_A           = "Liver cancer mentioned"
         LIVERAGETC_A         = "Age when first told had liver cancer"
         LUNGCAN_A            = "Lung cancer mentioned"
         LUNGAGETC_A          = "Age when first told had lung cancer"
         LYMPHCAN_A           = "Lymphoma cancer mentioned"
         LYMPHAGETC_A         = "Age when first told had lymphoma"
         MELANCAN_A           = "Melanoma cancer mentioned"
         MELANAGETC_A         = "Age when first told had melanoma cancer"
         MOUTHCAN_A           = "Mouth, tongue or lip cancer mentioned"
         MOUTHAGETC_A         = "Age when first told had mouth, tongue or lip cancer"
         OVARYCAN_A           = "Ovarian cancer mentioned"
         OVARYAGETC_A         = "Age when first told had ovarian cancer"
         PANCRCAN_A           = "Pancreatic cancer mentioned"
         PANCRAGETC_A         = "Age when first told had pancreatic cancer"
         PROSTCAN_A           = "Prostate cancer mentioned"
         PROSTAGETC_A         = "Age when first told had prostate cancer"
         RECTUCAN_A           = "Rectal cancer mentioned"
         RECTUAGETC_A         = "Age when first told had rectal cancer"
         SKNMCAN_A            = "Skin melanoma cancer mentioned"
         SKNMAGETC_A          = "Age when first told had skin melanoma cancer"
         SKNNMCAN_A           = "Skin non-melanoma cancer mentioned"
         SKNNMAGETC_A         = "Age when first told skin non-melanoma cancer"
         SKNDKCAN_A           = "Skin cancer (don't know what kind) mentioned"
         SKNDKAGETC_A         = "Age when first told had skin cancer (don't know what kind)"
         STOMACAN_A           = "Stomach cancer mentioned"
         STOMAAGETC_A         = "Age when first told had stomach cancer"
         THROACAN_A           = "Throat - pharynx cancer mentioned"
         THROAAGETC_A         = "Age when first told had throat-pharynx cancer"
         THYROCAN_A           = "Thyroid cancer mentioned"
         THYROAGETC_A         = "Age when first told had thyroid cancer"
         UTERUCAN_A           = "Uterine cancer mentioned"
         UTERUAGETC_A         = "Age when first told had uterine cancer"
         HDNCKCAN_A           = "Head and neck cancers mentioned"
         HDNCKAGETC_A         = "Age when first told had head or neck cancer"
         COLRCCAN_A           = "Colorectal cancer mentioned"
         COLRCAGETC_A         = "Age when first told had colon or rectal cancer"
         OTHERCANP_A          = "Other cancer mentioned"
         OTHERAGETC_A         = "Age when first told had other cancer"
         NUMCAN_A             = "Number of reported types of cancers"
 
         /* DIB  LABELS */
         PREDIB_A             = "Ever had prediabetes"
         GESDIB_A             = "Gestational diabetes"
         DIBEV_A              = "Ever had diabetes"
         DIBAGETC_A           = "Age first diagnosed w/diabetes"
         DIFYRSTC1_A          = "Years since first diagnosed w/diabetes"
         DIBPILL_A            = "Taking diabetic pills"
         DIBINS_A             = "Taking insulin"
         DIBINSTIME_A         = "Time from diabetes to insulin"
         DIBINSSTOP_A         = "Ever stop using insulin"
         DIBINSSTYR_A         = "Only stop insulin in first year"
         DIBTYPE_A            = "Diabetes type"
 
         /* CON  LABELS */
         COPDEV_A             = "Ever been told you had COPD, emphysema, or chronic bronchitis?"
         ARTHEV_A             = "Ever had arthritis"
         DEMENEV_A            = "Ever had dementia"
         ANXEV_A              = "Ever had anxiety disorder"
         DEPEV_A              = "Ever had depression"
 
         /* SCE  LABELS */
         HEPEV_A              = "Ever had hepatitis"
         CROHNSEV_A           = "Ever had Crohn's disease"
         ULCCOLEV_A           = "Ever had ulcerative colitis"
         PSOREV_A             = "Ever had psoriasis"
 
         /* CFS  LABELS */
         CFSEV_A              = "Ever had Chronic Fatigue Syndrome"
         CFSNOW_A             = "Still have Chronic Fatigue Syndrome"
 
         /* ISN  LABELS */
         MEDRXTRT_A           = "Weakened immune system due to prescriptions"
         HLTHCOND_A           = "Weakened immune system due to health condition"
 
         /* EPI  LABELS */
         EPIEV_A              = "Ever had epilepsy"
         EPIMED_A             = "Take medication for epilepsy"
         EPINUMSEZP_A         = "How many seizures past 12 months"
         EPIDR_A              = "See a doctor for epilepsy"
 
         /* SVC  LABELS */
         VIMDREV_A            = "Ever had diabetic retinopathy"
         VIMLSDR_A            = "Lost vision due to diabetic retinopathy"
         VIMGLEV_A            = "Ever had glaucoma"
         VIMLSGL_A            = "Lost vision due to glaucoma"
         VIMMDEV_A            = "Ever had macular degeneration"
         VIMLSMD_A            = "Lost vision due to macular degeneration"
         VIMCSURG_A           = "Ever had cataract surgery"
         VIMCAEV_A            = "Ever had cataracts"
         VIMLSCA_A            = "Lost vision due to cataracts"
 
         /* BMI  LABELS */
         PREGNOW_A            = "Pregnant now"
         HEIGHTTC_A           = "Height without shoes (inches), Public Use"
         WEIGHTLBTC_A         = "Weight without shoes (pounds), Public Use"
         BMICAT_A             = "Categorical Body Mass Index, Public Use"
 
         /* VIS  LABELS */
         WEARGLSS_A           = "Wear glasses/contact lenses"
         VISIONDF_A           = "Difficulty seeing"
 
         /* HEA  LABELS */
         HEARAID_A            = "Use hearing aid"
         HEARAIDFR_A          = "How often use hearing aid"
         HEARINGDF_A          = "Difficulty hearing"
 
         /* MOB  LABELS */
         DIFF_A               = "Difficulty walking or climbing steps"
         EQUIP_A              = "Use equipment to get around"
         WLK100_A             = "Difficulty walking 100 yards"
         WLK13M_A             = "Difficulty walking 1/3 mile"
         STEPS_A              = "Difficulty walking steps"
         CANEWLKR_A           = "Use cane or walker"
         WCHAIR_A             = "Use wheelchair or scooter"
         PERASST_A            = "Use someone's assistance"
         NOEQWLK100_A         = "Difficulty walking 100 yards without aid"
         NOEQWLK13M_A         = "Difficulty walking 1/3 mile without aid"
         NOEQSTEPS_A          = "Difficulty walking steps without equipment"
         EQWLK100_A           = "Difficulty walking 100 yards with aid"
         EQWLK13M_A           = "Difficulty walking 1/3 mile with aid"
         EQSTEPS_A            = "Difficulty walking steps with equipment"
 
         /* COM  LABELS */
         COMDIFF_A            = "Difficulty communicating"
 
         /* COG  LABELS */
         COGMEMDFF_A          = "Difficulty remembering/concentrating"
         COGTYPEDFF_A         = "Remembering/concentrating or both"
         COGFRQDFF_A          = "Difficulty remembering-how often"
         COGAMTDFF_A          = "Difficulty remembering-how much"
 
         /* UPP  LABELS */
         UPPSLFCR_A           = "Difficulty with self care"
         UPPRAISE_A           = "Difficulty raising soda bottle"
         UPPOBJCT_A           = "Difficulty using hands and fingers"
         DISAB3_A             = "The Washington Group Short Set Composite Disability Indicator"
 
         /* SOC  LABELS */
         SOCERRNDS_A          = "Difficulty doing errands alone"
         SOCSCLPAR_A          = "Difficulty participating in social activities"
         SOCWRKLIM_A          = "Work limited due to health problem"
 
         /* ADO  LABELS */
         DEVDONSET_A          = "Difficulty doing activities before age 22"
 
         /* INS  LABELS */
         NOTCOV_A             = "Coverage status as used in Health United States"
         COVER_A              = "Health insurance hierarchy under 65"
         COVER65_A            = "Health Insurance hierarchy 65+"
         SINCOVDE_A           = "Single service plan - dental"
         SINCOVVS_A           = "Single service plan - vision"
         SINCOVRX_A           = "Single service plan - prescription"
         MEDICARE_A           = "Medicare recode"
         MCPART_A             = "Type of Medicare coverage"
         MCCHOICE_A           = "Enrolled in Medicare Advantage Plan"
         MCHMO_A              = "Medicare HMO"
         MCADVR_A             = "Medicare Advantage Plan"
         MCDNCOV_A            = "Medicare Advantage Plan pays for any dental care costs"
         MCVSCOV_A            = "Medicare Advantage Plan pays for any vision care costs"
         MCPARTD_A            = "Medicare Part D"
         MEDICAID_A           = "Medicaid recode"
         MAXCHNG_A            = "Medicaid through Marketplace"
         MAPREM_A             = "Medicaid premium"
         MADEDUC_A            = "Medicaid deductible"
         MAHDHP_A             = "Medicaid HDHP"
         MAFLG_A              = "Medicaid reassignment flag"
         PRIVATE_A            = "Private health insurance recode"
         EXCHANGE_A           = "Plan through Health Insurance Exchange, NCHS algorithm"
         POLHLD1_A            = "Policyholder for private plan 1"
         PRPLCOV1_A           = "Plan coverage for others - plan 1"
         PRPOLH1_A            = "Relation to policyholder - plan 1"
         PRPLCOV1_C_A         = "Response to PRPLCOV1_C or PRPLCOV2_C  from child - plan 1"
         PLNWRKR1_A           = "How plan was originally obtained - plan 1"
         PLNEXCHG1_A          = "Health plan obtained through Marketplace - plan 1"
         PLN1PAY1_A           = "Paid for by self or family - plan 1"
         PLN1PAY2_A           = "Paid for by employer or union - plan 1"
         PLN1PAY3_A           = "Paid for by someone outside the household - plan 1"
         PLN1PAY4_A           = "Paid for by Medicare - plan 1"
         PLN1PAY5_A           = "Paid for by Medicaid - plan 1"
         PLN1PAY6_A           = "Paid for by other government program - plan 1"
         HICOSTR1_A           = "Out-of-pocket premium cost - plan 1"
         PRDEDUC1_A           = "Deductible - plan 1"
         PRHDHP1_A            = "High deductible health plan - plan 1"
         HSAHRA1_A            = "Health Savings Accounts / Health Reimbursement Accounts - plan 1"
         PRRXCOV1_A           = "Plan pays for prescription drug - plan 1"
         PRDNCOV1_A           = "Plan pays for dental care - plan 1"
         PRVSCOV1_A           = "Plan pays for vision care - plan 1"
         EXCHPR1_A            = "Exchange company coding NCHS - plan 1"
         PRFLG_A              = "Private reassignment flag"
         PXCHNG1_A            = "Marketplace or state exchange, reassigned from public to private"
         PRPREM1_A            = "Premium on plan reassigned from public to private"
         PLEXCHPR1_A          = "Exchange company coding, NCHS, reassigned from public to private"
         POLHLD2_A            = "Policyholder for private plan 2"
         PRPLCOV2_A           = "Plan coverage for others - plan 2"
         PRPOLH2_A            = "Relation to policyholder - plan 2"
         PRPLCOV2_C_A         = "Response to PRPLCOV1_C or PRPLCOV2_C from child - plan 2"
         PLNWRKR2_A           = "How plan was originally obtained - plan 2"
         PLNEXCHG2_A          = "Health plan obtained through Marketplace - plan 2"
         PLN2PAY1_A           = "Paid for by self or family - plan 2"
         PLN2PAY2_A           = "Paid for by employer or union - plan 2"
         PLN2PAY3_A           = "Paid for by someone outside the household - plan 2"
         PLN2PAY4_A           = "Paid for by Medicare - plan 2"
         PLN2PAY5_A           = "Paid for by Medicaid - plan 2"
         PLN2PAY6_A           = "Paid for by other government program - plan 2"
         HICOSTR2_A           = "Out-of-pocket premium cost - plan 2"
         PRDEDUC2_A           = "Deductible - plan 2"
         PRHDHP2_A            = "High deductible health plan - plan 2"
         HSAHRA2_A            = "Health Savings Accounts / Health Reimbursement Accounts - plan 2"
         PRRXCOV2_A           = "Plan pays for prescription drug - plan 2"
         PRDNCOV2_A           = "Plan pays for dental care - plan 2"
         PRVSCOV2_A           = "Plan pays for vision care - plan 2"
         EXCHPR2_A            = "Exchange company coding NCHS - plan 2"
         CHIP_A               = "Children's Health Insurance Program (CHIP) recode"
         CHXCHNG_A            = "CHIP through Marketplace"
         CHPREM_A             = "Pay CHIP premium"
         CHDEDUC_A            = "CHIP deductible"
         CHHDHP_A             = "CHIP HDHP"
         CHFLG_A              = "CHIP reassignment flag"
         OTHPUB_A             = "State-sponsored health plan recode"
         OPXCHNG_A            = "State-sponsored plan through Marketplace"
         OPPREM_A             = "Pay premium for state-sponsored plan"
         OPDEDUC_A            = "State-sponsored plan deductible"
         OPHDHP_A             = "State-sponsored plan HDHP"
         PLEXCHOP_A           = "Exchange company coding, NCHS (state-sponsored plan)"
         OPFLG_A              = "State-sponsored reassignment flag"
         OTHGOV_A             = "Other government program recode"
         OGXCHNG_A            = "Other government program through Marketplace"
         OGPREM_A             = "Pay premium for other government program"
         OGDEDUC_A            = "Other government program deductible"
         OGHDHP_A             = "Other government program HDHP"
         PLEXCHOG_A           = "Exchange company coding, NCHS (other government program)"
         OGFLG_A              = "Other government reassignment flag"
         MILITARY_A           = "Military health care coverage recode"
         MILSPC1R_A           = "Types of military health care - VA health care"
         MILSPC2_A            = "Types of military health care - TRICARE"
         MILSPC3_A            = "Types of military health care - CHAMP-VA"
         IHS_A                = "Indian Health Service recode"
         HILAST_A             = "How long since last health coverage"
         HILASTMY_A           = "Number of months without coverage"
         HISTOPJOB_A          = "Lost job or changed employers"
         HISTOPMISS_A         = "Missed deadline"
         HISTOPAGE_A          = "Ineligible because of age/left school"
         HISTOPCOST_A         = "Cost increase"
         HISTOPELIG_A         = "Not eligible for Medicaid, CHIP, or other public coverage"
         RSNHICOST_A          = "Not affordable"
         RSNHIWANT_A          = "Do not need or want coverage"
         RSNHIELIG_A          = "Not eligible for coverage"
         RSNHICONF_A          = "Signing up too difficult or confusing"
         RSNHIMEET_A          = "Cannot find a plan that meets the needs"
         RSNHIWAIT_A          = "Coverage has not started yet"
         RSNHIOTH_A           = "Another reason"
         RSNHIJOB_A           = "Lost job"
         RSNHIMISS_A          = "Missed deadline"
         HINOTYR_A            = "No health coverage during the past 12 months"
         HINOTMYR_A           = "Months without coverage in the past 12 months"
         MILSPC1_A            = "Types of military health care - VA health care original response"
         HICOV_A              = "Have health insurance"
         HIKIND01_A           = "Kind(s) of health insurance - private health insurance"
         HIKIND02_A           = "Kind(s) of health insurance - Medicare"
         HIKIND03_A           = "Kind(s) of health insurance - Medicare supplement (Medigap)"
         HIKIND04_A           = "Kind(s) of health insurance - Medicaid"
         HIKIND05_A           = "Kind(s) of health insurance - CHIP"
         HIKIND06_A           = "Kind(s) of health insurance - military related health care"
         HIKIND07_A           = "Kind(s) of health insurance - Indian Health Service"
         HIKIND08_A           = "Kind(s) of health insurance - State-sponsored health plan"
         HIKIND09_A           = "Kind(s) of health insurance - Other government program"
         HIKIND10_A           = "Kind(s) of health insurance - No coverage of any type"
         MCAREPRB_A           = "Medicare coverage probe"
         MCAIDPRB_A           = "Medicaid coverage probe"
 
         /* PAY  LABELS */
         PAYBLL12M_A          = "Problems paying medical bills, past 12m"
         PAYNOBLLNW_A         = "Unable to pay medical bills"
         PAYWORRY_A           = "Get sick or have accident, worry about paying medical bills"
 
         /* CVL  LABELS */
         EVERCOVD_A           = "Ever had COVID-19"
         LONGCOVD1_A          = "Had COVID-19 symptoms for 3 or more months"
         SYMPNOW1_A           = "Currently has COVID-19 symptoms"
         LCVDACT_A            = "COVID-19 impacts activities"
 
         /* DNC  LABELS */
         DENPREV_A            = "Time since last dental exam or cleaning"
         DENDL12M_A           = "Delayed dental care due to cost, past 12 months"
         DENNG12M_A           = "Needed dental care but did not get it due to cost, past 12 months"
 
         /* UTZ  LABELS */
         LASTDR_A             = "Time since last saw doctor"
         WELLNESS_A           = "Was last visit a wellness visit"
         WELLVIS_A            = "Time since last wellness visit"
         USUALPL_A            = "Have a usual place for care"
         USPLKIND_A           = "Type of place for usual care"
         URGNT12MTC_A         = "Number of times visited urgent care, past 12 months, top-coded"
         EMERG12MTC_A         = "Number of times visited hospital emergency room, past 12 months, top-coded"
         HOSPONGT_A           = "Hospitalized overnight, past 12 months"
         MEDDL12M_A           = "Delayed medical care due to cost, past 12 months"
         MEDNG12M_A           = "Needed medical care but did not get it due to cost, past 12 months"
 
         /* TLH  LABELS */
         VIRAPP12M_A          = "Virtual medical appointment, past 12m"
 
         /* HIT  LABELS */
         ACCSSINT_A           = "Internet access"
         ACCSSHOM_A           = "Internet access at home"
         HITLOOK_A            = "Used internet for health information"
         HITCOMM_A            = "Communicated with doctor's office"
         HITTEST_A            = "Used internet for test results"
 
         /* PMD  LABELS */
         RX12M_A              = "Took prescription medication, past 12 months"
         RXSK12M_A            = "Skipped medication doses to save money, past 12m"
         RXLS12M_A            = "Took less medication to save money, past 12 months"
         RXDL12M_A            = "Delayed filling prescription to save money, past 12 months"
         RXDG12M_A            = "Needed prescription medication but did not get it due to cost, past 12 months"
 
         /* PRV  LABELS */
         BPLAST_A             = "Last time blood pressure checked"
         CHOLLAST_A           = "Last time cholesterol checked"
         DIBLAST1_A           = "Last time blood sugar test, if never told had diabetes"
         DIBA1CLAST_A         = "Last time A1C test, if ever told had diabetes"
         DIBA1CNMT_A          = "Number of A1C tests past 12 months - topcoded"
         COLORECTEV_A         = "Ever had a colonoscopy or sigmoidoscopy"
         COLORECTYP_A         = "Had a colonoscopy or sigmoidoscopy or both"
         COLWHEN_A            = "Most recent colonoscopy"
         COLREASON1_A         = "Main reason for recent colonoscopy"
         COLSIGWHEN_A         = "Most recent colonoscopy or sigmoidoscopy"
         SIGWHEN_A            = "Most recent sigmoidoscopy"
         CTCOLEV1_A           = "Ever had a colonography or virtual colonoscopy"
         CTCOLWHEN1_A         = "Most recent colonography or virtual colonoscopy"
         FITHEV1_A            = "Ever had home blood stool test or FIT"
         FITHWHEN1_A          = "Most recent home blood stool test or FIT"
         COLOGUARD1_A         = "Ever had Cologuard"
         FITCOLG1_A           = "Blood stool or FIT was part of Cologuard test"
         CGUARDWHE1_A         = "Most recent Cologuard"
         COLPROB1_A           = "Doctor recommended testing to look for problems in colon or rectum"
         COLTEST1_A           = "Doctor recommended stool blood test, fecal occult blood, or FIT test"
         COLTEST2_A           = "Doctor recommended Cologuard or FIT DNA test"
         COLTEST3_A           = "Doctor recommended sigmoidoscopy"
         COLTEST4_A           = "Doctor recommended colonoscopy"
         COLTEST5_A           = "Doctor recommended CT colonography or virtual colonoscopy"
         COLTEST6_A           = "Doctor recommended other test for colon cancer"
         PSATEST_A            = "Ever had a PSA test"
         PSAWHEN_A            = "Most recent PSA test"
         PSAREASON_A          = "Main reason had a PSA test"
         PSA5YR1_A            = "Number of PSA tests-last 5 years"
         CERVICEV1_A          = "Ever had cervical cancer screening test"
         CERVICWHEN_A         = "Most recent cervical cancer test"
         HYSTEV2_A            = "Had hysterectomy"
         MAMEV_A              = "Ever had mammogram"
         MAMWHEN_A            = "Most recent mammogram"
         MAMREASON_A          = "Main reason for mammogram"
         MAMNOT1_A            = "Most important reason for no mammogram"
         MRIHAD_A             = "Ever had breast MRI"
         MRIWHEN_A            = "Most recent breast MRI"
         MRIREA_A             = "Main reason for breast MRI"
 
         /* GCT  LABELS */
         GTPOSS1_A            = "Ever discussed genetic cancer risk test with doctor"
         GTGRISK_A            = "Ever had a genetic test"
 
         /* FHC  LABELS */
         FHCANEV_A            = "Family ever had cancer"
         FHBCANEV_A           = "Family ever had breast cancer"
         FHBCANNUM_A          = "Number of family members with breast cancer"
         FHBCAN50_A           = "Number of family members with breast cancer before age 50"
         FHOVCANEV_A          = "Family ever had ovarian cancer"
         FHOVCANNUM_A         = "Number of family members with ovarian cancer"
         FHCANRISK_A          = "Talked to doctor about family risk of cancer"
 
         /* IMS  LABELS */
         PREGFLUYR_A          = "Was sample adult pregnant last flu season"
         LIVEBIRTH_A          = "Any live births"
         SHTFLU12M_A          = "Flu vaccine, past 12 months"
         SHTFLUM_A            = "Month of last flu vaccine"
         SHTFLUY_A            = "Year of last flu vaccine"
         FLUPREG_A            = "Was flu shot before or during pregnancy"
         FLUPREG2_A           = "Earlier pregnancy and flu vaccine"
         SHTCVD191_A          = "COVID-19 vaccination"
         SHTCVD19NM1_A        = "Number of COVID-19 vaccinations"
         CVDVAC1M1_A          = "Month of most recent COVID-19 vaccination"
         CVDVAC1Y1_A          = "Year of most recent COVID-19 vaccination"
         SHOTTYPE2_A          = "Brand of first COVID-19 shot"
         SHTPNUEV_A           = "Ever had pneumonia shot"
         SHTPNEUNB_A          = "Number of pneumonia shots"
         SHTSHINGL1_A         = "Ever had a shingles vaccination"
         SHINGYEARP_A         = "Year of most recent Shingles vaccine"
         SHINGWHEN1_A         = "Was last shingles shot before 2017"
         SHINGRIX3_A          = "Ever had Shingrix vaccination"
         SHINGRIXN3_A         = "How many Shingrix shots"
         SHINGRIXFS1_A        = "First or second Shingrix shot"
         TDAPPREG_A           = "Have a Tdap booster shot"
         SHTHEPB1_A           = "Hepatitis B vaccine"
         LIVEHEP_A            = "Live with someone with hepatitis"
         WORKHEALTH_A         = "Currently provide medical care to patients"
         WRKHLTHFC_A          = "Currently volunteer or work in health care"
         TRAVEL_A             = "Travel to other countries since 1995"
 
         /* PTC  LABELS */
         EYEEX12M_A           = "Had eye exam, past 12 months"
         THERA12M_A           = "Received physical/speech/rehabilitative/occupational therapy, past 12 months"
         HOMEHC12M_A          = "Received care at home, past 12 months"
 
         /* ANX  LABELS */
         ANXFREQ_A            = "How often feel worried, nervous, or anxious"
         ANXMED_A             = "Take medication for worried/nervous/anxious feelings"
         ANXLEVEL_A           = "Level of feelings when last felt worried/nervous/anxious"
 
         /* DEP  LABELS */
         DEPFREQ_A            = "How often depressed"
         DEPMED_A             = "Take medication for depression"
         DEPLEVEL_A           = "Level of how depressed"
 
         /* MHC  LABELS */
         MHRX_A               = "Took medication for other emotions/concentration/behavior/mental health, past 12"
         MHTHRPY_A            = "Received counseling/therapy from mental health professional, past 12 months"
         MHTPYNOW_A           = "Currently receiving counseling/therapy from mental health professional"
         MHTHDLY_A            = "Delayed counseling, therapy due to cost, past 12 months"
         MHTHND_A             = "Needed counseling, therapy but did not get it due to cost, past 12 months"
 
         /* MHA  LABELS */
         PHQ41_A              = "How often little interest in things, past 2 weeks"
         PHQ42_A              = "How often feeling down, past 2 weeks"
         PHQ2SCREEN_A         = "PHQ-2 screener result"
         PHQ43_A              = "How often felt nervous/anxious/on edge, past 2 weeks"
         PHQ44_A              = "How often can't stop/control worrying, past 2 weeks"
         GAD2SCREEN_A         = "GAD-2 screener result"
 
         /* EDS  LABELS */
         DISCRIM1_A           = "Treated with less courtesy or respect"
         DISCRIM2_A           = "Receive poor service at restaurant or store"
         DISCRIM3_A           = "Treated as not smart"
         DISCRIM4_A           = "People act afraid of you"
         DISCRIM5_A           = "You are threatened or harassed"
 
         /* HVS  LABELS */
         VIGIL1_A             = "Prepare for possible insults before leaving home"
         VIGIL2_A             = "Careful about your appearance in order to get good service or avoid harassment"
         VIGIL3_A             = "Watch what you say and how you say it"
         VIGIL4_A             = "Avoid certain situations and places"
 
         /* PAI  LABELS */
         PAIFRQ3M_A           = "How often had pain, past 3 months"
         PAIAMNT_A            = "How much pain last time"
         PAIWKLM3M_A          = "How often pain limits life or work"
         PAIAFFM3M_A          = "How often pain impacts family"
         PAIBACK3M_A          = "Back pain"
         PAIULMB3M_A          = "Pain in hands"
         PAILLMB3M_A          = "Pain in hips"
         PAIHDFC3M_A          = "Migraine"
         PAIAPG3M_A           = "Abdominal pain"
         PAITOOTH3M_A         = "Toothache or jaw pain"
 
         /* REP  LABELS */
         REPSTRAIN_A          = "Repetitive strain injuries in the past 3 months"
         REPLIMIT_A           = "Limited by repetitive strain injury in the past 3 months"
         REPSAWDOC_A          = "Saw a doctor about repetitive strain injury"
         REPWRKDYTC_A         = "Number of days missed due to repetitive strain injury"
         REPFUTWRK_A          = "Expected workdays missed due to repetitive strain injury"
         REPSTOPCHG_A         = "Stopped working or changed job due to repetitive strain injury"
         REPREDUCE_A          = "Reduced work or changed tasks due to repetitive strain injury"
         REPWRKCAUS_A         = "Did repetitive strain injury occur while working"
 
         /* INJ  LABELS */
         ANYINJURY_A          = "Any injury in the past 3 months (not including repetitive strain injuries)"
         INJLIMIT_A           = "Limited by injury in the past 3 months"
         NUMINJTC_A           = "Number of injuries in the past 3 months"
         INJHOME_A            = "Did injury occur at home"
         INJWORK_A            = "Did injury occur at work"
         INJSPORTS_A          = "Did injury occur while playing sports or exercising"
         INJFALL_A            = "Did injury occur because of a fall"
         INJFALLHOM_A         = "Did fall occur at home"
         INJFALLWRK_A         = "Did fall occur at work"
         INJMOTOR_A           = "Injury caused by a motor vehicle crash or collision"
         INJMVTYPE1_A         = "Motor vehicle accident - driver"
         INJMVTYPE2_A         = "Motor vehicle accident - passenger"
         INJMVTYPE3_A         = "Motor vehicle accident - bicyclist"
         INJMVTYPE4_A         = "Motor vehicle accident - pedestrian"
         INJMVTYPE5_A         = "Motor vehicle accident - something else"
         INJCHORES_A          = "Did injury occur while doing household activities"
         INJSAWDOC_A          = "Saw a doctor about injury"
         INJER_A              = "Visited ER for injury"
         INJHOSP_A            = "Hospitalized for injury"
         INJBONES_A           = "Did injury cause broken bones"
         INJSTITCH_A          = "Did injury require stitches or staples"
         INJWRKDYTC_A         = "Number of workdays missed due to injury in the past 3 months"
         INJFUTWRK_A          = "Expected workdays missed due to injury"
         INJSTOPCHG_A         = "Stopped working or changed jobs due to injury"
         INJREDUCE_A          = "Reduced work or changed tasks due to injury"
 
         /* TBI  LABELS */
         TBILCDCMG_A          = "Lost consciousness, dazed or confused, or had gap in memory, past 12 months"
         TBIHLSBMC_A          = "Headache, sensitivities, balance problems or mood change, past 12 months"
         TBISPORT_A           = "Blow or jolt to head while playing sports or rec activity, past 12 months"
         TBILEAGUE_A          = "Blow or jolt to head while playing organized sports, past 12 months"
         TBIEVAL_A            = "Evaluated for concussion, past 12 months"
 
         /* ART  LABELS */
         JNTSYMP_A            = "Arthritis symptoms, past 30 days"
         JNTPN_A              = "Arthritis pain, past 30 days"
         ARTHLMT_A            = "Arthritis activity limitations"
         ARTHWRK_A            = "Arthritis work limitations"
         ARTHPH_A             = "Physical activity to help with arthritis"
 
         /* CIG  LABELS */
         SMKEV_A              = "Ever smoked 100 cigarettes"
         SMKNOW_A             = "Now smoke cigarettes"
         SMKCIGST_A           = "Cigarette smoking status"
         CIGNOW_A             = "Number of cigarettes a day"
         SMK30D_A             = "Number of days smoked past month"
         CIG30D_A             = "Number of cigarettes on days smoked past month"
         MENTHOLC_A           = "Smoke menthol or non-menthol cigarettes"
         ECIGEV_A             = "Ever used electronic cigarettes"
         ECIGNOW_A            = "Now use electronic cigarettes"
         SMKECIGST_A          = "Electronic cigarette use status"
 
         /* OTB  LABELS */
         CIGAREV_A            = "Ever smoked a cigar"
         CIGARCUR_A           = "Now smoke cigars"
         CIGAR30D_A           = "How many days smoked a cigar, past 30 days"
         PIPEEV_A             = "Ever smoked a pipe filled with tobacco"
         PIPECUR_A            = "Now smoked pipe filled with tobacco"
         SMOKELSEV_A          = "Ever used smokeless tobacco"
         SMOKELSCUR_A         = "Now use smokeless tobacco"
 
         /* SVI  LABELS */
         AVISEXAM_A           = "Last time had eye exam"
         AVISREH_A            = "Use vision rehabilitation services"
         AVISDEV_A            = "Use vision assistive devices"
         AVISSADV_A           = "Health professional recommend services"
         VIMREAD_A            = "Need eyeglasses or contacts to read up close"
         VIMDRIVE_A           = "Need eyeglasses or contacts to see in distance"
 
         /* SHE  LABELS */
         AHEARST1_A           = "Hearing ability"
         HRWHISP_A            = "Hear whispers"
         EARINFECT_A          = "Ear infection past 12 months"
         EARINFECT3_A         = "3or more ear infections"
         CBALHDINJ_A          = "Lifetime significant head injury"
         CBALHDNO_A           = "Number of lifetime head injuries"
         HRTEST_A             = "Ever had hearing test"
         HRTESTLAST_A         = "How long since hearing test"
         HRAIDAQR_A           = "Hearing aid fit or purchased"
         BALDIZZ_A            = "Balance or dizziness problem past 12 months"
         BALDPROB_A           = "How big of a balance or dizziness problem"
         BALDHP_A             = "Health provider for balance or dizziness problem"
         BFALL12M_A           = "Fallen past 12 months"
         BFALLTIMES_A         = "Number of falls past 12 months"
         HRTINNITUS_A         = "Tinnitus past 12 months"
         HRTINLNG_A           = "Tinnitus how long"
         HRTINPROB_A          = "Tinnitus how big a problem"
         HRTINMEDSP_A         = "Medical specialist for tinnitus"
         HRLOUDJOB_A          = "Ever exposed to loud noise at job"
         HRLOUDJBYR_A         = "Years exposed to loud sounds at job"
         HRLOUDJB12M_A        = "Exposed to loud sounds past 12 months"
         HRJOBPROT_A          = "Job exposure hearing protection"
         HRFIREEV_A           = "Ever used a firearm"
         HRFIRETOTR_A         = "Firearm total rounds"
         HRFIRE12M_A          = "Firearm rounds past 12 months"
         HRFIREPROT_A         = "Firearm hearing protection"
         HRVLOUD12M_A         = "Exposed to very loud sounds past 12 months"
         HRVLDPROT_A          = "Very loud sounds hearing protection"
 
         /* SWE  LABELS */
         HRJBEXP12M_A         = "Job exposure to chemicals, past 12 months"
         HRJBEXP4HR_A         = "Job exposure to chemicals 4 or more hours"
         HRJBEXPTB_A          = "Job exposure to tobacco smoke 4 or more hours, past 12 months"
 
         /* ORN  LABELS */
         ORIENT_A             = "Sexual orientation"
 
         /* MAR  LABELS */
         MARITAL_A            = "Sample adult's current marital status"
         SPOUSLIV_A           = "Sample adult's spouse lives here"
         SPOUSEP_A            = "Sample adult's spouse does not reside here due to legal separation"
         EVRMARRIED_A         = "Sample adult has ever been married"
         MARSTAT_A            = "Current marital status of sample adult"
         LEGMSTAT_A           = "Legal marital status of sample adult"
         SPOUSESEX_A          = "Sex of sample adult's spouse"
         SASPPRACE_A          = "Race of sample adult and spouse or partner are the same"
         SASPPHISP_A          = "Hispanic ethnicity of sample adult and spouse or partner are the same"
         SPOUSAGETC_A         = "Age of sample adult's spouse, top-coded"
         SPOUSEDUCP_A         = "Education level of sample adult's spouse"
         SPOUSWRK_A           = "Working status of sample adult's spouse"
         SPOUSWKFT_A          = "Sample adult's spouse is working full-time"
         PRTNRSEX_A           = "Sex of the sample adult's partner"
         PRTNRAGETC_A         = "Age of sample adult's partner, top-coded"
         PRTNREDUCP_A         = "Education level of sample adult's partner"
         PRTNRWRK_A           = "Working status of sample adult's partner"
         PRTNRWKFT_A          = "Sample adult's partner is working full-time"
         SAPARENTSC_A         = "Sample adult relationship to sample child"
         PARSTAT_A            = "Parental Status of sample adult"
 
         /* VET  LABELS */
         AFVET_A              = "Ever serve active duty military"
         AFVETTRN_A           = "Reserves or National Guard"
         COMBAT_A             = "Ever served abroad during armed conflict"
         VADISB_A             = "Have VA disability rating"
         VAHOSP_A             = "Receive care at VA facility"
         VACAREEV_A           = "Ever use VA health care"
 
         /* NAT  LABELS */
         NATUSBORN_A          = "Born in U.S. or U.S. territory"
         YRSINUS_A            = "Years that sample adult has been in the United States"
         CITZNSTP_A           = "Citizenship status"
 
         /* LNG  LABELS */
         LANGHM_A             = "Other language spoken at home"
         LANGSPECR_A          = "Language at home, public use"
         LANGMED_A            = "Language for TV, news, radio"
         LANGDOC_A            = "Language at doctor"
         LANGSOC_A            = "Language socially"
 
         /* SCH  LABELS */
         SCHCURENR_A          = "Currently in school"
         SCHDYMSSTC_A         = "Days of school missed due to illness or injury past 12 months, top-coded"
 
         /* EMP  LABELS */
         EMPLASTWK_A          = "Worked for pay last week"
         EMPNOWRK_A           = "Temporarily absent from work last week"
         EMPWHYNOT_A          = "Main reason not working"
         EMPWHENWRK_A         = "Last time worked"
         EMPWRKLSW1_A         = "Worked last week"
         EMPLSTWOR1_A         = "Last time worked for pay"
         EMPWKHRS3_A          = "Hours worked per week (topcoded for Public Use)"
         EMPWRKFT1_A          = "Usually work 35+ hours per week"
         EMPSICKLV_A          = "Paid sick leave"
         EMPHEALINS_A         = "Health insurance offered"
         EMPDYSMSS3_A         = "Days missed work, past 12 months (top-coded)"
 
         /* EMD  LABELS */
         EMDINDSTN1_A         = "Detailed 2-digit recode for sample adult's industry"
         EMDINDSTN2_A         = "Simple 2-digit recode for sample adult's industry"
         EMDOCCUPN1_A         = "Detailed 2-digit recode for sample adult's occupation"
         EMDOCCUPN2_A         = "Simple 2-digit recode for sample adult's occupation"
         EMDSUPER_A           = "Supervise other employees"
         EMDWRKCAT1_A         = "Type of main job"
 
         /* VOL  LABELS */
         CEVOLUN1_A           = "Volunteer for organization or association"
         CEVOLUN2_A           = "Other volunteer activities"
 
         /* FEM  LABELS */
         PCNTADWKP1_A         = "Number of adults in sample adult's family who are working (top-coded)"
         PCNTADWFP1_A         = "Number of adults in sample adult's family who are working full-time (top-coded)"
 
         /* INC  LABELS */
         INCWRKO_A            = "Income from wages"
         INCINTER_A           = "Income from accounts"
         INCSSRR_A            = "Income from SS/Railroad Retirement"
         INCSSISSDI_A         = "Family income from SSDI"
         SSISSDIBTH_A         = "Which family income SSI/SSDI"
         SSISSDIDSB_A         = "SSI/SSDI due to disability"
         INCWELF_A            = "Income from public assistance"
         INCRETIRE_A          = "Income from retirement"
         INCOTHR_A            = "Income from other sources"
         IMPNUM_A             = "Imputation num"
         POVRATTC_A           = "SA family poverty ratio (top-coded)"
         RATCAT_A             = "Ratio of family income to poverty threshold for SA's family"
         IMPINCFLG_A          = "Imputed SA family income imputation flag"
         INCTCFLG_A           = "Sample adult family income top-code flag"
 
         /* FOO  LABELS */
         FSNAP12M_A           = "Receive food stamps, past 12m"
         FSNAP30D_A           = "Receive food stamps, past 30d"
         FWIC12M_A            = "Receive WIC benefits, past 12m"
         FLUNCH12M1_A         = "Receive free/reduced meals at school"
 
         /* FDS  LABELS */
         FDSRUNOUT_A          = "Worry food would run out"
         FDSLAST_A            = "Food didn't last"
         FDSBALANCE_A         = "Couldn't afford to eat balanced meals"
         FDSSKIP_A            = "Cut the size of meals or skip meals"
         FDSSKIPDYS_A         = "How many days did you/adults in the family cut the size of meals or skip meals"
         FDSLESS_A            = "Eat less than should"
         FDSHUNGRY_A          = "Ever hungry because not enough money for food"
         FDSWEIGHT_A          = "Lose weight because not enough money for food"
         FDSNOTEAT_A          = "Not eat for a whole day"
         FDSNEDAYS_A          = "How many days not eat"
         FDSCAT3_A            = "Adult 3 category food security recode"
         FDSCAT4_A            = "Adult  4 category food security recode"
 
         /* HOU  LABELS */
         HOUYRSLIV_A          = "Length of time in house or apartment"
         HOUTENURE_A          = "Residence owned or rented"
         HOUGVASST_A          = "Paying lower rent"
 
         /* SDH  LABELS */
         HOUSECOST_A          = "Had trouble paying for housing"
 
         /* TBH  LABELS */
         TRANSPOR_A           = "Delay care in the past 12 months because no reliable transportation"
 
         /* CIV  LABELS */
         CEMMETNG_A           = "Attend public meeting"
         CEVOTELC_A           = "Vote in last local elections"
    ;
 
   
run;
 
