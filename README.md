# Guia-de-OpenShift-en-CentOS

![image](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/6900a031-4a59-4327-bfe9-46d8e3f27323)

Descarga y ejecuta el archivo [implementación](/Guia-de-OpenShift-en-CentOS_automatic.sh) con privilegios de administrador.

![image](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/8eee9463-6fef-4a07-9dbb-18bef90b6f00)

**Iniciar sesión en OpenShift**

oc login https://vm1.192.168.0.101.nip.io:8443

![Screenshot from 2023-10-15 17-48-13](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/ee875b5f-cf68-472a-a13e-5da18f123a2e)

**Acceder a la URL de OpenShift**

https://vm1.192.168.0.101.nip.io:8443

![Screenshot from 2023-10-15 17-56-40](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/6ff4a811-6971-48ad-8a75-c318b9ac4f17)

**Aprendizaje**

```sh
# Crear un nuevo proyecto
oc new-project my-project

# Etiquetar una imagen Docker en el proyecto
oc tag --source=docker openshift/hello-openshift:v3.9.0 hello-openshift:latest

# Crear una nueva aplicación utilizando la imagen etiquetada
oc new-app hello-openshift

# Exponer el servicio de la aplicación y asignarle un nombre
oc expose service hello-openshift --name my-service

# Obtener información sobre el servicio creado
oc get service hello-openshift

# Obtener información sobre la ruta pública del servicio
oc get route my-service

# Describir el servicio para obtener más detalles
oc describe service hello-openshift

# Realizar una solicitud HTTP a la dirección especificada (se debe reemplazar <cluster-ip|external-ip> y <port> con valores reales)
curl http://<cluster-ip|external-ip>:<port>
```

![Screenshot from 2023-10-15 18-41-40](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/04de5554-f077-4d6d-be62-70c1b54be38f)

![Screenshot from 2023-10-15 18-43-52](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/7f112cd2-748d-4532-b1bc-c20e1a818a93)
