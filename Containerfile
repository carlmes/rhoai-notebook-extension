 # Image source: https://github.com/opendatahub-io/notebooks/tree/main/jupyter/pytorch/ubi9-python-3.9
 FROM quay.io/opendatahub/workbench-images:jupyter-pytorch-ubi9-python-3.9-2024a-20240528-3b4c246
 
 # Switch to the root user to install Conda
USER 0

# Pull Miniconda binary
#RUN curl --insecure -uu632298:xxx -L -O https://artifactory.wellsfargo.com/artifactory/generic-nonapp-pe-virtual/Anaconda/Miniconda/23.1.0-1/Miniconda-23.1.0-1.tar && \
RUN curl -L -O https://repo.anaconda.com/miniconda/Miniconda3-py39_23.11.0-2-Linux-x86_64.sh && \
    #tar -xvf Miniconda-23.1.0-1.tar -C /tmp && \
    mv Miniconda3-py39_23.11.0-2-Linux-x86_64.sh /tmp/Miniconda.sh && \
    chmod +x /tmp/Miniconda.sh && \
    bash /tmp/Miniconda.sh -bp /opt/conda && \
    rm /tmp/Miniconda.sh

# Switch back the non-root user
USER 1001

WORKDIR /opt/app-root/bin

# Set environment variables to ensure that Conda is initialized
ENV PATH /opt/conda/bin:$PATH
 
# Copy configurations
# COPY libs/.pip .pip
# COPY libs/.condarc .condarc
 
# Copy Conda lib and pip requirements
COPY libs/environment.yaml /opt/app-root/src/
COPY libs/requirements.txt /opt/app-root/src/
 
# Execute installation if conda packages
RUN if [ -s /opt/app-root/src/environment.yaml ]; then \
        echo "Installing conda packages....."; \
        conda install -y --file /opt/app-root/src/environment.yaml && conda clean -a -y; \
    else \
        echo "environment.yaml is empty!"; \
    fi
 
# Execute installation of pip packages
RUN if [ -s /opt/app-root/src/requirements.txt ]; then \
        echo "Installing pip packages....."; \
        #micropipenv install; \
        source /opt/app-root/bin/activate; \
        pip install -r /opt/app-root/src/requirements.txt; \
    else \
        echo "requirements.txt is empty!"; \
    fi

RUN fix-permissions /opt/app-root -P 
WORKDIR /opt/app-root/src
 

 