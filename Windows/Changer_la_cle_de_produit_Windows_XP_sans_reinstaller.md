# Changer la clé de produit de Windows XP sans réinstaller
Cette astuce permet de changer le numéro de licence (Product Key, clé de produit) sans réinstaller Windows XP.

## Testé avec
Windows XP

## Prérequis
Etre connecté sur une session avec les droits d'administration.

## Procédure

Effectuez les étapes suivantes :

1. Désactiver Windows XP :

Ouvrez l’éditeur de la base de registre (Menu **Démarrer** puis **Exécuter** – tapez la commande « regedit ») et parcourez pour atteindre :

	HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\WPAEvents

Modifiez la clé **oobetimer** (peu importe la modification apportée sur cette valeur, elle doit être différente de la valeur d’origine de la clé pour que l’étape suivante de l’astuce fonctionne).

2. Modifier le numéro de licence :

Allez sur le menu **Démarrer** puis **Exécuter** et tapez la commande :

	%systemroot%\system32\oobe\msoobe.exe /a

La fenêtre d’activation de Windows doit alors apparaître.
Choisissez Activation par téléphone puis sur Modifier la clé de produit.

Entrez maintenant votre nouveau numéro de licence.
Cliquez sur Mettre à jour, choisissez enregistrer puis activer sans enregistrer windows.

3. Redémarrez votre PC.

## Résultat
Vous avez changé le numéro de licence (clé de produit) sans réinstaller Windows.



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)
