FROM tarzan79/alpine-base:arm

RUN git clone https://github.com/Barryrowe/mongo-arm.git
sudo useradd mongo
sudo passwd mongo
cp -R binaries/2.1.1 /etc/mongo
chown -R mongo:mongo /etc/mongo
sudo mkdir /data
sudo mkdir /data/db
sudo chown mongo:mongo /data/db
sudo cp config/mongodb /etc/init.d/mongodb

#####

sudo chmod 755 /etc/init.d/mongodb
sudo cp config/mongod.conf /etc/mongod.conf
sudo update-rc.d mongodb defaults

mongod