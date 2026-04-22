# Interdire l'utilisation d'une clé USB
Cette technique permet d'empêcher l'utilisation de toutes clé de stockage USB sur votre ordinateur.

## Testé avec

* Windows XP
* Windows 7

## Prérequis
Etre connecté sur une session avec les droits d'administration.

## Procédure

- Ouvrir le registre Windows (Windows XP/7):
- Appuyer sur les touches **Windows+R** du clavier, une fenêtre d'exécution s'ouvre
- Ecrire **regedit** puis appuyer sur la touche **Entrée** 
- Déplier l'arborescence de gauche pour attendre la clé suivante **HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\USBSTOR**
- Définir la valeur de l'entrée **Start** à **4** (Désactivé)
- Fermer le registre

## Résultat
Maintenant votre ordinateur ne détectera plus les périphériques de stockages de masses tel que les clés USB et disques dur portables. Les autres périphériques USB inoffensifs tel que le clavier et la souris restent utilisable sur l'ordinateur.

Pratique pour améliorer la sécurité de l'ordinateur contre les programmes intrusifs !



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)