# ================================
# Stage 1: Conda environment setup
# ================================
FROM continuumio/miniconda3 AS conda-env

# Create a non-root user
RUN groupadd -r datascientist && useradd -m -r -g datascientist datascientist
 
# Install necessary Conda packages and create conda env (This will change for every DS usecase)
COPY environment.yml /tmp/environment.yml
RUN conda config --append channels conda-forge && \
    conda env create -f /tmp/environment.yml

# ==================================
# Stage 2: PyTorch with CUDA support 
# ==================================

# Image source: https://github.com/opendatahub-io/notebooks/tree/main/jupyter/pytorch/ubi9-python-3.9
FROM quay.io/opendatahub/workbench-images:jupyter-pytorch-ubi9-python-3.9-2024a-20240528-3b4c246
 
# Copy Conda environment from the previous stage
COPY --from=conda-env /opt/conda /opt/conda
 
# Set environment variables to ensure that Conda is initialized
ENV PATH /opt/conda/bin:$PATH
ENV CONDA_DEFAULT_ENV machine-learning-env
ENV CONDA_PREFIX /opt/conda/envs/machine-learning-env
 
# Switch to the non-root user
# USER datascientist
 
# Expose the port for Jupyter Notebook
# EXPOSE 8888
 
# Start Jupyter Notebook
# CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]
