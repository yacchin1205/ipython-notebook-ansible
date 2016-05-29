FROM jupyter/notebook:4.2.0
MAINTAINER https://github.com/nii-clouds/

RUN apt-get update && \
    apt-get -y install git wget curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
ADD conf /tmp/
RUN cp -f /tmp/jupyter_notebook_config.py \
       $HOME/.jupyter/jupyter_notebook_config.py

### Prepare PIP
RUN pip2 install distribute

### Python2 kernel with matplotlib, etc...
RUN apt-get update && \
    apt-get install -y --no-install-recommends libav-tools \
                 libpng-dev libfreetype6-dev libatlas-base-dev \
                 libopenblas-base libopenblas-dev libjpeg-dev \
                 gfortran libhdf5-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip2 install pandas matplotlib numpy && \
    pip2 install seaborn scipy && \
    pip2 install scikit-learn scikit-image sympy cython patsy \
                 statsmodels cloudpickle dill bokeh h5py

### ansible
RUN apt-get update && \
    apt-get -y install python-yaml sshpass openssl ipmitool && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip2 install requests paramiko ansible && \
    cat /tmp/sitecustomize.py >> /usr/lib/python2.7/sitecustomize.py
