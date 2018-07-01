# Dockerfile 

# Dockerfile to be used to host Python Django web application.

# Sets base image to Python 3
FROM python:3

# In case something goes wrong, critical logging 
# info won't be stuck in stdout for Python
ENV PYTHONUNBUFFERED 1

# Exposes container port so outside services can communicate with it
EXPOSE 5005

# Some command that will be executed
CMD python 