# Rappels

## CSS

### Priorité de l'application des styles

Si vous avez répondu Carapuce, c’est la bonne réponse. Mais pourquoi ?

- Code inline ( `<div style="...">` )
- Id ( `#id` )
- Class  ( `.classe` )
- Élément  ( `div` )

**Autres cas (les combinaisons)**

`#id.maclasse`

Comment procède le navigateur dans ce cas-là ? **Il cumule les points**.  L’id est toujours vainqueur, seulement ici vous avez déclaré un *id ET une classe* pour le MÊME élément. Dans ce cas-là, c’est `#id.maclasse` qui l’emporte.

### Convention de nommage BEM

Nous pouvons améliorer la compréhension du code en appliquant une convention de nommage BEM (**Bloc/Element/Modificator**).

Cette convention permet d'identifier la hiérarchie des éléments et les modificateurs appliqué à la structure HTML correspondante.

**Pour les blocs** 

```css
.navbar {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}
```

**Pour les éléments** 

```css
.navbar__link {
  margin-left: 30px;
  color: #242424;
  text-decoration: none;
}
```

**Pour les modificateurs** 

```css
.navbar__link--purple {
  color: #a5b4fc;
}
```

**HTML**

```html
<nav class="navbar">
      <a class="navbar__link" href="index.html">Accueil</a>
      <a class="navbar__link" href="a-propos.html">À propos</a>
      <a class="navbar__link navbar__link--purple" href="portfolio.html">Portfolio</a>
</nav>
```

### Exemple de bouton générique et dérivé

Ici nous évitons les répétitions en spécifiant un bouton de base

```css
/* Un bouton classique. */
.btn {
      width: 200px;
      padding: 15px;
      border: none;
      background: #48D1CC;
      color: #242424;
}
```

et plusieurs boutons dérivés

```css
/* Un bouton classique mais avec des angles ronds. */
.btn-round {
  border-radius: 30px;
}

/* Un bouton classique mais plus large. */
.btn-wide {
  width: 400px;
}

/* Un bouton classique mais avec une couleur de fond orange. */
.btn-orange {
  background-color: #e67e22;
}
```

voici le résultat en CSS standard

```html
<button class="btn btn-round">Bouton</button>
```

### Déclenchez vos transitions CSS

Même s’il en existe d’autres, voici une liste des pseudoclasses les plus couramment utilisées pour déclencher des transitions :

- `:hover`, qui est déclenché au **survol** de la souris ;
- `:active`, activé au **clic** de l'utilisateur (le plus souvent pour les liens et boutons) ;
- `:focus`, qui se déclenche lorsque son élément reçoit le **focus** (soit il est sélectionné à l'aide du clavier, soit il est activé avec la souris) ;
- `:valid`, dont la [validation](https://developer.mozilla.org/fr/docs/Web/CSS/:valid) du contenu s'effectue correctement par rapport au type de donnée attendu ;
- `:invalid`, qui inversement, correspond à un élément dont la [validation](https://developer.mozilla.org/fr/docs/Web/CSS/:invalid) du contenu ne s'effectue pas correctement par rapport au type de donnée attendu ;
- `:not()`, qui correspond à la **négation**. Elle prend un sélecteur en argument et permet de cibler les éléments qui ne sont pas représentés par cet argument ;
- `:checked`, qui correspond aux **input** de type checkbox, option ou radio qui sont cochés ;
- `:enabled`, un élément avec lequel on peut **interagir ;**
- `:disabled`, qui correspond à un élément dont l'interaction a été **bloquée**.

