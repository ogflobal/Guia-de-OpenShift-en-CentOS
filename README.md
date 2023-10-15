# Guia-de-OpenShift-en-CentOS

oc login https://vm1.192.168.0.101.nip.io:8443

![Screenshot from 2023-10-15 17-48-13](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/ee875b5f-cf68-472a-a13e-5da18f123a2e)

https://vm1.192.168.0.101.nip.io:8443

![image](https://github.com/ogflobal/Guia-de-OpenShift-en-CentOS/assets/74718043/853c8c4e-7d3c-4d12-9f94-d160ae032183)


```sh
oc new-project my-project
oc tag --source=docker openshift hello-openshift:latest
oc new-app hello-openshift
oc expose service hello-openshift --name my-service
oc get service hello-openshift
oc get route my-service
oc edit deploymentconfig hello-openshift
oc describe service hello-openshift
curl http://<cluster-ip|external-ip>:<port>
```

```sh
oc project default
oc whoami -c
oc scale deploymentconfig hello-openshift --replicas=3
oc delete all -l app=hello-openshift
oc delete project my-project
oc logout
```
