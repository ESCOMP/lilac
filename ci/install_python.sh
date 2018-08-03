#!/usr/bin/env bash

set -e
set -x

# Install miniconda
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${HOME}/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
conda update conda --yes
conda clean -tipy
conda config --set always_yes yes --set changeps1 no
conda --version

conda env create -f ci/environment.yml --name lilac

source activate lilac

cd ${TRAVIS_BUILD_DIR}