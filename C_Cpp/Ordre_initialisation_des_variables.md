# Ordre d'initialisation des variables en C et C++

## Introduction
Le langage C++ de part sa nature implique la déclaration de variables et implicitement leurs initialisations.

Dans le cas de variables globales (ou statiques dans le cas d'un objet), il peut se produire des effets indésirables ou inattendus dans l'ordre d'initialisation.

## Cas du vecteur global réinitialisé
Ce cas apparait généralement si vous utilisez un conteneur standard (`vector`, `map`, ...) ou tout autre classe avant sa construction.

En effet supposons que vous avez 2 objets statiques X et Y définit dans des fichiers de compilation distincts. Supposons que l'initialisation de X intervient avant Y et que malheureusement X dans son constructeur appel une fonction de Y.

Alors vous vous retrouver dans un cas ou Y est utilisé avant son initialisation !

En fonction de la compilation vous avez 50% de chances que cela se produise et cela avant même d'entrer dans le main().

Pour tester et résoudre ce problème,  voir l'exemple de programme joint ou faites une recherche sur internet "C++ Static Initialization Order Fiasco"

## Priorité d'initialisation

Vous avez la possibilité de définir l'ordre d'initialisation des variables en spécifiant l'attribut `__attribute__` (GNU) ou le pragma `init_seg` (MSVC).

```c++
// static init variables
// assure l'ordre d'initialisation des variables globales
// cette attribut est particulièrement important pour éviter une erreur d'execution
// par exemple, pour éviter que les instances de Basic::Constant utilisent DataHeap::c_const avant sont initialisation !
#if defined(_MSC_VER)
// à définit dans le fichier source: #pragma init_seg({ compiler | lib | user | "section-name" [, func-name]} )
//#pragma warning(disable : 4073)
//#pragma init_seg(lib)
#define _INIT_LIB_ 
#elif defined(__GNUC__)
// GCC: la priorité est définit par un entier de 101 à 65535. Un nombre bas indique une priorité élevée
#define _INIT_LIB_ __attribute__((init_priority(200)))
#else
#error Place your priority initialization rule for your compiler here !
#endif
```



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)









