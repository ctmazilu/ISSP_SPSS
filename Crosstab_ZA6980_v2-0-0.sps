* Encoding: UTF-8.
*/ this is a crosstabulation of v32 (Label: Q9b Past 4 weeks how often felt: isolated from others?) and WRKHRS (Hours worked weekly */

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=v32 BY WRKHRS
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

*/ I have recoded the variable WRKHRS to create a more manageable interval ratio /*
*/ see table 1. in Crosstabulation Report for more information */

DATASET ACTIVATE DataSet1.
RECODE WRKHRS (MISSING=SYSMIS) (1 thru 10=1) (11 thru 20=2) (21 thru 30=3) (31 thru 40=4) (41 thru 
    50=5) (51 thru 60=6) (61 thru 70=7) (71 thru 80=8) (81 thru 97=9) (98 thru 99=0) INTO WRKHRS_Recode.    
VARIABLE LABELS  WRKHRS_Recode 'Hours worked weekly'.
EXECUTE.

*/ this is the crosstabulation of v32 (Label: Q9b Past 4 weeks how often felt: isolated from others?) and WRKHRS_Recode (Hours worked weekly */

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=v32 BY WRKHRS_Recode
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

*/ This is a Univariate analysis of the variable WRKHRS_Recode */

FREQUENCIES VARIABLES=WRKHRS_Recode
  /FORMAT=NOTABLE
  /NTILES=4
  /STATISTICS=STDDEV RANGE MEAN MEDIAN MODE SKEWNESS SESKEW KURTOSIS SEKURT
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.
