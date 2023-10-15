#!/bin/bash

# Actualizar el sistema
yum -y update

# Generar una clave SSH
ssh-keygen -t rsa

# Solicitar la dirección IP o nombre de host
read -p "Ingresa la dirección IP o nombre de host (por ejemplo, vm1.192.168.0.101.nip.io): " host_address

# Copiar la clave SSH al servidor remoto
ssh-copy-id root@$host_address

# Instalar paquetes necesarios
yum -y install wget git perl net-tools docker-1.13.1 bind-utils iptables-services bridge-utils openssl-devel bash-completion kexec-tools sos psacct python-cryptography python2-pip python-devel python-passlib java-1.8.0-openjdk-headless "@Development Tools"
yum -y install python-passlib httpd-tools; yum -y install epel-release; yum -y install ansible

# Clonar el repositorio de OpenShift Ansible
git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible
git checkout release-3.11

# Descargar el archivo de inventario
wget https://raw.githubusercontent.com/ogflobal/Guia-de-OpenShift-en-CentOS/main/inventory_wildcard_external

# Ejecutar el playbook de requisitos previos
ansible-playbook -i inventory_wildcard_external playbooks/prerequisites.yml

# Ejecutar el playbook de implementación del clúster
ansible-playbook -i inventory_wildcard_external playbooks/deploy_cluster.yml

# Solicitar la contraseña
read -p "Ingresa la nueva contraseña del administrador: " password

# Crear un usuario administrador
sudo htpasswd -b /etc/origin/master/htpasswd admin $password

# Asignar el rol de administrador del clúster al usuario
sudo oc adm policy add-cluster-role-to-user cluster-admin admin

# Observar los despliegues, servicios y pods en todos los espacios de nombres
sudo watch oc get deployments,services,pods --all-namespaces

