/*

Shawn Houser
2019-12-19
Final Exam Part 2

*/

/* 1.a */
DATA rainfall;
INPUT CITY$ RAIN_JUNE RAIN_JULY RAIN_AUGUST;
AVERAGE = MEAN(RAIN_JUNE, RAIN_JULY, RAIN_AUGUST);
PERCENT_JUNE = 100 * ( RAIN_JUNE / MEAN(RAIN_JUNE, RAIN_JULY, RAIN_AUGUST));
PERCENT_JULY = 100 * ( RAIN_JULY / MEAN(RAIN_JUNE, RAIN_JULY, RAIN_AUGUST));
PERCENT_AUGUST = 100 * ( RAIN_AUGUST / MEAN(RAIN_JUNE, RAIN_JULY, RAIN_AUGUST));
DATALINES;
Trenton 23 25 25 30
Newark 18 27 22
Albany 22 21 27
;
RUN;

/* 1.b */
PROC SORT DATA = rainfall;
BY CITY;
RUN;

/* 1.c */
PROC MEANS DATA = rainfall ALPHA=0.05 CLM;
RUN;

/* 2.a */
/*

H0: p1 - p2 = 0
Ha: p1 - p2 != 0

p1 = Pr(Protector having a fracture)
p2 = Pr(Control having a fracture)

We are doing a one-way frequency comparison

*/

/* 2.b*/
data hipfracture;
input Group$ HadFracture$ Count;
datalines;
Protector Yes 13
Protector No 640
Control Yes 67
Control No 1081
;
RUN;

PROC FREQ DATA = hipfracture;
weight Count;
tables Group * HadFracture / chisq relrisk; 
RUN;

/* 2.c */
/*

Test statistic = 14.5006
p-value = 0.0001

*/

/* 2.d */
/*

Because our p-value is below 0.05,
we reject H0 in favor of Ha and conclude that
hip protectors do have a significant impact on
reducing the chance of getting a hip fracture

*/


/* 3.a */
data druglength;
input Sample Value;
datalines;
1 10.6
1 10.2
1 10.5
1 10.3
1 10.8
1 9.8
1 10.6
1 10.7
1 10.2
1 10.0
2 9.9
2 9.8
2 9.6
2 10.1
2 10.2
2 10.1
2 9.7
2 9.5
2 9.6
2 9.8
;
RUN;

proc univariate data=druglength plot;
   by Sample;
   var Value;
run;
/*

See attatched images for the graphs and boxplot

*/

/* 3.b */
PROC TTEST DATA = druglength;
VAR Value;
RUN;

/*

Due to a p-value of < 0.0001 we reject H0 in favor of Ha and
conclude that storing the drug over a period of time does
have an effect on its potency

*/

/* 4.a */
DATA headinjury;
INFILE '/run/home/shawn/sas/HeadInjury.txt';
INPUT caresize$ headinjury;
RUN;

/* 4.b */
/*

H0: mu1 = mu2 = mu3
Ha: at least one of the means is different

*/

PROC ANOVA DATA=headinjury;
CLASS carsize;
MODEL headinjury=carsize;
RUN;

/* 4.c */
/*

With a p-value of 0.6759 we fail to reject H0 at the 0.05
confidence value. Therefore we still are under the assumption
that car size has no effect on the means of the headinjury

*/

/* 4.d */
/*

There was no significant difference

*/
