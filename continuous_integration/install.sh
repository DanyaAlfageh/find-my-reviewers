#!/bin/bash
# Do NOT run this on your PC. This is meant to be run on a virtual machine for testing purpose.

set -e

deactivate
wget 'http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh' -O miniconda.sh
chmod +x miniconda.sh && ./miniconda.sh -b
export PATH=/home/travis/miniconda2/bin:$PATH
conda update --yes conda


conda create --yes -n fmr-test python=3.6 pip atlas flake8 numpy==1.12.0 && source activate fmr-test
pip install -r requirements.txt
cd models
python download.py
cd ..
python manage.py create_table
