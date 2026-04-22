# Arborescence Linux

Sous Linux, tous les fichiers et répertoires sont organisés dans une **arborescence unique** qui commence à la racine `/`.

Contrairement à certains systèmes qui utilisent des lettres de lecteurs (comme `C:` ou `D:`), Linux utilise **un seul arbre de fichiers** dans lequel tous les disques et périphériques sont montés.

```
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

Chaque dossier a un rôle spécifique défini par le **Filesystem Hierarchy Standard (FHS)**.

# La racine `/`

`/` est la **racine du système de fichiers**.

Tous les autres répertoires se trouvent à l'intérieur.

# `/bin` (Binaires)

Contient des **commandes essentielles** accessibles à tous les utilisateurs.

Exemple :

```
/bin/ls
/bin/cp
/bin/mv
/bin/bash
```

Ces commandes sont nécessaires pour que le système puisse fonctionner même en mode minimal.

# `/boot` (Démarrage)

Contient les fichiers nécessaires au **démarrage du système**.

Exemples :

```
/boot/vmlinuz
/boot/initrd
/boot/grub
```

On y trouve notamment le noyau Linux et le chargeur de démarrage.

# `/dev` (Devices)

Contient les **fichiers représentant les périphériques matériels**.

Sous Linux, les périphériques sont représentés comme des fichiers.

Exemples :

```
/dev/sda
/dev/sda1
/dev/null
/dev/tty
```

- `sda` : disque dur
- `sda1` : première partition

# `/etc` (Configurations)

Contient les fichiers de configuration du système:

- les fichiers de configuration du système
- les configurations des services et des logiciels installés
- certains fichiers décrivant les utilisateurs et le réseau

Ces fichiers sont généralement **des fichiers texte lisibles et modifiables par un administrateur**.

Exemples :

```
/etc/passwd
/etc/hostname
/etc/ssh/sshd_config
/etc/network
```

Ce dossier est essentiel pour l'administration du système.

# `/home` (Utilisateurs)

Contient les **répertoires personnels des utilisateurs**.

Exemple :

```
/home/alice
/home/bob
```

Chaque utilisateur y stocke ses fichiers.

# `/lib` et `/lib64` (Librairies)

Contiennent les **bibliothèques nécessaires aux programmes système**.

Ce sont l'équivalent des DLL sous Windows.

Exemples :

```
/lib/libc.so
/lib64/libm.so
```

# `/media` (Périphériques amovibles)

Point de montage pour les **périphériques amovibles**.

Exemples :

```
/media/usb
/media/cdrom
```

Lorsqu'une clé USB est branchée, elle peut apparaître ici.

# `/mnt` (Systèmes de fichiers)

Répertoire utilisé pour **monter temporairement des systèmes de fichiers**.

Exemple :

```
/mnt/disque_test
```

Souvent utilisé par les administrateurs.

# `/opt` (Applications tierces)

Contient des **applications installées manuellement ou tierces**.

Exemples :

```
/opt/google
/opt/vscode
```

# `/proc` (Processus)

Système de fichiers **virtuel** qui expose des informations sur le système et les processus.

Il ne contient pas de vrais fichiers sur le disque.  
Il est généré en temps réel par le **noyau Linux**.

Son objectif principal est de fournir une **interface pour accéder aux informations internes du système et des processus**.

Exemples :

```
/proc/cpuinfo
/proc/meminfo
/proc/1234
```

Les fichiers sont générés dynamiquement par le noyau.

Avec le temps, il a évolué pour contenir aussi des informations sur :

\- le matériel
\- la mémoire
\- la configuration du noyau
\- l'état du système

# `/root` (Administrateur)

Répertoire personnel de l'utilisateur **root** (administrateur).

```
/root
```

Il ne faut pas le confondre avec `/`.

---

# `/run` (Execution système)

Contient des **données temporaires sur le système en cours d'exécution**.

Exemples :

```
/run/systemd
/run/user
```

Les données disparaissent après redémarrage.

Il ne stocke pas de données permanentes, mais uniquement des informations utiles **tant que le système tourne**.

Le dossier `/run` sert à stocker :

\- les PID des processus
\- les sockets de communication
\- les fichiers temporaires de services système
\- les informations d’état du système

---

# `/sbin` (Binaires systèmes)

Contient des **commandes système réservées à l'administration**.

Le contenu de `/sbin` sert à :

\- gérer le système
\- réparer le système
\- configurer le réseau bas niveau
\- administrer les disques et partitions
\- démarrer ou arrêter des services critiques

Exemples :

```
/sbin/reboot
/sbin/fsck
/sbin/ip
```

---

# `/srv` (Services)

Contient les **données des services fournis par le serveur**.

Le dossier `/srv` (pour **service**) contient les **données utilisées par les services fournis par la machine**.

Contrairement à `/var` qui contient des données variables générales, `/srv` est destiné à stocker les **données “servies” aux utilisateurs ou à d’autres machines**.

Exemples :

```
/srv/www
/srv/ftp
```

Le dossier `/srv` sert à stocker les données de :

\- serveurs web
\- serveurs FTP
\- serveurs de fichiers
\- services réseau
\- applications exposées à l’extérieur

# `/sys` (Système)

Système de fichiers virtuel exposant des informations sur le **matériel et le noyau**.

Exemple :

```
/sys/class
/sys/devices
```

---

# `/tmp` (Temporaire)

Contient des **fichiers temporaires**.

Les fichiers peuvent être supprimés automatiquement.

```
/tmp
```

---

# `/usr` (Unix System Resources)

Contient la majorité des **programmes et bibliothèques installés**.

Le dossier `/usr` sert à stocker :

\- les applications installées
\- les bibliothèques partagées
\- la documentation système
\- les fichiers de support des programmes

Structure interne :

```
/usr
├── bin
├── lib
├── local
└── share
```

Exemples :

```
/usr/bin/node
/usr/bin/python
/usr/share/doc
```

---

# `/usr/local`

Utilisé pour les **programmes installés manuellement par l'administrateur**.

Exemples :

```
/usr/local/bin
/usr/local/lib
```

---

# `/var` (Données variables)

Contient des **données variables qui changent pendant l'exécution du système**.

L’idée est simple :

\- les données ne sont pas fixes
\- elles évoluent en permanence
\- elles dépendent de l’activité du système

Le dossier `/var` sert à stocker :

\- les logs système
\- les caches
\- les files d’attente (queues)
\- les bases de données d’applications
\- les fichiers temporaires persistants
\- les données de services

Exemples :

```
/var/log
/var/cache
/var/lib
```

Exemple courant :

```
/var/log/syslog
```

---

# Exemple de chemin complet

```
/home/thomas/projets/app.js
```

Signification :

- `/` : racine
- `home` : dossiers utilisateurs
- `thomas` : utilisateur
- `projets` : dossier personnel
- `app.js` : fichier

---

# Résumé

Structure simplifiée :

```
/
├── systeme
│ ├── bin
│ ├── sbin
│ ├── lib
│ └── etc
│
├── utilisateurs
│ └── home
│
├── programmes
│ └── usr
│
├── services et logs
│ └── var
│
└── systemes virtuels
├── proc
└── sys
```

L'arborescence Linux est conçue pour séparer clairement :

- les programmes
- la configuration
- les données utilisateurs
- les données système