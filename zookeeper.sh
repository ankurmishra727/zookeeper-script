

sudo apt-get install -y openjdk-8-jdk
cd /opt/
sudo wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
sudo tar -zxf zookeeper-3.4.8.tar.gz
sudo mv zookeeper-3.4.8/ zookeeper
sudo rm -rf zookeeper-3.4.8.tar.gz
sudo mkdir /opt/zookeeper/data

touch zookeeper/conf/zoo.cfg

echo "tickTime=2000" >> zookeeper/conf/zoo.cfg
echo "dataDir=/opt/zookeeper/data" >> zookeeper/conf/zoo.cfg
echo "clientPort=2181" >> zookeeper/conf/zoo.cfg
echo "initLimit=5" >> zookeeper/conf/zoo.cfg
echo "syncLimit=2" >> zookeeper/conf/zoo.cfg
 
i=1
while [ $i -le $2 ]
do
    echo "server.$i=152.19.0.$(($i+3)):2888:3888" >> zookeeper/conf/zoo.cfg
    i=$(($i+1))
done

mkdir -p /opt/zookeeper/data

echo $(($1+1)) >> /opt/zookeeper/data/myid
