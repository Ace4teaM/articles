## ARIA

**Accessible Rich Internet Applications**

https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA



*Accessible Rich Internet Applications* **(ARIA)** (qu'on pourrait traduire par « applications internet riches et accessibles ») est un ensemble de [rôles](https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA/Reference/Roles) et d'[attributs](https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA/Reference/Attributes) d'attributs qui définissent comment rendre le contenu et les  applications web accessibles (notamment ceux développés avec JavaScript) pour les personnes avec des handicaps.

ARIA complète HTML afin que les éléments interactifs et les widgets  puissent être utilisés par les outils d'assistance quand les  fonctionnalités standard ne le permettent pas.

## Accessibilités (aria-...)

**Accessible Rich Internet Applications**

https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA

*Accessible Rich Internet Applications* **(ARIA)** (qu'on pourrait traduire par « applications internet riches et accessibles ») est un ensemble de [rôles](https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA/Reference/Roles) et d'[attributs](https://developer.mozilla.org/fr/docs/Web/Accessibility/ARIA/Reference/Attributes) d'attributs qui définissent comment rendre le contenu et les  applications web accessibles (notamment ceux développés avec JavaScript) pour les personnes avec des handicaps.

ARIA complète HTML afin que les éléments interactifs et les widgets  puissent être utilisés par les outils d'assistance quand les  fonctionnalités standard ne le permettent pas.

### Utilisez les rôles en complément des balises HTML5

En complément des balises sémantiques du HTML5, vous pouvez tout à fait utiliser les **attributs** `role` pour avoir une **compatibilité renforcée** avec l’ensemble des navigateurs.

Selon le W3C, les attributs ARIA peuvent définir :

- **la nature** de l’élément (un menu de navigation, par exemple) ;
- **l’action** de l’élément (il ouvre une modale) ;
- **l’état** de l’élément (un menu dropdown ouvert ou fermé, par exemple).

### Rôle

l'attribut **role** permet de donner une fonction à une balise

```html
<!-- Exemple d'une barre de recherche avec un rôle de recherche -->
<div role="search">
   <input ... />
</div>
```

### Labels

Les labels permettent de donner une information de base concernant la nature et le type d’information attendu dans un champ.

l'attribut **aria-label** 

Ces attributs auront parfois le même sens que les balises HTML5 (pour les balises type nav  ou header, par exemple). Cela dit, parfois, ces attributs apporteront **un sens bien plus précis** pour une barre de recherche ou une bannière, par exemple.

```html
<!-- Exemple d'une barre de recherche avec un rôle de recherche -->
<div aria-label="Repositories" role="search">
   <input aria-label="Find a repository".... />
</div>
```

Dans la structuration de votre page HTML, le principe de l’attribut `role` sera de définir avec plus de précision **l’utilité ou la fonction** d’un élément ou d’un groupe d’éléments.

Voici un deuxième exemple, cette fois-ci en rapport avec un svg :

```html
<!-- Exemple d'une image en svg -->
<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" class="d-block" viewBox="0 0 612 612" role="img" focusable="false">
   <title>Bootstrap</title>
   <path fill="currentColor" d="M510 8a94.3 94.3 0 0 1 94 94v408a94.3 94.3 0 0 1-94 94H102a94.3 94.3 0 0 1-94-94V102a94.3 94.3 0 0 1 94-94h408m0-8H102C45.9 0 0 45.9 0 102v408c0 56.1 45.9 102 102 102h408c56.1 0 102-45.9 102-102V102C612 45.9 566.1 0 510 0z"></path>
   <path fill="currentColor" d="M196.77 471.5V154.43h124.15c54.27 0 91 31.64 91 79.1 0 33-24.17 63.72-54.71 69.21v1.76c43.07 5.49 70.75 35.82 70.75 78 0 55.81-40 89-107.45 89zm39.55-180.4h63.28c46.8 0 72.29-18.68 72.29-53 0-31.42-21.53-48.78-60-48.78h-75.57zm78.22 145.46c47.68 0 72.73-19.34 72.73-56s-25.93-55.37-76.46-55.37h-74.49v111.4z"></path>
</svg>
```

Dans le code ci-dessus, nous pouvons voir que **l’attribut role a pour valeur** `img` . Ce rôle permet au screen reader d’identifier cet élément comme une image. Ici, la balise  `title` permet de donner le rôle à l’image.

Pour connaître tous les rôles existants, je vous invite à vous référer à [la liste de rôles fournie par le W3C](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles).

L'attribut `aria-labelledby` est un outil essentiel de l'accessibilité web (**ARIA**). Il permet de définir un lien entre un élément et l'élément qui lui sert d'étiquette (ou de titre).

C'est un peu le "grand frère" de l'attribut `for` que l'on utilise avec les `<label>`, mais il est beaucoup plus flexible.

**labelledby**

------

1. Comment ça fonctionne ?

L'attribut `aria-labelledby` prend comme valeur l'**ID** d'un autre élément de la page. Le lecteur d'écran (utilisé par les personnes malvoyantes) lira le texte de l'élément cible pour décrire l'élément actuel.

**Exemple simple :**

HTML

```html
<h2 id="titre-section">Options de livraison</h2>

<div role="group" aria-labelledby="titre-section">
  <input type="radio" id="standard" name="livraison">
  <label for="standard">Standard</label>
</div>
```

------

2. Pourquoi l'utiliser au lieu d'un `<label>` classique ?

Le `<label>` classique ne fonctionne que pour les éléments de formulaire (input, textarea, etc.). `aria-labelledby` fonctionne sur **n'importe quel élément** (`div`, `section`, `ul`, `svg`, etc.).

Les avantages clés :

- **Cibles multiples :** Vous pouvez donner plusieurs IDs à `aria-labelledby` pour combiner des textes.
- **Éléments non-formulaire :** Parfait pour nommer une région de la page ou un dialogue (`role="dialog"`).
- **Priorité :** Si un élément a à la fois un `aria-label` et un `aria-labelledby`, c'est le **labelledby** qui gagne.

------

3. Exemple avancé : Combiner plusieurs sources

C'est ici que cet attribut devient très puissant. Vous pouvez construire une étiquette complexe à partir de plusieurs morceaux de texte.

HTML

```
<span id="nom-produit">Ordinateur Portable</span>
<span id="details"> - Version Pro 16Go</span>

<button aria-labelledby="nom-produit details">Acheter</button>
```

------

4. `aria-label` vs `aria-labelledby` : La différence

Il est facile de les confondre, voici le mémo rapide :

| Attribut              | Usage                                                        |
| --------------------- | ------------------------------------------------------------ |
| **`aria-label`**      | On écrit le texte directement dans l'attribut (ex: `aria-label="Fermer"`). Le texte n'est pas visible à l'écran. |
| **`aria-labelledby`** | On pointe vers l'**ID** d'un texte qui **existe déjà** visuellement sur la page. |

Exporter vers Sheets

------

Résumé pour une bonne accessibilité

- Utilisez **`<label for="...">`** pour les champs de formulaire simples (c'est le plus robuste).
- Utilisez **`aria-labelledby`** quand le titre de l'élément est déjà écrit quelque part ailleurs sur la page ou pour des composants complexes (modales, menus).

### Menus

**aria-haspopup**

Cet attribut permet de déclarer que le menu de navigation comporte un sous-menu. Ses valeurs possibles sont *true* ou *false*. Si le menu de navigation ne comporte pas de sous-menu, il est inutile de renseigner cet attribut.

**aria-controls**

Cet attribut permet d’indiquer que l’élément ayant cet attribut contrôle l’état de la balise portant le même id.

Dans l’exemple ci-dessous, le bouton contrôle le bloc d’éléments ayant l’id  `toggleNavbar` . On notera aussi un  `aria-label` pour donner un sens enrichi à cet élément.

```html
<div>
   <div id="toggleNavbar">
     <div>
       <!-- le contenu de votre menu de navigation ici -->
     </div>
   </div>
   <nav>
     <button aria-controls="toggleNavbar" aria-expanded="false" aria-label="Toggle navigation">
       <span></span>
     </button>
   </nav>
</div>
```

### Fil d’Ariane (ou breadcrumb)

Un **fil d’Ariane (ou \*breadcrumb\*)** est un patron de conception très courant dans le web. C’est un “moyen de  vous repérer quand vous êtes plongé dans un ou plusieurs niveaux de  profondeur sur un site Internet.” - ([source](https://facemweb.com/referencement-naturel-seo/fil-ariane)).

Comme vous pouvez le voir dans l’exemple ci-dessous, pour créer un fil  d’Ariane accessible, vous aurez besoin de deux attributs ARIA :

- un attribut  `aria-label` pour définir le bloc comme un fil d’Ariane ;
- un attribut  `aria-current` pour définir la page courante. 

```html
<nav aria-label="breadcrumb">
   <ol>
     <li class="breadcrumb-item"><a href="#">Home</a></li>
     <li class="breadcrumb-item"><a href="#">Library</a></li>
     <li class="breadcrumb-item active" aria-current="page">Data</li>
   </ol>
</nav>
```

Vous noterez aussi l’utilisation d’une liste ordonnée  `ol` qui permet de créer une imbrication des éléments.

*Bien, c’est maintenant l’heure de passer à la pratique et de réaliser notre menu de navigation.*

### Elements cachés

Par exemple: si une icône est  uniquement décorative et ne contient pas de liens, vous pouvez la  masquer auprès des technologies d'assistance via l’attribut  `aria-hidden=true` .

```html
<a href="/recherche">
    <!-- Ici l'icône ne sera pas lu par le screen reader -->
    <i class="fas fa-search" aria-hidden="true"></i>
</a>
```

### Description

À la différence du PNG et du JPG, **on peut utiliser le SVG aussi bien avec la balise `img`** – et dans ce cas-là, on pourra utiliser l’attribut  `alt` – qu'en  `inline` (autrement dit, directement dans le HTML). 

Quand on utilise ce dernier en inline, il convient de respecter certaines règles :

- **Vous pouvez utiliser la balise  `title` pour décrire le SVG**. Si c’est un panier (dans le cadre d’un site e-commerce), vous pourrez écrire :  `<title>Panier</title>` .
- En complément de la balise  `title` , vous pouvez utiliser la balise  `**desc**` qui vous permettra d’ajouter une description complémentaire. Par exemple,  `<desc>la forme d’un caddie de supermarché</desc>` .
- Pour lier le SVG à vos balises  `title` et  `desc` , vous allez devoir utiliser de pair un **attribut  `id` et un  `aria-describedby`** . Vous pouvez trouver ci-dessous un exemple d'implémentation.
- Enfin, vous pouvez aller plus loin en utilisant l’attribut `role=img` au sein du SVG. Cela permettra aux technologies d'assistance d’indiquer que cet élément est à considérer comme une image.

```html
<svg role="img" width="130" height="46" viewBox="0 0 130 46" fill="none" xmlns="http://www.w3.org/2000/svg" aria-describedby="titre description">
   <title id="titre">Batman</title>
   <desc id="description">Le logo de Batman</desc>
   <path d="M43.1341 0.512695H0.893433C19.9876 6.2592 21.2125 19.8957 19.4381 25.9957C61.5071 22.5752 65.2847 44.9797 65.2847 44.9797C69.7492 26.3378 97.8524 24.3424 110.96 25.6537C106.839 11.6979 121.835 3.0781 129.848 0.512695H86.7485C85.6496 9.95338 75.4156 11.0594 70.436 10.4323L69.2341 1.88091C68.6846 2.29138 68.0893 5.24444 67.8604 6.66966H62.5374C62.5374 5.71191 61.6216 3.19212 61.1637 2.05194L59.9617 10.4323C44.8512 10.4323 42.4473 3.81922 43.1341 0.512695Z" fill="black" stroke="black"/>
</svg>
```

### Scope (Tableaux)

L’attribut  `scope` au sein des balises  `th` permet de définir le sens de lecture des lignes composant notre tableau, où :

- `scope="row"` pour un sens de lecture horizontal ;
- `scope="col"`  pour un sens de lecture vertical.

```html
<table>
   <caption>Passagers du vol 377</caption>
   <thead> <!-- En-tête du tableau -->
       <tr>
           <th scope="col">Nom</th>
           <th scope="col">Âge</th>
           <th scope="col">Pays</th>
       </tr>
   </thead>
   <tbody>
       <tr>
           <th scope="row">Carmen</th>
           <td>33 ans</td>
           <td>Espagne</td>
       </tr>
       <!-- Le reste de notre tableau -->
   </tbody>
</table>
```

### Audio

**La balise audio**

On commence par la plus simple : la balise  `audio` . Elle s’utilise de pair avec les balises  `source` . Elle permet de proposer du **contenu audio** dans le HTML.

La principale chose à avoir en tête avec le format audio est de proposer  des formats compatibles avec tous les navigateurs. Pensez donc à avoir  les formats Ogg (pour Firefox et Chrome) et ACC/MP3 (pour Internet  Explorer et Safari).

### Vidéo

**La balise vidéo**

La balise  `video` s’utilise elle aussi de pair avec la balise  `source` , ainsi qu’avec la balise `track` , et permet **d'intégrer des vidéos** dans la page.

La balise  `source`  vous permet de proposer plusieurs encodages possibles en fonction des navigateurs.

Quant à la balise  `track` , elle vous permet de définir les sous-titres possibles pour votre vidéo.

Comme vous pouvez le voir dans l’exemple ci-dessous, cette balise va vous  permettre de définir les sous-titres et la langue de ces derniers pour  vos visiteurs.

```html
<!-- Un exemple simple -->
<video src="fichiervideo.webm" autoplay poster="vignette.jpg">
   Votre navigateur ne permet pas de lire les vidéos.
   Mais vous pouvez toujours
   <a href="fichiervideo.webm">la télécharger</a> !
 </video>
  <!-- Une vidéo avec des sous-titres -->
 <video src="toto.webm">
   <track kind="subtitles" src="toto.en.vtt" srclang="en"
     label="Anglais">
   <track kind="subtitles" src="toto.sv.vtt" srclang="sv"
     label="Suédois">
 </video>
```

Évitez au maximum de mettre l’attribut  `autoplay` à  `true`  (pour que vos vidéos ne se lancent pas de façon automatique). De plus en plus de navigateurs bloquent la lecture automatique. Par exemple,  Mozilla Firefox ainsi que Safari, et donc les iPhones et iPad, la  bloquent systématiquement. 

De plus, l’attribut  `controls`   est lui aussi essentiel pour que vos utilisateurs puissent garder le  contrôle sur la vidéo (et éviter, par exemple, des crises d'épilepsie).

Pour finir, pensez à ajouter un fichier de transcription si vous utilisez la balise  `audio` . Cela permettra à l’ensemble de vos utilisateurs de comprendre le sens du contenu.

Voici une sélection de librairies possibles :

- [Plyr](https://github.com/sampotts/plyr) – c’est ma librairie préférée. Elle est compatible avec de nombreux  formats, est accessible, customisable, et on peut l’utiliser avec React.
- [Video.js](https://github.com/videojs/video.js)
- [MediaElement.js](https://www.mediaelementjs.com/)

### Formulaires

**Grouper**

L’attribut  `role=group` permet de grouper les éléments. Vous utiliserez l’attribut  `aria-labelledby` pour ajouter un titre à ce groupe d’éléments.

```html
<div role="group" aria-labelledby="coordonnees">
   <p id="coordonnes">Vos coordonnées</p> <!-- Le groupe réalisé avec des div et les attributs ARIA -->
 
   <label for="nom">Quel est votre nom ?</label>
   <input type="text" name="nom" id="nom" />
 
   <label for="prenom">Quel est votre prénom ?</label>
   <input type="text" name="prenom" id="prenom" />
 
   <label for="email">Quel est votre e-mail ?</label>
   <input type="email" name="email" id="email" />
 
</div>
```

Dans l’exemple ci-dessus, nous regroupons des balises ayant une thématique commune. Bien que nous soyons dans une `div` , nous arrivons à indiquer leur sens commun grâce aux attributs ARIA.

**Labels**

Sachez qu'un  `label` reste obligatoire, même si ce dernier n’est pas visible à l’écran (ici remplacé par un placeholder). La meilleure méthode est donc de le masquer via le CSS. 

```html
<div role="group" aria-labelledby="coordonnees">
   <p id="coordonnes">Vos coordonnées</p> <!-- Le groupe réalisé avec des div et les attributs ARIA -->
 
   <label class="hidden" for="nom">Quel est votre nom ?</label>
   <input type="text" name="nom" id="nom" placeholder="Votre nom" />
</div>
```

**Format**

Vous pouvez aller plus loin en décrivant le format attendu.

Dans le cas d’une date, par exemple, vous pouvez utiliser les attributs  `aria-labelledby` et  `id` pour ajouter des informations complémentaires.

```html
<label id="birth-date" for="birth-date">Date de naissance :</label>
<span>
   <input type="text" name="birth-date" id="birth-date" aria-labelledby="birth-date" aria-describedby="birth-date-format" placeholder="JJ/MM/YYYY">
   <span id="birth-date-format" class="hidden">JJ/MM/YYYY</span>
</span>
```

Dans l’exemple ci-dessus :

- le format de date attendu sera visible via le placeholder, mais aussi via  la balise span (celle-ci n’étant “visible” que pour les  technologies d'assistance) ;
- les attributs  `aria-labelledby` et  `aria-describedby` permettent d’assurer la cohésion entre les éléments.

**Validation**

Vous pouvez **indiquer** qu’un **champ est obligatoire** via les attributs : 

- `required` – provenant du HTML5, il permet d’indiquer à TOUS vos utilisateurs que le champ est obligatoire ;
- `aria-required=true` – informe les utilisateurs recourant aux technologies d'assistance que ce champ est obligatoire.

Une fois qu’un **utilisateur a soumis un formulaire et que des erreurs sont présentes**, vous allez pouvoir **indiquer qu’un ou plusieurs champs sont invalides** grâce à l’attribut  `aria-invalid` .

Cet attribut peut avoir comme valeur  `true` ,  `false` , mais peut aussi indiquer que l’erreur est de type grammatical ou de prononciation, avec respectivement les valeurs `grammar` et  `spelling` .

### Modals

**Rendez vos modales accessibles**

Voici la liste complète des éléments à prendre en compte lors de la création d’une modale :

- il est important de masquer le reste de la page HTML aux technologies d'assistance. Il vous faudra ajouter un attribut  `aria-hidden`;
- vous devez ajouter un attribut rôle à votre modale (  `role=”dialog”` ) ;
- certains types d’utilisateurs se servent uniquement du clavier pour parcourir  les sites. Vous devez donc être en mesure de fermer la modale avec la  touche “échap” ;
- il est important de mettre le focus sur votre modale une fois cette dernière ouverte ;
- il est important de cacher la modale quand cette dernière n’est pas ouverte.



```html
<div class="modal" aria-hidden="true" role="dialog" aria-describedby="modalTitle">
   <div>
       <header>
           <h2 id="modalTitle" class="modal-title">Modal title</h2>
       </header>
       <div>
           <p>Content of your modal window</p>
       </div>
       <button class="modal-close-btn">Close modal</button>
   </div>
</div>
```



```javascript
// Func
const onOpenModal = () => {
   $mainWrapper.attr('aria-hidden', 'true')
   $modal.attr('aria-hidden', 'false')
   $body.addClass('no-scroll')
   $modal.css('display', 'flex')
   $modalCloseBtn.focus()
}
 
const onCloseModal = () => {
   $mainWrapper.attr('aria-hidden', 'false')
   $modal.attr('aria-hidden', 'true')
   $body.removeClass('no-scroll')
   $modal.css('display', 'none')
   $openModalBtn.focus()
}

// Close modal when escape key is pressed
$(document).on('keydown', e => {
   const keyCode = e.keyCode ? e.keyCode : e.which
 
   if ($modal.attr('aria-hidden') == 'false' && keyCode === 27) {
       onCloseModal()
   }
})
```

### CSS

**unités fixes versus les unités relatives**

* utiliser des **valeurs type relatives** ("em") plutôt que des valeurs fixes ("px")

```css
html {
   font-size: 100%; /* 16px par défaut */
}

body {
   font-size: 0.75em; /* 12px */
}

h1 {
   font-size: 2em; /* 24px */
}
```

**Masquage**

* N’utilisez pas la balise `display=none` , puisque cette dernière va masquer le contenu à tous vos utilisateurs, qu’ils utilisent des technologies d'assistance ou non.

Le code ci-dessous  vous permet de masquer le contenu à l’écran, tout en le laissant visible pour les personnes recourant à ces technologies.

```css
.visuallyhidden {
 border: 0;
 clip: rect(0 0 0 0);
 height: 1px;
 margin: -1px;
 overflow: hidden;
 padding: 0;
 position: absolute;
 width: 1px;
}
```

**Content**

La propriété  `content` va être affiché à l’écran, **sera lisible mais n'apparaîtra pas côté HTML**. Autrement dit, les technologies d'assistance n’ont aucun moyen de savoir que ce texte existe.

```css
p {
   content: "Ceci est du texte";
}
```



## Navigation

Construire une **navigation accessible** requiert d’utiliser les balises suivantes : 

- la balise  `nav` qui va déclarer ce bloc d’éléments comme un menu de navigation ;
- la balise  `a` qui va déclarer l’élément comme un lien de navigation ;
- l’ensemble des balises comprises dans la balise `nav` sera le plus souvent intégré au sein d’une liste à puces (  `ul` et  `li` ).

Utiliser **JavaScript** pour réaliser la navigation via les méthodes  `onClick` et la propriété  `window.location.href` est, de manière générale, une très mauvaise pratique pour  l'accessibilité (et donc le SEO). En effet, les technologies  d'assistance n’auront aucun moyen de distinguer cet élément d’un autre,  elles ne pourront pas identifier vers quelle page il pointe. De plus,  cela surcharge le comportement par défaut du clavier, ce qui le rend  moins utilisable pour certains publics.

Utiliser le rôle `role="navigation"` et les balises **aria-label** et **aria-labelledby** pour identifier vos menus.

Utiliser les rôles `role="menubar"` et `role="menuitem"` pour la navigation avancée.

Exemple: https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/

### Gérez les différents états de votre navigation

Une fois le squelette de votre navigation enrichie, **vous allez devoir améliorer la gestion des états du menu de navigation**. En d’autres termes, cela veut dire :

- **fournir un feedback à l’utilisateur concernant la page courante** (autrement dit, celle que l’utilisateur est en train de consulter), ainsi que les autres pages qu’il peut consulter ;
- **gérer les états de menu dropdown**, ainsi que notre fameux **menu burger** que j’ai mentionné un peu plus haut ;
- **permettre une navigation au clavier des menus déroulants**.

**Gérer le feedback de la page en cours**

* utilise l’attribut ARIA  `aria-current` 

```html
<nav aria-label="Global">
   <a aria-label="Pull requests you created" aria-current="page" href="/pulls">
     Pull requests
   </a>
   <a aria-label="Issues you created" href="/issues">
     Issues
   </a>
   <div class="mr-3">
       <a href="/marketplace">
           Marketplace
       </a>     
   </div>
   <a href="/explore">
     Explore
   </a>
</nav>
```

**Gérez le focus des éléments survolés et cliqués**

Utiliser les pseudo-classes :

- [:active](https://developer.mozilla.org/fr/docs/Web/CSS/:active) qui “**permet de cibler un élément lorsque celui-ci est activé par l'utilisateur**” (par exemple, quand l’utilisateur a cliqué dessus) ;
- [:hover](https://developer.mozilla.org/fr/docs/Web/CSS/:hover) qui **permet de spécifier l'apparence d'un élément au moment où l'utilisateur le survole** avec le pointeur, sans nécessairement l'activer ;
- [:link](https://developer.mozilla.org/fr/docs/Web/CSS/:link) qui **cible tous les liens n’ayant pas encore été visités** ;
- [:visited](https://developer.mozilla.org/fr/docs/Web/CSS/:visited) concernant **tous les liens visités** ;
- [:focus](https://developer.mozilla.org/fr/docs/Web/CSS/:focus) qui permet de cibler un élément lorsque celui-ci reçoit le focus (élément sélectionné au clavier ou à la souris).
