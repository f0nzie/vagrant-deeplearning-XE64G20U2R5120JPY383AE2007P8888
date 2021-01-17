#!/bin/bash

echo "Install system requirements"
apt-get --quiet update
apt-get install -y --no-install-recommends \
	curl \
	git

# for pyenv
apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# for JupyterHub
apt-get install -y npm nodejs-legacy

echo "Install pyenv"
curl -# -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo "Setup home directory"
ln -s /vagrant/ /home/vagrant/data        # symbolic link to host files on folder data
chown vagrant.vagrant /home/vagrant/data

echo "Setup Jupyter auto start"
cat >/etc/systemd/system/jupyter.service <<EOL
[Unit]
Description=Jupyter Workplace

[Service]
Type=simple
PIDFile=/run/jupyter.pid
Environment="PATH=/home/vagrant/.pyenv/versions/anaconda3-2020.07/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
# ExecStart=/home/vagrant/.pyenv/versions/anaconda3-5.1.0/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
# ExecStart=/home/vagrant/.pyenv/versions/anaconda3-5.3.1/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
# ExecStart=/home/vagrant/.pyenv/versions/anaconda3-2018.12/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
# ExecStart=/home/vagrant/.pyenv/versions/anaconda3-2019.03/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
# ExecStart=/home/vagrant/.pyenv/versions/anaconda3-2019.10/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
ExecStart=/home/vagrant/.pyenv/versions/anaconda3-2020.07/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/data
# ExecStart=/home/vagrant/.pyenv/versions/deeplearning/bin/jupyter notebook --port=8890 --no-browser --ip=0.0.0.0 --NotebookApp.token= --notebook-dir=/home/vagrant/
User=vagrant
Group=vagrant
WorkingDirectory=/home/vagrant/data
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# export PATH="/home/vagrant/.pyenv/versions/anaconda3-2020.07/bin:$PATH"

systemctl enable jupyter.service
systemctl daemon-reload
systemctl restart jupyter.service
