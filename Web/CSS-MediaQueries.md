# Media Queries en CSS

## Introduction

Les **Media Queries** permettent d'appliquer des styles CSS **en fonction des caractéristiques de l'appareil ou de la fenêtre du navigateur**.

Elles sont au cœur du **Responsive Design**, c'est-à-dire la capacité d'un site web à s'adapter aux différentes tailles d'écran :

- téléphone
- tablette
- ordinateur
- grand écran

Grâce aux Media Queries, un même site peut modifier son **layout, sa taille de texte, ou l'affichage de ses éléments** selon la taille de l'écran.

# Syntaxe de base

Une Media Query utilise la règle `@media`.

```css
@media (condition) {
  /* styles appliqués si la condition est vraie */
}
```

Exemple :

```css
@media (max-width: 768px) {
  body {
    background: lightgray;
  }
}
```

Le style est appliqué **si la largeur de l'écran est inférieure ou égale à 768px**.

# Principales conditions

Les Media Queries utilisent différentes **caractéristiques du viewport**.

## Largeur

### `min-width`

Applique un style **à partir d'une largeur minimum**.

```css
@media (min-width: 768px) {
  .container {
    width: 700px;
  }
}
```

utilisé pour les écrans plus grands.

------

### `max-width`

Applique un style **jusqu'à une largeur maximum**.

```css
@media (max-width: 768px) {
  .menu {
    display: none;
  }
}
```

utilisé pour les écrans plus petits.

# Exemple classique de Responsive Design

```css
.container {
  width: 100%;
}

@media (min-width: 768px) {
  .container {
    width: 720px;
  }
}

@media (min-width: 1024px) {
  .container {
    width: 960px;
  }
}
```

Cela crée plusieurs **breakpoints**.

# Breakpoints courants

Les breakpoints sont des tailles d'écran utilisées pour adapter le design.

| appareil | largeur  |
| -------- | -------- |
| mobile   | < 768px  |
| tablette | ≥ 768px  |
| laptop   | ≥ 1024px |
| desktop  | ≥ 1280px |

Exemple :

```css
@media (min-width: 1280px) {
  .layout {
    max-width: 1200px;
  }
}
```

# Media Queries multiples

On peut combiner plusieurs conditions.

```css
@media (min-width: 768px) and (max-width: 1024px) {
  .sidebar {
    display: none;
  }
}
```

Le style s'applique **uniquement entre 768px et 1024px**.

------

# Types de média

Les Media Queries peuvent aussi cibler le **type de périphérique**.

| type     | description     |
| -------- | --------------- |
| `screen` | écrans          |
| `print`  | impression      |
| `all`    | tous les médias |

Exemple :

```css
@media print {
  body {
    background: white;
  }
}
```

style utilisé **lors de l'impression**

------

# Exemple complet

## HTML

```html
<div class="card">
  <img src="photo.jpg">
  <p>Description</p>
</div>
```

------

## CSS

```css
.card {
  display: block;
}

@media (min-width: 768px) {
  .card {
    display: flex;
    gap: 1rem;
  }
}
```

Résultat :

- mobile → carte verticale
- desktop → carte horizontale