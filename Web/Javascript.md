# Javascript

## **Utiliser les sélecteurs CSS**

https://developer.mozilla.org/fr/docs/Web/API/Document/querySelector

```javascript
let element = document.querySelector("tag")
```

```javascript
let elements = document.querySelectorAll("tag")
```

**Utiliser les sélecteurs Id**

```javascript
let element = document.getElementById("id")
```

## **Différé le chargement d'un script**

Utilisez `defer` dans l’inclusion de vos fichiers JS pour retarder leur prise en compte, afin que la variable *document* ait le temps d’être créée

<script src="scripts/main.js" defer></script>

Par exemple

```javascript
document.getElementById("inputEcriture")
```

`getElementById` retournera `null` si le mot clé `defer` n'est pas spécifié dans ce code:

> car script est inclue avec la fin du DOM

```html
<!DOCTYPE html>
<html lang="fr">
    <head>
        <script src="scripts/main.js" defer></script>
    </head>

    <body>
        <div class="zoneScore">
            Votre score : <span>0</span>
        </div>
    </body>
</html>
```

## **Modifier des attributs**

```javascript
let baliseImage = document.getElementById("premiereImage");
baliseImage.setAttribute("alt", "Ceci est la nouvelle valeur de alt");
```

ou, pour les éléments HTML valides:

```javascript
baliseImage.alt = "Ceci est une image de test modifiée";
```

## **Ajouter / supprimer des classes**

```javascript
baliseImage.alt = "Ceci est une image de test modifiée";
baliseImage.classList.add("nouvelleClasse")
baliseImage.classList.remove("photo")
```

## **Créer des éléments**

```javascript
let nouvelElement = document.createElement("div");
```

## **Insérez votre balise dans la page**

```javascript
// Récupérer un élément parent existant
let parentElement = document.getElementById("conteneur");

// Ajouter le nouvel élément au parent
parentElement.appendChild(nouvelElement);
```

## **Utilisez la propriété innerHTML pour insérer du HTML**

```javascript
// Définition des variables contenant le texte du titre et du paragraphe
let contenuTitre = "Azertype"
let contenuParagraphe = "L'application pour apprendre à taper plus vite !"

// Création d'un div avec createElement. Dans cette div, on va créer un titre h1 et un paragraphe p
let nouvelleDiv = document.createElement("div")
let nouveauTitre = document.createElement("h1")
let nouveauParagraphe = document.createElement("p")

// On ajoute du texte dans le titre et le paragraphe
nouveauTitre.textContent = contenuTitre
nouveauParagraphe.textContent = contenuParagraphe

// On ajoute le titre et le paragraphe dans la div
nouvelleDiv.appendChild(nouveauTitre)
nouvelleDiv.appendChild(nouveauParagraphe)

// On ajoute la div dans le body
let body = document.querySelector("body")
body.appendChild(nouvelleDiv)
```

ou, des littérales String

```javascript
let contenuTitre = "Azertype"
let contenuParagraphe = "L'application pour apprendre à taper plus vite !"

let div = `
    <div>
        <h1>${contenuTitre}</h1>
        <p>${contenuParagraphe}</p>
    </div>
    `;

let body = document.querySelector("body")
body.innerHTML = div
```

## **S'abonner à un événement**

```javascript
let monBouton = document.getElementById("monBouton");
monBouton.addEventListener("click", function () {
    console.log("Vous avez cliqué sur le bouton")
});
```

## **Empêchez le comportement par défaut de l'événement “submit”**

Nous l’avons vu, l’événement *submit* a ceci de particulier qu’il provoque un rechargement automatique de la page lorsqu’il est envoyé.

> Voyons ensemble avec un exemple comment gérer ce comportement :

```html
<form>
    <!-- champ nom -->
    <label for="nom">Nom</label>
    <input type="text" id="nom" name="nom" placeholder="Votre nom">

    <!-- champ email -->
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Votre email">

    <!-- bouton de validation -->
    <button>Envoyer</button>
</form>
```

Lorsque l’on clique sur le bouton Envoyer, l’événement *submit* est envoyé, et le navigateur veut envoyer les données au serveur et réafficher la page. 

Pour empêcher ce comportement par défaut, nous allons donc :

- écouter cet événement *submit* ;
- empêcher ce comportement grâce à la méthode *preventDefault*.

> Voici un exemple :

```javascript
const form = document.querySelector('form');

// Quand on submit
form.addEventListener("submit", (event) => {
    // On empêche le comportement par défaut
    event.preventDefault();
    console.log("Il n’y a pas eu de rechargement de page");
});
```

Une fois que nous avons rédigé le *preventDefault*, nous pouvons traiter le contenu du formulaire. Par exemple, en affichant les valeurs du formulaire dans un *console.log* :

```javascript
form.addEventListener("submit", (event) => {
    // On empêche le comportement par défaut
    event.preventDefault();
    console.log("Il n’y a pas eu de rechargement de page");

    // On récupère les deux champs et on affiche leur valeur
    const nom = document.getElementById("nom").value;
    const email = document.getElementById("email").value;
    console.log(nom);
    console.log(email);
});
```

## **Expression Régulière**

```javascript
let chaine = "cachalot"; // Testez avec des chiffres pour voir la différence
let regex = new RegExp("^[a-z]+$");
let resultat = regex.test(chaine);
console.log(resultat); // Affiche true.
```

## **Tri des tableaux**

```javascript
piecesOrdonnees.sort(function (a, b) {
	return a.prix - b.prix;
});
```

## **Transformer les tableaux (map)**

Transformer un tableau en sélectionnant les élément à extraire

```javascript
const noms = pieces.map(piece => piece.nom);
```

ou avec une fonction anonyme

```javascript
const noms = pieces.map(function (piece){
    return piece.nom;
});
```

## **Littéral string**

```javascript
const str = `${piece.nom} - ${piece.prix} €`;
```

## **Requête Asynchrone**

```javascript
fetch("http://monsite.fr/ma-ressource"); // fetch retourne un objet Promise
console.log("Le script continue sans attendre la réponse");
```

## **Requête Synchrone**

```javascript
await fetch("http://monsite.fr/ma-ressource");
console.log("Le script continuera après avoir reçu la réponse");
```

## **Requête avec charge utile**

```javascript
fetch("/pieces/1/avis", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: '{"commentaire": "Top produit !"}'
});
```

## **Stockage local du navigateur**

Définir :

```javascript
window.localStorage.setItem("nom", "Les Bonnes Pièces !");
```

Obtenir :

```javascript
const nomEntreprise = window.localStorage.getItem("nom");
```

## **Obtenir le parent dans un évenements**

Parcourt l'élément et ses parents (en se dirigeant vers la racine du document) jusqu'à trouver un nœud correspondant à la spécification.

```javascript
// Méthode pour fermer (cacher) la modale
const closeButton = document.querySelector(".close-button");
closeButton.addEventListener("click", async function (event) {
    var parentModal = event.target.closest(".modal"); // ici, on obtient le parent le plus proche avec la classe 'modal'
    parentModal.classList.add("hidden");
});
```

## **Export par défaut (default export)**

* Le module **n’impose aucun nom**

* L’export est **anonyme du point de vue du module**

* Le nom est choisi **côté import**

Export:

```javascript
// module.js
export default const foo = 1
```

Import :

```javascript
import foo from './module'
```

➡️ *Pas d’accolades*

## **Export nommé (named export)**

* Le module **déclare explicitement les noms**

* Ces noms font partie de l’API publique

* L’import **doit utiliser ces noms**

Export:

```javascript
// module.js
export const foo = 1
export function bar() {}
```

Import :

```javascript
import { foo, bar } from './module'
```

➡️ *Avec accolades*
➡️ Les noms doivent correspondre exactement

On peut renommer un export nommé:

```javascript
import { useState as useLocalState } from 'react'
```

## **Exports (Généralités)**

 Un module peut avoir :

- **1 export par défaut**
- **N exports nommés**

Export:

```javascript
// module.js
export default const foo = 1
export function bar() {}
```

Import :

```javascript
import baz from 'module'     // export par défaut peut être renommé (foo)
import { bar } from 'module' // export nommé
```

## Some  / Every / Filter

### **`some()`**

**Vérifie si \*au moins un\* élément** du tableau respecte une condition.

Retourne

- `true` → s’il existe **au moins un élément** qui passe le test
- `false` → sinon

Fonctionnement

- S’arrête **dès qu’un élément valide est trouvé**
- Ne modifie pas le tableau

Exemple

```javascript
const numbers = [1, 3, 5, 8];

numbers.some(n => n % 2 === 0);
// true (8 est pair)
```

------

###  `every()`

**Vérifie si \*tous\* les éléments** du tableau respectent une condition.

Retourne

- `true` → si **tous les éléments** passent le test
- `false` → dès qu’un élément échoue

Fonctionnement

- S’arrête **au premier échec**
- Ne modifie pas le tableau

Exemple

```javascript
const ages = [18, 21, 30];

ages.every(age => age >= 18);
// true
```

------

### `filter()`

**Crée un nouveau tableau** avec les éléments qui respectent une condition.

Retourne

- Un **nouveau tableau**
- Peut être vide (`[]`)

Fonctionnement

- Teste **tous les éléments**
- Ne modifie pas le tableau original

Exemple

```javascript
const numbers = [1, 2, 3, 4, 5];

numbers.filter(n => n > 3);
// [4, 5]
```

------

Comparatif rapide

| Méthode  | Question posée  | Retour    |
| -------- | --------------- | --------- |
| `some`   | *Au moins un ?* | `boolean` |
| `every`  | *Tous ?*        | `boolean` |
| `filter` | *Lesquels ?*    | `array`   |

------
