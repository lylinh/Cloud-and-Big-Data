
HERE=`pwd`
cd ..
HAGIHOME=`pwd`
cd $HERE

docker network create haginet


#####################
CONTNAME=master
CONTCPU=0
docker run --cpuset-cpus="$CONTCPU" --net haginet --name $CONTNAME --hostname $CONTNAME -p 8080:8080 -d -v $HAGIHOME/shared/:/root/shared/ server
#####################

for ((n=1;n<=$1;n++)); do
    CONTNAME="slave$n"
    CONTCPU=$n
    echo "Init slave with CONTNAME=$CONTNAME and CONTCPU=$CONTCPU"
    
	
docker run --cpuset-cpus="$CONTCPU" --net haginet --name $CONTNAME --hostname $CONTNAME -d -v $HAGIHOME/shared/:/root/shared/ server 

done


