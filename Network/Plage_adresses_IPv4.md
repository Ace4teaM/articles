# Calculer les plages d'adresses en IPv4

**Tags** : `#NETWORK` `#IP`

**Prérequis** : Réseau, Système Binaire 

**Articles Connexes** : 

## La méthode

Par simplicité nous avons l'habitude de représenter les adresses IP (version 4) sous forme d'un quadruple de valeur décimale : `AAA.BBB.CCC.DDD`.

> `192.168.10.2` est la représentation décimale des 4 octets d'une adresse IP sur 32bits.

*Pour rappel 1 octet = 8 bits.*

Une adresse IP est composée de 2 parties : **le numéro de réseau** et **le numéro de l'hôte**. Pour déterminer quelle est la partie **réseau** dans une adresse nous indiquons le **nombre de bits** que compose ce dernier dans l'adresse.

> `192.168.10.2/24` notation CIDR (**adresse / longueur du masque**).

Donc, dans notre adresse la partie réseau représente les 3 premiers octets (24 bits) et la partie hôte le dernier octet (8 bits).

![](.\Plage d'adresses IPv4\ip_24_8.png)

Avec la longueur du masque nous pouvons calculer le nombre maximal d'hôtes et de réseaux possibles.

> Maximum d'hôtes = ( 2 ^ 8bits ) -1 = 255 hôtes
>
> Maximum de réseaux = ( 2 ^ 24bits ) -1 = 16 777 215 réseaux

Lorsque le masque du réseau est un multiple de 8 il est facile de se représenter la valeur décimale et de déterminer les numéros d'hôtes par incrémentation.

> Pour `192.168.10.2/24` la plage d'adresses est `192.168.10.0` à `192.168.10.254` (255 adresses)

```
192.168.10.0
192.168.10.1
...
192.168.10.253
192.168.10.254
```

Mais lorsque le masque n'est pas un multiple de 8

![](.\Plage d'adresses IPv4\ip_10_22.png)

Comment calcule t'on les adresses disponibles en représentation décimale ?

> la plage d'adresses `192.168.10.2/10` est plus difficile à se représenter mentalement

Pour cela nous devons reprendre la représentation binaire ...

| 192      | 168      | 10       | 2        |
| -------- | -------- | -------- | -------- |
| 11000000 | 10101000 | 00001010 | 00000010 |

Remplacer les 22 bits de la partie Hôte par des zéros

| 192      | 128      | 0        | 0        |
| -------- | -------- | -------- | -------- |
| 11000000 | 10000000 | 00000000 | 00000000 |

> Première adresse = `192.128.0.0`

Nous savons également qu'il nous reste `(32 - 10 bits) = 22 bits` pour la partie hôtes

Ce qui nous donne :

> Maximum d'hôtes = ( 2 ^ 22bits ) -1 = 4 194 303 hôtes

Pour calculer les adresses suivantes nous allons utiliser la représentation binaire :

```
Adresse # 0         = ........ ..000000 00000000 00000000
Adresse # 1         = ........ ..000000 00000000 00000001
Adresse # 2         = ........ ..000000 00000000 00000010
Adresse # 3         = ........ ..000000 00000000 00000011
Adresse # 4         = ........ ..000000 00000000 00000100
Adresse # 5         = ........ ..000000 00000000 00000101
Adresse # 6         = ........ ..000000 00000000 00000111
...
Adresse # 4 194 302 = ........ ..111111 11111111 11111110
Adresse # 4 194 303 = ........ ..111111 11111111 11111111
```

Et les ajouter à la partie réseau:

```
Adresse # 0         = 11000000 10000000 00000000 00000000
Adresse # 1         = 11000000 10000000 00000000 00000001
Adresse # 2         = 11000000 10000000 00000000 00000010
Adresse # 3         = 11000000 10000000 00000000 00000011
Adresse # 4         = 11000000 10000000 00000000 00000100
Adresse # 5         = 11000000 10000000 00000000 00000101
Adresse # 6         = 11000000 10000000 00000000 00000111
...
Adresse # 4 194 302 = 11000000 10111111 11111111 11111110
Adresse # 4 194 303 = 11000000 10111111 11111111 11111111
```

Ce qui donne en décimale

```
Adresse # 0         = 192.128.0.0
Adresse # 1         = 192.128.0.1
Adresse # 2         = 192.128.0.2
Adresse # 3         = 192.128.0.3
Adresse # 4         = 192.128.0.4
Adresse # 5         = 192.128.0.5
Adresse # 6         = 192.128.0.6
...
Adresse # 4 194 302 = 192.191.255.254
Adresse # 4 194 303 = 192.191.255.255
```



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)
