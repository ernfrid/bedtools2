BT=${BT-../../bin/bedtools}

check()
{
	if diff $1 $2; then
    	echo ok
	else
    	echo fail
	fi
}

###########################################################
#  Test pair to pair with non-zero length intervals
###########################################################
echo "    pairtopair.t01...\c"
echo \
"1	1000	1100	1	2000	2200	1	1004	1005	1	2100	2101				" > exp
$BT pairtopair -a a.bedpe -b b_nonzero.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t02...\c"
echo \
"1	500	500	1	600	600" > exp
$BT pairtopair -type neither -a a.bedpe -b b_nonzero.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t03...\c"
echo \
"1	1000	1002	1	2000	2200	1	2100	2101	1	1004	1005				
1	1000	1100	1	2000	2200	1	1004	1005	1	2100	2101				" > exp
$BT pairtopair -type either -a a.bedpe -b b_nonzero.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t04...\c"
echo \
"1	500	500	1	600	600
1	1000	1002	1	2000	2200" > exp
$BT pairtopair -type notboth -a a.bedpe -b b_nonzero.bedpe > obs
check obs exp
rm obs exp
###########################################################
#  Test pair to pair with zero length intervals
###########################################################

echo "    pairtopair.t05...\c"
echo \
"1	1000	1100	1	2000	2200	1	1005	1005	1	2100	2100				" > exp
$BT pairtopair -a a.bedpe -b b.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t06...\c"
echo \
"1	500	500	1	600	600" > exp
$BT pairtopair -type neither -a a.bedpe -b b.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t07...\c"
echo \
"1	1000	1002	1	2000	2200	1	2100	2100	1	1005	1005				
1	1000	1100	1	2000	2200	1	1005	1005	1	2100	2100				" > exp
$BT pairtopair -type either -a a.bedpe -b b.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t08...\c"
echo \
"1	500	500	1	600	600
1	1000	1002	1	2000	2200" > exp
$BT pairtopair -type notboth -a a.bedpe -b b.bedpe > obs
check obs exp
rm obs exp

echo "    pairtopair.t09...\c"
touch exp
$BT pairtopair -a a_zl_adjacent.bedpe -b b.bedpe > obs
check obs exp
rm obs exp
