## Squelette de la page web

Il est important d'utiliser certaines balises sémantiques même si cela ne change pas la mise en forme: <H1>, <HEADER>, <NAV>, <MAIN>, <SECTION>, <ARTICLE>, <ASIDE> ... 

Par exemple:

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Sémantique Simplifiée</title>
</head>
<body>

    <!-- En-tête de la page -->
    <header>
        <h1>Titre du site</h1>
    </header>
    
    <!-- Menu de navigation principal -->
    <nav>
        <a href="#accueil">Accueil</a>
        <a href="#blog">Blog</a>
        <a href="#contact">Contact</a>
    </nav>
    
    <!-- Contenu principal -->
    <main>
    
        <!-- Section d’introduction -->
        <section id="accueil">
            <h2>Accueil</h2>
        </section>
    
        <!-- Section avec articles -->
        <section id="blog">
            <h2>Blog</h2>
            <article>
                <h3>Article Exemple</h3>
            </article>
        </section>
    
        <!-- Section contact -->
        <section id="contact">
            <h2>Contact</h2>
        </section>
    
    </main>
    
    <!-- Pied de page -->
    <footer>
        <p>Pied de page</p>
    </footer>

</body>
</html>
````

### Balises

**main**

*Utilisé pour identifier la région principale de votre page*; le contenu à l’intérieur est susceptible de changer selon les pages (à la différence de votre menu de navigation).

**section**

Balise regroupant un même sujet ou une même fonctionnalité. Commence généralement par un titre.

**article**

Article de blog, ou recette de cuisine, par exemple.

**aside**

Balise regroupant un **contenu complémentaire** du contenu principal.

**footer**

Balise de conclusion (soit pour la page entière, soit pour une section).

**Comme avec le header, vous pouvez intégrer un footer dans un article ou dans une section**.

Cela dit, il faudra penser à intégrer un aria de type label pour définir en  quoi cette région est différente de vos autres balises footer au sein de votre page.