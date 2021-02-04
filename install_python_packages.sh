#/bin/bash
sudo apt-get install -y --no-install-recommends python-tk
pip -V
if [ $? -ne 0 ]; then
  ./install_pip2.sh
fi
sudo /usr/bin/python2 -m pip install pylint -U
sudo /usr/bin/python3 -m pip install pylint -U
sudo /usr/bin/python2 -m pip install autopep8 -U 
sudo /usr/bin/python3 -m pip install autopep8 -U
sudo /usr/bin/python2 -m pip install autoflake -U
sudo /usr/bin/python3 -m pip install autoflake -U
