# Les limites de la portabilité des données en C et C++

## Introduction
On peut dire que le langage C, est une version « portable » de l’assembleur. Il se trouve 1 niveau au-dessus et il est entièrement calqué sur le mode de fonctionnement du processeur :

* Les types de bases représentent les registres
* Les opérations représentent les d’instructions
* Les fonctions représentent la pile d'instructions

Le C est un fabuleux langage de programmation, présent depuis de nombreuses années. Le C permet à la fois de créer du code réutilisable mais également d’accéder aux spécificités d'une machine.

Cependant comme chaque langage de programmation qui permet un contrôle natif des composants, il se limite dans sa portabilité.

## Les formats de données natifs en C
Les principaux types de données manipulables par le langage C sont : short, int, long, double et float.

Lorsqu’on les manipules sur différents systèmes, on peut observer plusieurs divergences au niveau de leurs stockages en mémoire :

* La taille des registres : un mot court (short), un mot (int) et un double mot (long) n’utilisent pas le même nombre d’octets suivant l’architecture du processeur : 8-bits, 16-bits, 32-bits, 64-bits, etc…

* Le format des données : **float** et **double** sont dépendent de l’implémentation matérielle, tento IEEE-754, tento IEEE-854. Hors de question de "copier" la mémoire d'une variable d'une machine à une autre sans "conversion" des données. 

* L’endianness : l’ordre de stockage des octets peut différer.

	Par exemple, pour les types **short**, **int** et **long** qui ont un format de données identique (stockage linéaire des bits), une même valeur de 1 aura un ordre de lecture des octets différent « l’endianness »:

	Le nombre décimal « 1 » sur 32-bits en little-endian s’écrira « 0x00000001 »

	Le nombre décimal « 1 » sur 32-bits en big-endian  s’écrira « 0x01000000 »

* L’accès : Plus rare, certaine machines ne permettent pas un accès à la mémoire centrale avec tous les types de données. Le cas vu : sur une machine GameBoyAdvance, ou le transfert de données vers l’écran (mappé directement sur la mémoire) n’est disponible qu’à partir des registres 16-bits du processeur.  

Le seul type qui n’est pas concerné par des spécificités de portabilité mémoires est le type char qui représente un unique octet (8bits). 

Les bits d’un octet étant uniquement accessible par le biais des instructions machines dans un ordre donné, l’octet il est un standard de portabilité pour tous les microprocesseurs.

## Conclusion
Le C est donc un langage portable dans sa syntaxe, mais pas dans ses données.
Il reste le langage de programmation préféré pour manipuler le matériel et la mémoire.
Pour utiliser un langage totalement portable il aurait fallu utiliser un langage de « très haut niveau », le **C#**, le **Basic**, le **PHP** et le **Java**, par exemple, chacun est plus ou moins optimisé pour une situation.

Plus vous montez dans les langages de haut-niveaux et plus…

- votre code est portable.
- la syntaxe est facile de compréhension et naturel à écrire.

En revanche plus vous descendez dans les niveaux, moins vous avez de…

- de contrôle sur le matériel.
- de performances brutes.

- 

--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)
