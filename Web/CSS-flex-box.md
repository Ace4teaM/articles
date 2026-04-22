## Flex Box

https://flexboxfroggy.com/#fr

----------------------------

**justify-content**

La propriété **`justify-content`** sert à **aligner les éléments flex sur l’axe principal** (horizontal par défaut).

Elle contrôle la **répartition** et les **espaces** entre les éléments à l’intérieur d’un conteneur `display: flex`.

```css
.container {
  display: flex;
  justify-content: space-between;
}
```

### `flex-start` (valeur par défaut)

Les éléments sont alignés au **début** du conteneur.

### `flex-end`

Alignés à la **fin** du conteneur.

### `center`

Éléments **centrés** sur l’axe principal.

### `space-between`

Le premier élément est collé au début, le dernier à la fin, et l’espace entre les éléments est **réparti uniformément**.

### `space-around`

Chaque élément a de l’espace **autour de lui** (espaces externes = moitié des espaces internes).

### `space-evenly`

Tous les espaces sont **strictement égaux**, entre les éléments et sur les bords du conteneur.

-------------------

**align-items**

La propriété **`align-items`** sert à **aligner les éléments sur l’axe secondaire** (vertical par défaut lorsque `flex-direction: row`).

Elle contrôle l’alignement **perpendiculaire** à l’axe principal.

```css
.container {
  display: flex;
  align-items: center;
}
```

----------------------

### `stretch` (valeur par défaut)

Les éléments s’étirent pour remplir toute la hauteur du conteneur (ou largeur si `flex-direction: column`).

### `flex-start`

Alignement **au début de l’axe secondaire** (en haut dans une ligne).

### `flex-end`

Alignement **à la fin de l’axe secondaire** (en bas).

### `center`

Éléments **centrés verticalement** (ou horizontalement si en colonne).

### `baseline`

Les éléments sont alignés sur **la ligne de base du texte**.

-------------------------

**flex-direction**

La propriété **`flex-direction`** détermine **l’orientation de l’axe principal** d’un conteneur Flexbox, c’est-à-dire **dans quel sens les éléments sont placés**.

Elle définit si les éléments doivent être alignés **horizontalement ou verticalement**, et dans quel ordre.

```css
.container {
  display: flex;
  flex-direction: column;
}
```

### `row` (valeur par défaut)

Les éléments sont placés **horizontalement**, de **gauche à droite**.

### `row-reverse`

Pareil que `row` mais **dans l’autre sens** : de **droite à gauche**.

### `column`

Les éléments sont placés **verticalement**, de **haut en bas**.

### `column-reverse`

Comme `column` mais **de bas en haut**.

----------

**order**

La propriété **`order`** permet de **changer l’ordre d’affichage des éléments** à l’intérieur d’un conteneur Flexbox **sans modifier le HTML**.

Par défaut, tous les éléments ont `order: 0`.
Les éléments sont affichés **du plus petit order → au plus grand**.

```html
<div class="container">
  <div class="item a">A</div>
  <div class="item b">B</div>
  <div class="item c">C</div>
</div>
```

```css
.item.a { order: 2; }
.item.b { order: 1; }
.item.c { order: 3; }
````

Résultat visuel : **B → A → C**

Même si dans le HTML, l’ordre est A, B, C.

------------------------

**align-self**

La propriété **`align-self`** permet de **modifier l’alignement d’un seul élément flex**, indépendamment des autres, **sur l’axe secondaire** (vertical par défaut).

Elle **écrase la valeur de `align-items`** appliquée au conteneur.

```css
.container {
  display: flex;
  align-items: center; /* alignement général */
}

.item.special {
  align-self: flex-end; /* cet élément seul va en bas */
}
```

### `auto` (valeur par défaut)

L’élément hérite du comportement de `align-items`.

### `flex-start`

L’élément est aligné **au début de l’axe secondaire** (en haut).

### `flex-end`

L’élément est aligné **à la fin de l’axe secondaire** (en bas).

### `center`

L’élément est **centré verticalement**.

### `baseline`

Aligné sur **la ligne de base du texte**.

### `stretch`

L’élément s’étire pour remplir l’espace disponible (si hauteur non fixée).

----------------------------

**align-content**

La propriété **`align-content`** sert à **aligner les lignes** d’un conteneur flex **sur l’axe secondaire** (vertical par défaut), **mais uniquement si plusieurs lignes existent** — c’est-à-dire si **`flex-wrap` est activé** et que les éléments passent sur plusieurs rangées.

👉 **Si le flexbox n’a qu’une seule ligne, `align-content` ne fait rien.**

```css
.container {
  display: flex;
  flex-wrap: wrap;
  align-content: space-between;
}
```

### `stretch` (valeur par défaut)

Les lignes s’étirent pour occuper tout l’espace disponible.

### `flex-start`

Toutes les lignes sont regroupées **en haut** (début de l’axe secondaire).

### `flex-end`

Toutes les lignes sont regroupées **en bas**.

### `center`

Les lignes sont **centrées verticalement**.

### `space-between`

Espace **uniforme entre les lignes**, rien aux extrémités.

### `space-around`

Espace **autour** de chaque ligne (bords = moitié des espaces internes).

### `space-evenly`

**Espacements égaux** entre les lignes et aux extrémités.

-----------------------

# Flex

## Les 3 composantes expliquées simplement

## `flex-grow` — *capacité à grandir*

> Combien d’espace supplémentaire l’élément peut prendre

```

flex-grow: 1;
```

- `0` → ne grandit pas
- `1` → prend sa part de l’espace libre
- `2` → prend **2 fois plus** qu’un élément à `1`

📌 Exemple :

```

.child1 { flex-grow: 1; }
.child2 { flex-grow: 2; }
```

➡️ Si 300px sont libres :

- child1 → 100px
- child2 → 200px

------

## `flex-shrink` — *capacité à rétrécir*

> Comment l’élément se réduit quand il n’y a pas assez de place

```

flex-shrink: 1;
```

- `1` → rétrécit si nécessaire (par défaut)
- `0` → **ne rétrécit jamais**

📌 Exemple :

```

.child {
  flex-shrink: 0;
}
```

➡️ Très utile pour éviter qu’un header/footer s’écrase.

------

## `flex-basis` — *taille de départ*

> Taille initiale avant le calcul du grow/shrink

```

flex-basis: auto; /* défaut */
```

Valeurs possibles :

- `auto` → taille naturelle (`width` / `height`)
- `0` → ignore la taille du contenu
- `200px`, `30%`, etc.

📌 Exemple important :

```

flex: 1;
```

équivaut à :

```

flex: 1 1 0;
```

➡️ Tous les éléments partagent l’espace **équitablement**, peu importe leur contenu.

--------------------

## Tableau des combinaisons Flexbox impossibles ou sans effet

| Propriété A                | Propriété B                                   | Pourquoi elles ne se combinent pas                           |
| -------------------------- | --------------------------------------------- | ------------------------------------------------------------ |
| **align-content**          | **flex-wrap: nowrap**                         | `align-content` **ne fonctionne jamais** si le Flexbox n’a **pas de multi-lignes**. |
| **align-self**             | **align-content**                             | `align-self` agit **sur un élément**, `align-content` agit **sur des lignes**, donc aucune interaction. |
| **order**                  | **align-content**                             | Réorganiser les éléments ne crée pas de lignes supplémentaires → `align-content` inutile sans wrap. |
| **order**                  | **align-items**                               | Modifier l’ordre n’a aucun effet sur l’alignement secondaire → propriétés indépendantes. |
| **order**                  | **justify-content**                           | L’ordre change la séquence des éléments, pas la façon dont ils sont répartis → aucune incompatibilité mais aucune “combinaison”. |
| **align-items**            | **align-content**                             | `align-items` aligne **les éléments dans une ligne**, `align-content` aligne **les lignes entre elles** : ne s’influencent pas. |
| **justify-content**        | **align-content**                             | L’un agit sur l’axe principal, l’autre sur les lignes de l’axe secondaire → ne se combinent pas sauf cas très spécifiques. |
| **flex-direction: column** | **justify-content (espacements horizontaux)** | `justify-content` devient vertical en mode colonne → impossible de gérer l’horizontalité. |
| **flex-direction: row**    | **align-items (alignement horizontal)**       | `align-items` ne peut pas aligner horizontalement en mode row (seulement verticalement). |
| **order**                  | **flex-direction**                            | L’ordre ne dépend pas de l’orientation → aucune combinaison utile. |
| **align-self**             | **justify-content**                           | L’un agit sur l’axe secondaire pour un élément, l’autre sur l’axe principal pour le groupe. Aucune interaction. |

# Les 3 incompatibilités les plus importantes à retenir

| Propriété           | Avec…                    | Pourquoi                                                     |
| ------------------- | ------------------------ | ------------------------------------------------------------ |
| **align-content**   | `flex-wrap: nowrap`      | **Ne fonctionne jamais sans wrap**                           |
| **justify-content** | `flex-direction: column` | Agit verticalement, donc impossible d'aligner horizontalement |
| **align-self**      | `align-content`          | Élément vs groupe de lignes → logiques incompatibles         |