# @container en CSS

## Introduction

`@container` est une fonctionnalité moderne du CSS appelée **Container Queries**. 

Elle permet d'appliquer des styles **en fonction de la taille d'un conteneur parent**, plutôt qu'en fonction de la taille de la fenêtre comme avec les **Media Queries**.

Cela permet de créer des composants **plus modulaires et réutilisables**.

## Différence entre `@media` et `@container`

### Media Queries

Les **Media Queries** appliquent des styles selon la taille de l'écran.

```css
@media (min-width: 800px) {
  .card {
    display: flex;
  }
}
```

### Container Queries

Les **Container Queries** appliquent des styles selon la taille **du conteneur parent**.

```css
@container (min-width: 400px) {
  .card {
    display: flex;
  }
}
```

Ainsi, le composant s'adapte **à son conteneur**.

# Déclarer un conteneur

Pour utiliser `@container`, il faut d'abord déclarer un conteneur.

```css
.container {
  container-type: inline-size;
}
```

### Types possibles

| Valeur        | Description                      |
| ------------- | -------------------------------- |
| `inline-size` | réagit à la largeur du conteneur |
| `size`        | réagit à largeur + hauteur       |

Exemple :

```css
.layout {
  container-type: inline-size;
}
```

# Utiliser `@container`

Ensuite on peut écrire une règle `@container`.

```css
@container (min-width: 600px) {
  .card {
    display: grid;
    grid-template-columns: 1fr 2fr;
  }
}
```

Le style sera appliqué **si le conteneur fait au moins 600px de large**.

# Container nommé

On peut donner un nom au conteneur.

```css
.layout {
  container-type: inline-size;
  container-name: card-container;
}
```

Puis l'utiliser :

```css
@container card-container (min-width: 500px) {
  .card {
    display: flex;
  }
}
```

Cela permet de cibler **un conteneur spécifique**.

## Portée des container nommé

Une règle `@container` s'applique **au conteneur ancêtre le plus proche** qui correspond aux critères.

Exemple :

```css
.layout {
  container-type: inline-size;
}
```

Puis :

```css
@container (min-width: 500px) {
  .card {
    display: flex;
  }
}
```

Le navigateur cherche **le premier parent qui est un conteneur** (`container-type`) et applique la règle selon **sa taille**.

Donc la portée est :

- **locale**
- dépend de **l'arbre DOM**
- dépend du **premier conteneur parent**

## Peut-on réutiliser un nom de conteneur ?

**Oui, totalement.**

Plusieurs éléments peuvent partager **le même `container-name`**.

Exemple :

```css
.sidebar {
  container-type: inline-size;
  container-name: layout;
}

.content {
  container-type: inline-size;
  container-name: layout;
}
```

Puis :

```css
@container layout (min-width: 500px) {
  .widget {
    display: flex;
  }
}
```

Chaque `.widget` utilisera **le conteneur `layout` le plus proche**.

Donc :

- les noms **ne sont pas uniques**
- ils peuvent être **réutilisés partout**
- le navigateur choisit **le plus proche dans le DOM**

## Plusieurs conteneurs portant le même nom

Même si plusieurs conteneurs portent le même nom :

```html
<div class="layout">
  <div class="layout"> <!-- c'est ce container qui est utilisé comme taille de référence --> 
    <div class="card"></div>
  </div>
</div>
```

La règle :

```css
.layout {
  container-type: inline-size;
}

@container layout (min-width: 600px)
```

utilisera **le conteneur `layout` le plus proche de `.card`**.

## Container à noms multiples

Un conteneur peut avoir **plusieurs noms**.

```css
.layout {
  container-type: inline-size;
  container-name: layout dashboard;
}
```

Puis :

```css
@container layout (min-width: 500px) { }
@container dashboard (min-width: 800px) { }
```

Cela permet de créer **des systèmes de layout plus complexes**.

# Exemple

## HTML

```html
<div class="layout">
  <div class="card">
    <img src="image.jpg">
    <p>Description</p>
  </div>
</div>
```

## CSS

```css
.layout {
  container-type: inline-size;
}

.card {
  display: block;
}

@container (min-width: 500px) {
  .card {
    display: flex;
    gap: 1rem;
  }
}
```

# Exemple nommé

Dans cet exemple nous utilisons un container nommé `layout` pour modifier la disposition du texte en fonction de la taille du `container`. Nous utilisons la syntaxe avec opérateurs en CSS `(width <= 500px)`.

## HTML

```html
<div class="container">
  <div class="content">
    <div class="title">
      <div class="name">{name}</div>
      <div class="location">{city}, {country}</div>
      <div class="text">{tagline}</div>
    </div>
  </div>
</div>
```

## CSS

```css
.container{
  container-type: inline-size;
  container-name: layout;
}

.content{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}

.title{
  color: var(--primary-fg);
}

.title .name{
  color: #D3573C;
}

.title .text{
  color: black;
}

.title .location{
  color: var(--primary-bg);
}

@container layout (width <= 500px) {
  .content{
    background-color: transparent;
    flex-direction: column;
  }
  .title{
    text-align: center;
  }
  .title .name{
    font-size: 2em;
    padding-top: 0.5em;
  }
  .title .text{
    font-size: 0.8em;
    padding-top: 0.3em;
  }
}

@container layout (500px < width < 800px) {
  .content{
    background-color: transparent;
    flex-direction: column;
    align-items: flex-start;
  }
  .title{
    text-align: left;
    display: flex;
    flex-direction: column;
    gap: 0.5em;
  }
  .title .name{
    font-size: 3em;
  }
  .title .location{
    font-size: 1.2em;
  }
  .title .text{
    font-size: 0.8em;
  }
}

@container layout (width >= 800px) {
  .content{
    background-color: #FAFAFA;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    direction: rtl;
    place-items: center;
  }
  .title{
    text-align: left;
    display: flex;
    flex-direction: column;
    gap: 0.5em;
  }
  .title .name{
    font-size: 3em;
  }
  .title .location{
    font-size: 1.2em;
  }
  .title .text{
    font-size: 0.8em;
  }
}
```

