
num=1
rep=20

tr -d "\t\n\r\f" < dna.txt> cdna1.txt
tr -d '[:space:]' <cdna1.txt> cdna.txt
sed -e "s/.\{$rep\}/&$/g" < cdna.txt >  cdna0.txt

for i in {1..20}; do
    x=$(($i-$num));
    y=$(($x + $num));

    if [ $i -eq $num ];then



    sed -r "s/^.{1}//" cdna.txt>tdna"$i".txt;
    sed -e "s/.\{$rep\}/&$/g" < tdna"$i".txt >  cdna"$i".txt;

    else 
    sed -r "s/^.{1}//" tdna"$x".txt>tdna"$i".txt;
    
    sed -e "s/.\{$rep\}/&$/g" < tdna"$i".txt >  cdna"$i".txt;
    fi   
done
rm tdna*