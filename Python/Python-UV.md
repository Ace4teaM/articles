# UV

**Gestionnaire de dépendances et d'environnement virtuels pour python**

- Le dependency hell est un problème récurrent dans tous les projets utilisant plusieurs packages.
- UV est l’un des outils contemporains qui permet de contourner le dependency hell
- UV permet le management des dépendances dans un environnement virtuel Python isolé
- La “recette” de l'environnement UV est stockée dans le fichier `pyproject.toml`. Cette “recette” cuisinée figure dans le fichier`uv.lock`

## Installation

Pour installer UV depuis Powershell

https://docs.astral.sh/uv/getting-started/installation/

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

En suite, ce placer dans le dossier du projet:

cd "emplacement"

puis initialiser le projet:

```powershell
uv init
```

Cela va créer dans  votre répertoire actuel, un nouveau dossier avec le nom que vous avez  spécifié. Au sein de ce dossier, vous allez trouver 3 fichiers : 

- Un [README.md](http://readme.md), exactement le même que dans un répo Git. Il a le même objectif et ne  vous fait que gagner un peu de temps au lieu de le créer par vous-même.
- Un script python[`main.py`](http://main.py), qui n’est en réalité qu’un script générique, ne contenant pas grand-chose.
- Un fichier `pyproject.toml` . C’est le fichier le plus important parmi les 3 et le plus central dans votre usage d’UV. 

**pyproject.toml**

```toml
[project]
name = "fashion-trend-intelligence"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.9"
dependencies = []
```

## Ajouter une dépendance (et ajouter l'environnement virtuel)

Si vous ajoutez une dépendance, par exemple:

```
uv add pandas
```

**résultat:**

UV détecte la version et install si besoin Python dans la version spécifié par **pyproject.toml** puis installe et spécifie les versions des paquetages

```powershell
Using CPython 3.9.1 interpreter at: C:\Users\aceteam\AppData\Local\Programs\Python\Python39\python.exe
Creating virtual environment at: .venv
Resolved 9 packages in 590ms
Prepared 6 packages in 4.93s
░░░░░░░░░░░░░░░░░░░░ [0/6] Installing wheels...                                                                         warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 6 packages in 885ms

 + numpy==2.0.2
 + pandas==2.3.3
 + python-dateutil==2.9.0.post0
 + pytz==2025.2
 + six==1.17.0
 + tzdata==2025.3
```

**pyproject.toml**

Non seulement les noms de packages sont présents, mais UV a également rajouté des contraintes sur leurs versions.

```toml
[project]
name = "fashion-trend-intelligence"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.9"
dependencies = [
    "pandas>=2.3.3",
]
```

UV a créé également un fichier **uv.lock** très long qui contient toutes les informations dont UV a besoin pour créer votre environnement virtuel. En le partageant donc avec un collègue, il pourra (avec les étapes que  nous verrons) reproduire à l’identique votre environnement de travail !

En plus de déclarer les dépendances dans le fichier `pyproject.toml`, la commande `uv add` crée aussi l’environnement virtuel. Vous pouvez le constater grâce à un nouveau dossier nommé  `.venv ` qui s’est rajouté aux côtés du`pyproject.toml `

## Activez votre environnement virtualisé

Pour le moment, l’environnement a été créé grâce aux uv add successifs, mais il n’a pas encore été activé ! 

Pour ce faire, rentrez dans votre **terminal** la commande :

```shell
.venv\Scripts\activate
```

si vous êtes sous Windows en **Powershell**

```powershell
source .venv/bin/activate
```

## Désactiver votre environnement virtualisé

```
deactivate
```

## Autres opérations

Avec UV, vous pouvez également effectuer les opérations suivantes :

- **Désinstaller** une dépendance :  `uv remove`
- **Rafraîchir** votre environnement virtuel, si jamais vous avez modifié le fichier  `pyproject.toml : uv sync`
- Si vous êtes curieux, vous pouvez **regarder toutes les sous-dépendances** de vos packages avec :  `uv tree `
- Si vous êtes encore plus curieux, voici[ toutes les commandes possible](https://docs.astral.sh/uv/reference/cli/)s que vous pouvez réaliser avec UV.

## Lancez des scripts sophistiqués

Nous allons aborder ensemble trois use cases que vous allez fréquemment rencontrer dans votre pratique d’UV :

- Migrer un repo legacy, utilisant pip, vers UV : Souvent, des repos maintenus  ou lancés par des profils plus junior, ou pas sensibilisé à l’importance du dependency hell
- Onboarder un nouveau collègue à votre code : Autrement dit, quelles manips UV  doit réaliser votre collègue pour s’approprier le code de votre repo Git ?
- Upgrader vos packages aux versions récentes : Vous voulez bénéficier des  nouvelles fonctionnalités intéressantes de vos packages sans tomber dans le dependency hell ? Comment faire avec UV ?



**Migrer un repo legacy, utilisant pip**

```
uv pip install -r requirements.txt
uv add -r requirements.txt
```



**Onboarder un nouveau collègue à votre code (recréer l'environnement virtuel depuis les fichier uv.lock)**

```
uv venv
```

Cela va venir créer  l’environnement virtuel, et éventuellement installer une version de  python différente de celle installée dans son PC (en fonction du contenu du  `pyproject.toml` ). En revanche, cette commande toute seule n’installe pas les packages du  `uv.lock` ! Tout ce qu’elle fait, c’est créer un dossier  `.venv` , avec une version de Python à l’intérieur, mais sans aucun package.

C’est uniquement avec la commande :

```
uv lock
```

que l’on va lire le fichier`uv.lock` et installer toutes les dépendances et reproduire l’environnement tel qu’il était dans Git.



**Upgrader vos packages aux versions récentes**

Comment mettre à jour un package sans s’arracher les cheveux avec des conflits de dépendances ? 

C’est très simple :

```
uv lock -—upgrade
```

Et voilà ! Si la commande uv lock “simple” se contente bêtement d'installer ce qui se trouve dans le fichier  `uv.lock`, l'argument supplémentaire `--upgrade` va ignorer le fichier  `uv.lock` actuel, aller lire le  `pyproject.toml` de nouveau, et installer les versions les plus récentes du package tout en respectant les contraintes du  `pyproject.toml` !



## Configurez votre environnement de travail et vos packages

Créer des groupes de packages

Certains paquetage ne sont utile qu'en production et d'autres en développement

Par exemple nous pouvons utiliser des groupes nommé `dev` et `prod` pour ajouter des paquetages

```
uv add --group dev ipykernel
```



## Scénario de création des packages

```
uv add pandas
uv add beautifulsoup
uv add boto3
...
```

ensuite on utilise sync pour installer les packages dans les meilleurs versions compatibles

```
uv sync
```

pour s'assurer qu'une version compatible d'un package est installé

```
uv add XXXX -upgrade
```

mettre à jour le fichier lock pour le déploiement par d'autres utilisateurs

```
uv lock
```

activer l'environnement virtuel

```
.venv\Scripts\activate
```



## Mettre à jour toutes les dépendances vers les meilleures versions

```
uv lock --upgrade
uv sync
```

