Para executar o deploy do cluster, adciona os IPS no hosts.ini

executa o commando abaixo

ansible-playbook site.yaml

Se for ubuntu, basta adcionar no final do endereço hosts `ansible_python_interpreter='python3'`

```
[master]
192.16.35.12 ansible_python_interpreter='python3'

[node]
192.16.35.[10:11] ansible_python_interpreter='python3'

[kube-cluster:children]
master
node

```

O playbook irá baixar  `/etc/kubernetes/admin.conf` na  `$HOME/admin.conf`.

Basta copiar o admin.conf para sua maquina

```sh
$ scp k8s@k8s-master:/etc/kubernetes/admin.conf .
```

Verificar o cluster... kubectl:

```sh

$ export KUBECONFIG=~/admin.conf
$ kubectl get node
NAME      STATUS    AGE       VERSION
master1   Ready     22m       v1.6.3
node1     Ready     20m       v1.6.3
node2     Ready     20m       v1.6.3

$ kubectl get po -n kube-system
NAME                                    READY     STATUS    RESTARTS   AGE
etcd-master1                            1/1       Running   0          23m
...
```