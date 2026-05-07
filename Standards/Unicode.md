# Unicode

Haaa... le merveilleux monde des encodages de caractères.

Sa diversité, sa spécificité, sa complexité.... Oui ! mais Unicode est la pour vous sauver !

Unicode est LE standard pour

## Quelques point de rappels

* Le **point de code** est un "caractère" composé de un ou plusieurs **glyphes** ou **caractère composé**, par exemple : è, ´, A, 😀, ع,  ou 野 sont des **points de codes**. En gros pour nous occidentaux un caractère.
* Un **glyphe** et une composante ou le "caractère", par exemple l'accent aigu: `´ + e = é` utilise 2 glyphes pour dessiner le `é`
* **Encodage** définit les différents façon d'encoder des points de codes en binaire. UTF8, UTF16 et UTF32 sont des encodages
* **Unicode** répertorie chaque glyphe et chaque combinaison de glyphes dans un standard. (U+00E9), (U+0301) sont des points de codes
* **NFC** est la forme **précomposé** d'un point de code (`é`) = 1 point de code. 
* **NFD** est la forme **décomposé** d'un point de code. (`e + ◌́`) = 2 points de codes. Vous pouvez donc rechercher et supprimer des accents si cela vous intéresse !

## La Normalisation

**La normalisation est indépendante de l’encodage** elle permet de passer d'une forme **décomposé à une forme précomposé** et vis-versa.

**Exemple concret**

Une même chaîne peut contenir :

```
é é
```

- `é` = **U+00E9** (précomposé)
- `é` = **U+0065 + U+0301** (décomposé)

On appelle cela une "**chaîne non normalisée**" ou "**chaîne en forme mixte**"

**Exemple de problème**

```javascript
"é" === "e\u0301" // false
```

Mais visuellement identiques.

Unicode permet donc de **décomposée** puis **précomposée** des points de code via son système de normalisation.

> Attention la normalisation change la forme binaire, pour une comparaison de texte la comparaison binaire ne suffi pas si les textes ne sont pas tout deux normalisé à l'identique.

**Forme composée (NFC)**

```
é
```

1 seul point de code :

```
U+00E9
```

**Forme décomposée (NFD)**

```
e◌́
```

2 points de code :

```
U+0065  e
U+0301  COMBINING ACUTE ACCENT
```

**Unicode peut :**

- décomposer `é` → `e + accent`
- recomposer `e + accent` → `é`

**En JavaScript :**

```javascript
const s = "é";

console.log(s.normalize("NFD"));
console.log(s.normalize("NFC"));
```

- `NFD` = décomposition
- `NFC` = recomposition

## Plans et Blocs

Les points de codes sont regroupés de façon logique dans l'indexation Uniode.

D'abord par **plan** représentant une section de la **plage de codes** et par **bloc** étant un sous-ensemble logique du plan.

Par exemple l'accent aigu fait partie du **Plan multilingue de base, U+0000 - U+FFFF[4]** dans le bloc **Commandes C1 et supplément Latin-1 (Supplément Latin-1), U+0080 - U+00FF[4]**.

Les points de code utilises la notation hexadécimal. Le plan de base se trouve donc entre le point de code **0 (0x0000)** et le point de code **65 535 (0xFFFF)** compris.

C'est un peut barbare mais ca vous permet de classifier les caractères. Et ça c'est très utile pour un programmeur !

Vous pouvez visiter ce site qui répertorie tous les plans : https://www.compart.com/fr/unicode/plane/U+0000

## Cas pratiques

### Supprimer tous les accents d'un texte

Voici une façon simple et propre en JavaScript pour supprimer les accents d’un texte latin en utilisant Unicode normalization :

```javascript
function removeAccents(text) {
  return text
    .normalize("NFD")              // décompose les caractères (é → e + ◌́)
    .replace(/[\u0300-\u036f]/g, ""); // supprime les diacritiques
}
```

**Exemple**

```javascript
console.log(removeAccents("éèêë àâîôù ç"));
// -> "eeee aaiou c"
```

### Détecter le langage d'un texte

Se base sur les plages de plans pour détecter le langage majoritaire.

```javascript
function detectScript(text) {
  const scripts = {
    latin: 0,
    arabic: 0,
    cjk: 0,
    cyrillic: 0,
    unknown: 0
  };

  for (const char of text) {
    const code = char.codePointAt(0);

    // Latin (basique + extensions)
    if (
      (code >= 0x0000 && code <= 0x024F) ||
      (code >= 0x1E00 && code <= 0x1EFF)
    ) {
      scripts.latin++;
    }

    // Arabic
    else if (code >= 0x0600 && code <= 0x06FF) {
      scripts.arabic++;
    }

    // CJK (chinois / japonais / coréen)
    else if (code >= 0x4E00 && code <= 0x9FFF) {
      scripts.cjk++;
    }

    // Cyrillic
    else if (code >= 0x0400 && code <= 0x04FF) {
      scripts.cyrillic++;
    }

    else {
      scripts.unknown++;
    }
  }

  return Object.entries(scripts)
    .sort((a, b) => b[1] - a[1])[0][0];
}
```

**Exemple**

```javascript
console.log(detectScript("Hello world")); 
// latin

console.log(detectScript("مرحبا بالعالم"));
// arabic

console.log(detectScript("你好世界"));
// cjk

console.log(detectScript("Привет мир"));
// cyrillic
```

### Simplifier un texte

Supprime les caractères les accents et simplifie les espaces.

```javascript
function simplifyText(text) {
  // 1. Décomposition Unicode (é → e + ́)
  const normalized = text.normalize("NFD");

  let result = "";
  let lastWasSpace = false;

  for (let i = 0; i < normalized.length; i++) {
    const c = normalized[i];
    const code = c.codePointAt(0);

    // 2. Ignorer les diacritiques (accents)
    // Plage Unicode des marques combinantes
    if (code >= 0x0300 && code <= 0x036f) {
      continue;
    }

    // 3. Détecter les espaces Unicode (catégorie "Separator, Space")
    // On utilise une liste simple de cas fréquents
    const isSpace =
      c === " " ||
      c === "\t" ||
      c === "\n" ||
      c === "\r" ||
      c === "\u00A0" || // espace insécable
      c === "\u202F";   // espace fine insécable

    if (isSpace) {
      if (!lastWasSpace) {
        result += " ";
        lastWasSpace = true;
      }
      continue;
    }

    lastWasSpace = false;

    // 4. Garder uniquement ASCII
    if (code <= 127) {
      result += c;
    }
    // sinon on ignore (chinois, arabe, emojis, etc.)
  }

  return result.trim();
}
```

**Exemple**

```javascript
console.log(
  simplifyText("  Héllo   Wörld  你好  مرحبا  ")
);
```

**Résultat**

```
Hello World
```

# UTF8

UTF-8 est la forme la plus courante de l'Unicode, elle permet d'unifier merveilleusement bien l'ensemble des langages dans un encodages binaires compact. UTF8 est surement le plus populaire pour le web et l'affichage car elle permet dans un stockage réduit d'afficher tout types de textes.

Mais UTF8 n'est pas parfait sinon il n'existerait pas d'autres encodage, en effet pour la manipulation de chaines UTF8 devient complexe et consommateur de calcule. Pour cela nous utiliserons plutôt *UTF-16* ou *UTF-32*.

Sous Linux, l'UTF-8 c’est devenu le standard de facto.

> Chaque point de code est encodé sur 1 à 4 octets. 

Petit bonus: **UTF-8 est compatible avec l'[ASCII](ASCII.md)** ! Et ça c'est génial !

# UTF16

UTF-16 est un compromis entre la légèreté de UTF-8 et la praticité de UTF-32. En effet, même si sont encodage varie officiellement entre **2 ou 4 octets** vous pouvez partir du principe que tous les caractères compris dans les **2 premiers octets sont les plus utiles** et les autres à **4 octets uniquement exotiques** (cunéiforme, égyptien, emojis modernes, idéogrammes chinois rares, scripts historiques, ...).

C'est exactement se que fait **Windows** avec son **standard d'encodage**. Vous échangez avec le système des chaines **WideChar** (`wchar_t`) qui sont en fait du **UTF-16 tronqué**. Les 2 derniers octets de l'Unicode étant nommé le "**High Surrogate**", voir [char.IsHighSurrogate](https://learn.microsoft.com/en-us/dotnet/api/system.char.ishighsurrogate?view=net-10.0).

Donc nous pouvons facilement indexer une chaine de caractères lettre par lettre mais il faudra quand même faire attention aux octets supplémentaires qui peuvent représenter des points de codes spéciaux tel que : 𓀀 ou 𒊮

> Chaque point de code est encodé sur 2 ou 4 octets. 

# UTF32

UTF-32 est la version idéale pour manipuler des chaines mais elle à l'inconvénient de stocker chaque point de code sur 32bits !

**Chaque point de code** est **aligné sur 32bits**, il est inutile de se demander combien d'octets pèse mon caractère (point de code) lors de l'énumération.

Attention ! UTF-32 n'échappe pas à la normalisation. En effet, puisque l'accent aigu et le "é" peuvent être 2 points de code distinct alors la normalisation permet d'unifier les 2. **La normalisation est indépendante de l’encodage.**

> Chaque point de code est encodé sur 4 octets. 
