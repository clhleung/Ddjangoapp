# Dockerfile 

# Dockerfile to be used to host Python Django web application.

# Sets base image to Python 3
FROM python:3

# In case something goes wrong, critical logging 
# info won't be stuck in stdout for Python
ENV PYTHONUNBUFFERED 1

# Make the directories needed, if not created already
RUN mkdir -p /services/djangoapp/src

# Copy over the requirements.txt file to the directory the docker container will use
COPY requirements.txt /services/djangoapp/src

# Set the working directory Docker will use from this point on
WORKDIR /services/djangoapp/src

# Add the app files to the specified working directory Docker will use
ADD ./src /services/djangoapp/src

# Tell Docker to install the following Python packages through pip install
pip install -r requirements.txt

# Exposes container port so outside services can communicate with it
EXPOSE 5005

# Copy over Supervisord config file to /etc/supervisor/conf.d where it will be read
# Run Supervisord, & auto-start Nginx and Gunicorn
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]