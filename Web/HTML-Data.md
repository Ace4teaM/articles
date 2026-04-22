## Données personnalisées (data-...)

L'insertion de données personnalisées dans le HTML est une pratique courante pour stocker des informations sans affecter le rendu visuel de la page. La méthode standard et la plus propre consiste à utiliser les **attributs `data-\*`**.

Voici comment les utiliser efficacement :

### La syntaxe HTML

Pour créer un attribut de données, il suffit de préfixer votre nom d'attribut par `data-`. Vous pouvez en ajouter sur n'importe quel élément HTML.

HTML

```html
<div id="produit" 
     data-id="12345" 
     data-categorie="electronique" 
     data-prix-promo="19.99">
    Casque Audio
</div>
```

- **Règle :** Le nom après `data-` ne doit pas contenir de majuscules (utilisez des tirets à la place, comme `data-prix-promo`).

------

### Récupérer les données en JavaScript

JavaScript propose une propriété dédiée appelée `dataset` pour lire et modifier ces valeurs. Elle transforme automatiquement les noms avec tirets en **camelCase**.

JavaScript

```javascript
const element = document.getElementById('produit');

// Lecture
console.log(element.dataset.id);          // "12345"
console.log(element.dataset.categorie);   // "electronique"
console.log(element.dataset.prixPromo);   // "19.99" (le tiret est devenu une majuscule)

// Modification
element.dataset.categorie = "audio";
```

------

### Utilisation en CSS

Vous pouvez également cibler des éléments ou afficher leur contenu en fonction de ces attributs personnalisés.

**Ciblage :**

CSS

```css
/* Style tous les produits de la catégorie électronique */
[data-categorie="electronique"] {
    border: 2px solid blue;
}
```

**Affichage (via les pseudo-éléments) :**

CSS

```css
/* Affiche le prix au survol */
#produit:hover::after {
    content: " Prix : " attr(data-prix-promo) "€";
}
```

------

### Pourquoi utiliser `data-*` plutôt qu'un attribut inventé ?

1. **Validité W3C :** Votre code HTML reste valide.
2. **Compatibilité :** L'API `dataset` est optimisée pour la performance en JavaScript.
3. **Clarté :** Cela sépare clairement les attributs de structure (`id`, `class`) des attributs de données.

> **Note importante :** Ne stockez jamais de données sensibles (mots de passe, infos personnelles) dans les attributs `data-*`, car elles sont visibles par n'importe qui en inspectant le code source de la page.

