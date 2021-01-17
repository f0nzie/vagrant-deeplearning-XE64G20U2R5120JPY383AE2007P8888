#!/bin/bash

echo "Install pyenv"
touch ~/.bash_profile
grep -q -F "export PATH=\"/home/vagrant/.pyenv/bin:\$PATH\"" ~/.bash_profile || echo "export PATH=\"/home/vagrant/.pyenv/bin:\$PATH\"" >> ~/.bash_profile
source ~/.bash_profile
grep -q -F "eval \"\$(pyenv init -)\"" ~/.bash_profile || echo "eval \"\$(pyenv init -)\"" >> ~/.bash_profile
grep -q -F "eval \"\$(pyenv virtualenv-init -)\"" ~/.bash_profile || echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bash_profile
curl -s -S -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
source ~/.bash_profile

echo "Install Anaconda3 with pyenv)"
# pyenv install anaconda3-5.1.0      #? Python 3.6.4
# pyenv install anaconda3-5.3.1      #? Python 
pyenv install anaconda3-2020.07      #? conda from July 2020. Python 3.8.3
# pyenv install anaconda3-2018.12  #! Success
# pyenv install anaconda3-2019.03    #! Success
# pyenv install anaconda3-2019.10    #! FAILED 


echo "Activate anaconda as local pyenv"   
cd /home/vagrant/data
# pyenv local anaconda3-5.1.0     #? set folder with specified environment Python 3.6.4
# pyenv local anaconda3-5.3.1     #? set folder with specified environment Python 3.6.4
pyenv local anaconda3-2020.07   #? set folder with specified environment Python 3.6.4. FAILED
# pyenv local anaconda3-2018.12   #! Success
# pyenv local anaconda3-2019.03     #! Success
# pyenv local anaconda3-2019.10    #! FAILED

pip install tensorflow==2.2 keras    #! install tensorflow
pip install torch

# echo "create deeplearning environment with pyenv 3.7.9"
# cd $HOME
# pyenv install 3.7.9
# pyenv virtualenv 3.7.9 deeplearning
# mkdir pytorch
# cd pytorch
# pyenv local deeplearning
# # pip install tensorflow==2.2 keras    #! install tensorflow

# echo "jupyterhub"
# conda install -c conda-forge jupyterhub
# conda install notebook
# conda install jupyterlab
# sudo mkdir /etc/jupyterhub
# sudo /home/vagrant/.pyenv/versions/deeplearning/bin/jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py
# sudo ~/.pyenv/versions/deeplearning/bin/jupyterhub &
# # echo "install jupyter"
# # pip install jupyter
# # jupyter-notebook --port 8889 --no-browser &    #! doesn't work
# cd $HOME

echo "Setup login directory"
echo "cd /home/vagrant/data/"  >> /home/vagrant/.bash_profile
echo "source ~/.bashrc"  >> /home/vagrant/.bash_profile
