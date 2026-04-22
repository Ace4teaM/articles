## Sass

Sass a créé un nouveau langage à partir du CSS : le **SCSS**. Tout ce qui est valide en CSS l'est aussi en SCSS, mais il y ajoute des expressions, des fonctions, des variables, une logique conditionnelle  et des boucles. Il utilise ensuite un préprocesseur (un programme qui  fonctionne sur votre ordinateur ou sur un serveur) chargé de traduire  cette nouvelle syntaxe intelligente en CSS.

**Sass** n'est pas reconnu par les navigateurs il appui sur un préprocesseur pouvant le convertir en CSS.

Voici quelques guide des fonctionalités:

* Bases : https://sass-lang.com/guide/
* Opérateurs : https://sass-lang.com/documentation/operators/
* Modules : https://sass-lang.com/documentation/modules/
* Extensions : https://sass-lang.com/documentation/at-rules/extend/



Le SASS est toujours directement reconvertible en CSS, vous pouvez utiliser des outils en ligne si votre Framework ne s'en charge pas déjà:

https://jsonformatter.org/scss-to-css



### Imbriquer des blocs (nesting)

L'une des fonctionnalité est de reprendre la convention BEM mais de l'appliquer directement à la syntaxe

**CSS**

```css
.nav {
  text-align: right;
}
.nav .nav__link {
  font-size: 15px;
  padding-left: 30px;
}
.nav .nav__link .nav__link--purple {
  color: #a5b4fc;
}
```

**SASS**

```css
.nav {
    text-align: right;
    .nav__link {
      font-size: 15px;
      padding-left: 30px;
      .nav__link--purple {
          color: #a5b4fc;
      }
    }
}
```

Concatainer des blocs (Modificateur)

**CSS**

```css
.block {
    background-color: #FFFFF;
}
.block__element {
    background-color: #15dea5;
}
```

**SASS**

```css
.block {
    background-color: #FFFFF;
    &__element {
        background-color: #15dea5;
  }
}
```



### Variables

Évite de répéter les mêmes valeurs.

```css
$primary-color: #3498db;

button {
  background: $primary-color;
}
```

### Mixins (blocs réutilisables)

Pour réutiliser des ensembles de règles.

```css
@mixin center {
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  @include center;
}
```

------

### Fonctions & calculs

Tu peux faire des opérations.

https://sass-lang.com/documentation/modules/color/

```css
$primary-color: #0000FF;
$secondary-color: #00FF00;

/* ici les shadows sont logiquement plus sombre que leurs bases, c'est la fonction darker() qui réalise cette opération */
$primary-shadow: darker($primary-color, 50%); 
$secondary-shadow: darker($secondary-color, 50%);
```

------

### Héritage (extend)

```css
.button {
  padding: 10px;
  border-radius: 5px;
}

.primary-button {
  @extend .button;
  background: blue;
}
```

------

### Partials & imports

Découper le style en fichiers.

```css
@use "colors";
@use "layout";
```

### Etendre les media-query avec le nesting

Ce n'est pas grand chose mais ca rend le code plus clair

**CSS**

```css
.intro {
   display: flex;
   flex-direction: row;
   align-items: flex-start;
}

@media (max-width: 996px) {
 .intro {
    flex-direction: column;
    align-items: center;
    justify-content: center;
 }
}
```

**SASS**

```css
.intro {
    display: flex;
    flex-direction: row;
    align-items: flex-start;

    @media (max-width: 996px) {
        flex-direction: column;
        align-items: center;
    }
}
```

# 