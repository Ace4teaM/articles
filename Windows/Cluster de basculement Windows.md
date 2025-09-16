# Cluster de basculement Windows
Windows Server dispose de fonctionnalités de "haute disponibilité" permettant une continuité du service même en cas de panne ou disfonctionnement de Windows.

Par quel miracle cela est-il possible ? Tous simplement en utilisant plusieurs installations de Windows. Mais contrairement à 2 serveurs indépendants, du point de vue du client il n'existe qu'une seule machine.

## Fonctionnement d'un cluster

### Prérequis

Vous disposez de:

* 2 Serveurs de production
* 1 Serveur Active Directory (optionnel)

## Installation avec serveur Active Directory

Sur le serveur Active Directory:

1. Installer le rôle "Service AD DS"
2. Promouvoir le serveur en contrôleur de domaine (Gestionnaire de serveur)
3. Définir un domaine (ex: wsad.local) avec des utilisateurs (ex: toto). Les utilisateurs seront ensuite utiliser pour vous connecter sur les serveurs de production
2. Définir une adresse IP Fixe (ex: 10.0.0.1)
3. Définir l'adresse du serveur DNS sur lui-même

Sur les serveurs de production:

1. Définir un nom de serveur
2. Définir l'adresse du serveur DNS sur le serveur AD (ex: 10.0.0.1)
3. Rejoindre le domaine AD (ex: wsad.local)
4. Redémarrer l'ordinateur
5. Utiliser un compte AD pour se connecter (ex: wsad\toto)
6. Installer le rôle "Clustering avec basculement"

## Installation sans un serveur Active Directory

...



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)
