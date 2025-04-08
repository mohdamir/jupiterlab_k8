# Use the official Jupyter base notebook image as the base image
FROM jupyter/base-notebook:latest

# Install any additional Python packages you need
USER root  # Switch to the root user to install packages globally
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    # Add any other packages here
    && chown -R $NB_UID:$NB_GID /home/jovyan

# Switch back to the jovyan user (default user in the Jupyter base image)
USER jovyan
