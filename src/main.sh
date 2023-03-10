#!/bin/bash
#####CHANGE THESE#########################################
## visit go.dev/dl and copy/paste your desired version. ##
##########################################################
GOV=go1.19.4.linux-amd64.tar.gz
FLD=/usr/local/bin/go ##for old version check. It will delete any current GO installations.
FLD1=$HOME/go ##installation target for GO and go/bin. upside: User vs root or sudo.
vSN=v4.1.0 ## version to be installed.
gSN=v4.1.0 ## version to be pulled/checkedout from GITHUB. 
GIT=https://github.com/ChihuahuaChain/chihuahua.git ## GITHUB clone link.
FLD2=$HOME/chihuahua ## where the main chihuahua folder will be installed.
DAE_NODE=chihuahuad ## Daemon name, without the "." infont."
##########################################################

function update(){
  command sudo apt update && sudo apt upgrade -y
}
function gitclone(){
  command git clone $GIT
}
function move() {
  if cd $FLD2 2>/dev/null; then
    echo "Moved to $FLD2, staring GIT CLONING..."
      else
    echo "Can't move to $FLD2, stopping";
    exit 1;
  fi
}
function gitrun() {
    command git fetch --tags &&
    command git checkout v4.1.0 &&
    command make install
}
function dlinstall() {
  wget https://go.dev/dl/$GOV
}
function tarf() {
  tar xf $1
}
function pathlock() {
  if go version 2>/dev/null; then
    echo " All is well for GO. Moving on"
  else
    echo "*******************************"
    echo "running gopath"
    gopath
  fi
}
function gopath() {
  echo $PATH
  export PATH=$PATH:$HOME/go/bin
  # sudo ln -s $HOME/go/bin/go /usr/local/bin/go
}
function goclean() {
if [[ -f "$GOV" ]]; then
  command sudo rm -r $GOV
  command echo "$GOV Removed."
else
  command echo "no GO installation found."
fi
}
function basics_loop() {
  reqApp=(wget git make gcc jq net-tools)
  for check in ${reqApp[*]}
  do
    command sudo apt install $check -y
  done
}
echo "##############################################################"
echo "                 Welcome to vChihuahuad                      #"
echo "##############################################################"
read -p "Press any key to continue or CTRL-C to abort"
update
echo "##########################################################"
echo "                SYSTEM UPDATED & UPGRADED                 "
echo "##########################################################"
sleep 2
echo "##########################################################"
echo "                      INSTALLING GO                       "
echo "##########################################################"
echo ""
echo "looking for old GO installation in $FLD & $FLD1"
sleep 2
echo "Downloading and installing GO."
echo "sleeping 2 seconds"
# sleep 2
if dlinstall; then
  echo "xtracting GO to $HOME/go"
  tarf $GOV
  echo "xtraction complete."
else
  echo "error decompressing"
fi
if pathlock; then
  echo "setting up GO path"
  goclean
  echo "$GOV remove. Squeeky Clean!"
fi
command cd
sleep 2

echo "  ###############################################################"
echo "  #                           GO INSTALLED                      #"
echo "  ###############################################################"
echo "##################################################################"
echo "# INSTALLING WGET, MAKE, GCC, JQ and GIT #"
echo "#####################@############################################"
read -p "Press Enter to continue or CTRL-C to cancel"



basics_loop
sleep 2

command echo "Running GIT Cloning and $DAE_NODE installation."

if gitclone; then 
    if move; then
        if gitrun; then
          command echo "All is well! $DAE_NODE Installed."
          command sudo ln -s $HOME/go/bin/$DAE_NODE /usr/local/bin
          command $DAE_NODE version
            else
          command echo "Error with GIT, stopping."
          exit 1
        fi
      command echo "CD'd to $FLD2."
        else
      command echo "Can't move to $FLS2. Stopping."
      exit 1
    fi
  command echo "Cloned Successfully."
    else
  command echo "Can't clone $GIT. Stopping."
fi
sleep 2

echo "##########################################################"
echo "                    Backing Up CHIHUAHUAd                 "
echo "##########################################################"

CP1=command mkdir $HOME/backup_$DAE_NODE
CP2=command cp $HOME/go/bin/$DAE_NODE $HOME/backup_$DAE_NODE

function cmd1() {
  command $1
}

for sc in $CP1 $CP2
do
 cmd1 $sc
done

echo ""
echo "Folder creation and Cpy Complete."
echo ""
sleep 2

echo "#################################################################################################"
echo "                                        Ready for init.                                          "
echo "               Have a look at GITHUB and start at 3. Initialize your node:                       "                        
echo "https://github.com/Sifchain/sifchain-validators/blob/master/docs/nodes/setup/standalone/manual.md"
echo "#################################################################################################"
