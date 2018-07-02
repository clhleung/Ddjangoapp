# Django Web App
Project to containerize a web application and have it automatically deploy and scale using popular automation tools.

## Tools involved

### Terraform

Terraform is mainly used to create server instances in popular cloud vendors like Google Cloud, Amazon Web Service, & Digital Ocean.
There are configuration files in the repo that can be used to spin up AWS instances that come preloaded with
commands to install Docker, Java 1.8, and Jenkins. 

### AWS

Amazon Web Services offers Linux instances that can be configured to run the Django web application with automation. Linux instances
on Amazon can be created manually or can be created through automation services like Terraform.

### Docker

A popular software used to create containers, which uses the same kernel and makes them more lightweight than virtual machines.
These containers are built from Docker images, which specify the exact contents a container should have. In this project, Docker
will be used to run the underlying services (web server, Python web framework, db, etc....) that make up this application.

Python Django web framework

How to test with Django: https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Testing 

NGINX

gunicorn

Kubernetes

In some sense, Kubernetes pod (smallest & simplest unit in Kubernetes object model) shares some similarities with the
functionalities of Docker-compose, which allows one to run an application consisting of several inter-connected
Docker containers in a yml file. However, pods allow one to scale/replicate an application up & down as needed, in
other words, provide orchestration which Docker does not provide.

https://stackoverflow.com/questions/33946144/what-are-the-differences-between-kubernetes-pods-and-docker-composes-composur
