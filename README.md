# Inception-of-things
Ce projet vise à construire Kubernetes et d'apprendre sa configuration en utilisant Vargant et AgroCD.


Vagrant est l’outil que tu utilises pour automatiser la création des machines virtuelles. Tu lui donnes une configuration, et il s’occupe de lancer les VMs.

Le Vagrantfile est le fichier où tu décris ce que tu veux créer : combien de machines, leurs noms, leurs hostnames, leurs IP, leur RAM, leur CPU, etc.

Ensuite, Vagrant a besoin d’un provider, c’est-à-dire un moteur capable de réellement créer et exécuter les VMs. Dans ton cas, ce provider est libvirt.

libvirt est une couche de gestion. Il permet à Vagrant de communiquer avec les technologies de virtualisation comme KVM/QEMU. On peut voir libvirt comme l’intermédiaire entre Vagrant et le moteur de virtualisation.

KVM est la technologie de virtualisation intégrée au noyau Linux. Elle permet à Linux d’utiliser directement les fonctions de virtualisation du processeur.

QEMU sert à émuler et exécuter les machines virtuelles. Avec KVM, QEMU peut faire tourner les VMs avec de bonnes performances.


--node-ip
→ IP de ce node dans Kubernetes

--bind-address
→ adresse sur laquelle le serveur K3s écoute

--advertise-address
→ adresse que le serveur annonce aux autres nodes

1. Vagrant crée skkS
2. Vagrant crée skkSW

3. K3s Server est installé sur skkS
4. K3s génère un token

5. skkSW récupère le token
6. K3s Agent est installé sur skkSW
7. skkSW rejoint le cluster

8. kubectl get nodes
   ↓
skkS   Ready
skkSW  Ready





2:
L'utilisateur envoie une requête vers l'IP de la VM avec un Host comme app2.com. L'Ingress Controller reçoit la requête et applique les règles définies dans l'Ingress pour trouver le bon Service. Le Service utilise son selector pour trouver les pods qui ont les labels correspondants. Kubernetes maintient les adresses de ces pods dans des EndpointSlices, puis la requête est envoyée vers un des pods disponibles. Le Deployment définit combien de replicas doivent exister et Kubernetes recrée un pod si nécessaire.

Kubernetes, crée-moi un Deployment appelé app1. Je veux 1 replica. Les pods de ce Deployment doivent avoir le label app=app1. Dans chaque pod, crée un container appelé app1 basé sur l’image nginx:alpine, qui écoute sur le port 80.