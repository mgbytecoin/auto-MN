#/bin/bash
clear
echo "Do you want to install all needed dependencies (NO if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
sudo apt-get update
sudo apt-get -y upgrade
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install -y libminiupnpc10
sudo apt-get install -y libzmq3-dev
fi
echo "------->8-------->8--------->8------------"
echo "Do you want to install MGB Daemon (please choose no if you did it before)? [y/n]"
read DOSETUPTWO
if [[ $DOSETUPTWO =~ "y" ]] ; then
megabytecoin-cli stop > /dev/null 2>&1
wget https://github.com/mgbytecoin/mgbcoin/releases/download/1/daemon.tar
tar -xvf daemon.tar -C /usr/local/bin
chmod +x /usr/local/bin/megabytecoin*
rm daemon.tar
fi
echo "------->8-------->8--------->8------------"
echo "Configuring IP"
IP=$(wget -qO- ipinfo.io/ip)
echo "IP Done:" $IP;
echo "------->8-------->8--------->8------------"
echo "Enter masternode private key for masternode MGB.  Go To your LOCAL  Wallet. Menu: Tools > Debug Console , Type masternode genkey"
read PRIVKEY
CONF_DIR=~/.megabytecoin/
CONF_FILE=megabytecoin.conf
PORT=19662

mkdir -p $CONF_DIR
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` > $CONF_DIR/$CONF_FILE
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
echo "rpcport=19663" >> $CONF_DIR/$CONF_FILE
echo "listen=1" >> $CONF_DIR/$CONF_FILE
echo "server=1" >> $CONF_DIR/$CONF_FILE
echo "daemon=1" >> $CONF_DIR/$CONF_FILE
echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "port=$PORT" >> $CONF_DIR/$CONF_FILE
echo "mastenodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
echo "------->8-------->8--------->8------------"
echo "Starting MGB daemon..."
megabytecoind -daemon
