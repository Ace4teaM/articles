> A ILLUSTRER avec des images et poster dans les articles Github



# Datasheet – Techniques CSS

Ce document regroupe les **techniques CSS essentielles** utilisées aujourd’hui pour construire des layouts modernes, responsives et maintenables.

---

## 1. Normal Flow (flux normal)

### Principe
Comportement par défaut du navigateur : les éléments s’empilent selon leur type (`block` ou `inline`).

### Propriétés clés
- `display: block`
- `display: inline`
- `display: inline-block`

### Cas d’usage
- Pages simples
- Texte, articles, formulaires basiques

### Avantages
- Simple
- Prévisible

### Limites
- Peu flexible pour des layouts complexes

---

## 2. Box Model

### Principe
Chaque élément est une boîte composée de : `content`, `padding`, `border`, `margin`.

### Propriétés clés
- `margin`
- `padding`
- `border`
- `box-sizing`

### Bonnes pratiques
```css
* {
  box-sizing: border-box;
}
```

### Cas d’usage
- Gestion fine des espacements
- Bases de tout layout CSS

---

## 3. Positionnement CSS

### Types
| Valeur | Description |
|------|------------|
| `static` | Par défaut |
| `relative` | Décalage par rapport à sa position |
| `absolute` | Sort du flux, basé sur un parent positionné |
| `fixed` | Fixé à l’écran |
| `sticky` | Hybride scroll/fixed |

### Cas d’usage
- Menus fixes
- Badges, overlays
- Headers sticky

### Limites
- Difficile à maintenir pour un layout global

---

## 4. Float (ancienne méthode)

### Principe
Utilisé historiquement pour créer des colonnes.

```css
.col {
  float: left;
}
```

### Aujourd’hui
⚠️ **Obsolète pour les layouts modernes** (remplacé par Flexbox et Grid)

---

## 5. Flexbox (1 dimension)

### Principe
Gestion d’un layout sur **une dimension** (ligne OU colonne).

### Activation
```css
.container {
  display: flex;
}
```

### Propriétés clés (container)
- `flex-direction`
- `justify-content`
- `align-items`
- `gap`

### Propriétés clés (items)
- `flex`
- `flex-grow`
- `flex-shrink`
- `align-self`

### Cas d’usage
- Navbar
- Cartes
- Alignement horizontal/vertical

### Avantages
- Simple
- Très utilisé

---

## 6. CSS Grid (2 dimensions)

### Principe
Gestion du layout sur **lignes ET colonnes**.

### Activation
```css
.container {
  display: grid;
}
```

### Propriétés clés
- `grid-template-columns`
- `grid-template-rows`
- `grid-template-areas`
- `gap`

### Exemple
```css
.container {
  display: grid;
  grid-template-columns: 1fr 3fr;
}
```

### Cas d’usage
- Layout de page complet
- Dashboards
- Grilles complexes

### Avantages
- Très puissant
- Lisible

---

## 7. Responsive Design

### Techniques
- Media queries
- Layout fluide
- Breakpoints

```css
@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
}
```

### Bonnes pratiques
- Mobile First
- Utiliser `rem`, `%`, `fr`

---

## 8. Layouts modernes combinés

### Approche courante
- **Grid** : structure globale
- **Flexbox** : alignement interne

```css
.page {
  display: grid;
  grid-template-columns: 240px 1fr;
}

.header {
  display: flex;
  justify-content: space-between;
}
```

---

## 9. Container Queries (moderne)

### Principe
Styles basés sur la taille du **conteneur** et non du viewport.

```css
@container (min-width: 500px) {
  .card {
    display: flex;
  }
}
```

### Cas d’usage
- Composants réutilisables
- Design system

---

## 10. Bonnes pratiques générales

- Utiliser **Flexbox et Grid par défaut**
- Éviter `position:absolute` pour structurer
- Privilégier des layouts simples et lisibles
- Tester sur plusieurs tailles d’écran

---

## Tableau récapitulatif

| Technique | Dimension | Usage principal |
|--------|----------|----------------|
| Normal Flow | 1D | Contenu simple |
| Position | N/A | Éléments spécifiques |
| Flexbox | 1D | Alignement |
| Grid | 2D | Structure complète |
| Media Queries | N/A | Responsive |
| Container Queries | N/A | Composants |

---

📌 **Recommandation actuelle** :
> CSS Grid pour la structure + Flexbox pour l’alignement interne

## 11. Min/Max

- Utiliser pour métriser le contenu

```css
.content > div{
    width: min(70%, 780px);
    margin-top: -30px;
    padding: 30px;
}
```

## 12. Image bandeau

- prenant toute la largeur mais réduit en hauteur sans déformation

```css
.content{
    display: flex;
    flex-direction: column;
}

.content > img{
    width: 100%;           /* garde 100% largeur */
    max-height: 300px;
    object-fit: cover;     /* tronque si nécessaire mais conserve le ratio */
}
```

## 13. Ignore les marges parents

- prenant toute la largeur même si le parent impose des marges

```css
.content{
    /* ignore la marge du parent pour se coller sur les bords */
    margin-left: calc(50% - 50vw);
    margin-right: calc(50% - 50vw);
}
```

