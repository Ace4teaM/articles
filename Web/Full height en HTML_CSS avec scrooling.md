# 100% height en HTML/CSS avec scrooling

Utiliser toute la hauteur d’une fenêtre dans un document HTML est parfois un casse-tête, voici une technique qui va vous permettre de résoudre ce problème.

La technique se base sur l'utilisation de la propriété CSS `bottom`

## Code CSS

```css
body
{
	padding:0px;
	margin:0px;
	position:absolute;
	left:0px;
	top:80px; /* header size */
	bottom:0px; /* fix height */
	width:100%;
	overflow:hidden;
}

div{
	text-align:left;
}

#header {
	width:100%;
	height:80px;
	background-color:#00CCFF;
	position:fixed;
	top:0px;
	left:0px;
	text-align:center;
}

#left {
	float:left;
	width:250px;
	height:100%;
	background-color:#FF6699;
	overflow-y:auto;
}

#left_content {
	padding:20px;
}

#right {
	display:block;
	height:100%;
	background-color:#FFCC00;
	overflow-y:scroll;
}

#right_content {
	padding:20px;
}
```

## Code HTML

```html
<div id="header">
	<h1>Header</h1>
</div>

<div id="left">
	<div id="left_content">
		<h1>Scrollable A</h1>
	</div>
</div>

<div id="right">
	<div id="right_content">
		<h1>Scrollable B</h1>
	</div>
</div>
```

## Exemple

* [Division verticale avec en-tête](Full height en HTML_CSS avec scrooling\scrollable_full_height+header.htm)
* [Division verticale avec en-tête et pied de page](Full height en HTML_CSS avec scrooling\scrollable_full_height+header+footer.htm)

## Bugs observés
| Plateforme  | Navigateur | Symptômes                                      | Résolution                                                   |
| ----------- | ---------- | ---------------------------------------------- | ------------------------------------------------------------ |
| iPad/iPhone | Safari     | La barre de défilement vertical n'apparait pas | Forcer l'affichage de la barre de défilement avec l'attribut CCS `overflow:scroll;` |

--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)