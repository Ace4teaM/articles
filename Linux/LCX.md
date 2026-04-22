

# LXC sur Linux

## Définition

LXC signifie **Linux Containers**.

LXC est une technologie de virtualisation légère disponible sur Linux, elle permet de créer des environnements isolés appelés conteneurs.

Un conteneur LXC :

- possède son propre système de fichiers
- a ses propres processus
- peut avoir son propre réseau
- peut exécuter une distribution Linux différente

Tous les conteneurs partagent cependant le même noyau Linux.

LXC est donc plus léger qu’une machine virtuelle classique.

## Principe de fonctionnement

LXC repose sur plusieurs mécanismes du noyau Linux.

### Namespaces

Les namespaces permettent d’isoler :

- les processus
- le réseau
- les utilisateurs
- les points de montage
- les identifiants système

Chaque conteneur voit donc un environnement indépendant.

### Cgroups

Les cgroups (Control Groups) permettent de limiter et contrôler :

- l’utilisation du CPU
- la mémoire
- les entrées/sorties disque

On peut par exemple attribuer 1 cœur CPU à un conteneur et 2 à un autre.

## Architecture

Une machine utilisant LXC fonctionne ainsi :

Machine physique  

→ Noyau Linux  

→ Plusieurs conteneurs

Chaque conteneur contient un système Linux complet (Ubuntu, Debian, Alpine, etc.), mais tous utilisent le même noyau hôte.

## Installation

Sur Debian ou Ubuntu :

```bash
sudo apt install lxc
```

Vérifier la configuration :

```
lxc-checkconfig
```

## Création d’un conteneur

Créer un conteneur Ubuntu :

```
lxc-create -n monconteneur -t ubuntu
```

## Démarrer un conteneur

```
lxc-start -n monconteneur
```

Mode interactif :

```
lxc-start -n monconteneur -F
```

## Accéder au conteneur

```
lxc-attach -n monconteneur
```

Vous êtes alors connecté au conteneur comme sur une machine Linux indépendante.

## Arrêter un conteneur

```
lxc-stop -n monconteneur
```

## LXC vs Machine Virtuelle

Machine virtuelle :

- virtualise le matériel
- nécessite un hyperviseur
- possède son propre noyau
- consomme plus de ressources

LXC :

- virtualise le système d’exploitation
- partage le noyau Linux
- démarre très rapidement
- consomme peu de mémoire

## LXC vs Docker

LXC :

- conteneur proche d’un mini serveur Linux
- peut exécuter un système complet avec systemd
- adapté à l’isolation de services complets

Docker :

- orienté application
- souvent un seul processus principal
- très portable

## LXC et LXD

LXD est un gestionnaire moderne pour LXC.

Il ajoute :

- une API REST
- la gestion des snapshots
- la gestion réseau avancée
- le clustering
- une gestion simplifiée

LXD rend l’utilisation de LXC plus simple et plus automatisable.

## Cas d’utilisation

LXC est souvent utilisé pour :

- virtualisation légère sur serveur
- homelab
- cloud privé
- hébergement de services isolés
- environnements de test

Des plateformes comme Proxmox utilisent LXC pour leurs conteneurs.

## Résumé

VM : virtualisation du matériel
LXC : virtualisation du système d’exploitation
Docker : isolation d’applications

LXC constitue un bon compromis entre performance, isolation et légèreté.