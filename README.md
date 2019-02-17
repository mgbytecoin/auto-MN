# Megabyte coin:
## Desktop wallet setup

First you need to adjust your desktop wallet accordingly. Here are the steps for Windows Wallet

Open your MegaByteCoin Coin table wallet.
1. Open the MegaByteCoin Coin Desktop Wallet.
2. Go to RECEIVE and create a New Address: **MN1**
3. Send **1000** **MegaByteCoin** to **MN1**.
4. Wait for 6 confirmations.
5. Go to **Tools -> "Debug console - Console"**
6. Type the following command: **masternode genkey**
7. Save the **Masternode Private Key** results to txt file
8. Type the following command: **masternode outputs**
9. Save the **TxHashresults** and **Output index** to txt file
10. Go to  **Tools -> "Open Masternode Configuration File"**
11. Add the following entry:
```
Alias Address Privkey TxHash Output_index
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 8**
* Output index:  **Second value from Step 8**
12. Save and close the file.
13. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
14. Click **Update MISSING** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is unlocked.
```
***

## Installation MGB masternode:

Shell script to install a [MegaByteCoin Masternode](http://mgbcoin.info/) on a Linux server running Ubuntu 14.04, 16.04 or 18.04. Use it on your own risk.
```
https://github.com/mgbytecoin/auto-MN.git
cd auto-MN
bash MGB_masternode_install.sh
```

On **Enter masternode private key for masternode MGB.  Go To your LOCAL  Wallet. Menu: Tools > Debug Console , Type masternode genkey** enter value from **from Step 8**
***

## Usage masternode:
```
megabytecoin-cli getinfo
megabytecoin-cli mnsync status
megabytecoin-cli masternode status
```
Also, if you want to check/start/stop **MegaByteCoin** , run one of the following commands as **root**:

**Ubuntu 16.04**:
```
systemctl status MegaByteCoin #To check the service is running.
systemctl start MegaByteCoin #To start MegaByteCoin service.
systemctl stop MegaByteCoin #To stop MegaByteCoin service.
systemctl is-enabled MegaByteCoin #To check whetether MegaByteCoin service is enabled on boot or not.
```
**Ubuntu 14.04**:  
```
/etc/init.d/MegaByteCoin start #To start MegaByteCoin service
/etc/init.d/MegaByteCoin stop #To stop MegaByteCoin service
/etc/init.d/MegaByteCoin restart #To restart MegaByteCoin service
```
***
