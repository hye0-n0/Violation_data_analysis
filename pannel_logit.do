cap log close
clear
set more off 
pause off

tsset id time
corr vio parentlove_ary	parentorder_ary smartphone_ary  lifesatis_ary angry_ary dump_ary bully_ary group_ary   		 studypos_ary, m

* 문자열 변수 조사
tsset id time
tab time pincome4 
tab time vio
 
summarize vio parentlove_ary	parentorder_ary smartphone_ary studypos_ary lifesatis_ary angry_ary dump_ary group_ary   		bully_ary
pause

tsset id time
quietly xtlogit vio parentlove_ary	parentorder_ary, fe
estimates store reg1

tsset id time
quietly xtlogit vio parentlove_ary	parentorder_ary	studypos_ar	lifesatis_ary	selfpos_ary	 angry_ary	grit_ary dump_ary group_ary pincome4 , fe
estimates store reg2

tsset id time
quietly xtlogit vio parentlove_ary	parentorder_ary	studypos_ar	lifesatis_ary	selfpos_ary	 angry_ary	grit_ary dump_ary group_ary smartphone_ary i.relaiton_class_ary, fe
estimates store reg3

estimates tab reg1 reg2 reg3 , b se p stats(N  F)

tsset id time
quietly xtlogit vio parentlove_ary	parentorder_ary smartphone_ary pincome4 lifesatis_ary angry_ary dump_ary bully_ary group_ary  studypos_ary , fe
estimates store FE

tsset id time
quietly xtlogit vio parentlove_ary	parentorder_ary smartphone_ary pincome4 lifesatis_ary angry_ary dump_ary bully_ary group_ary  studypos_ary , re
estimates store RE

hausman FE RE 

tsset id time
xtlogit vio parentlove_ary	parentorder_ary smartphone_ary pincome4 lifesatis_ary angry_ary dump_ary bully_ary group_ary  studypos_ary , fe

tsset id time
xtlogit vio parentlove_ary	parentorder_ary smartphone_ary pincome4 lifesatis_ary angry_ary dump_ary bully_ary group_ary  studypos_ary , re


tsset id time
xtlogit vio parentlove_ary	parentorder_ary smartphone_ary pincome4 angry_ary dump_ary bully_ary group_ary  , fe





