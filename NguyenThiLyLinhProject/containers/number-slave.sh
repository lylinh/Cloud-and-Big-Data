
echo "" > ../shared/hadoop-2.7.1/etc/hadoop/slaves
echo "" > ../shared/spark-2.4.3-bin-hadoop2.7/conf/slaves
for ((n=1;n<=$1;n++)); do
	echo "slave$n" >> ../shared/hadoop-2.7.1/etc/hadoop/slaves
	echo "slave$n" >> ../shared/spark-2.4.3-bin-hadoop2.7/conf/slaves
done
