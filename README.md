**Articles**

Articles sur des sujets divers en lien avec l'informatique.



> Ce dépôt est créé à partir de mes sources locales, certains articles ne sont pas complet ou en cours de construction. Les liens ci-dessous pointe vers les articles aboutie et exploitable.



Création du fichier `index.html` :

```shell
npx markmap-cli README.md --offline --output index.html
```



# Modélisation 3D

## 3DS Max

* [Problème de compilation MAXSDK sous VisualStudio](3DSMax/Probleme_de_compilation_MAXSDK_sous_VisualStudio.md)

# Conception

## Méthodes

* [Langage de Modélisation Unifié (UML)](Conception/UML.md)

# Programmation

## C/C++

* [Les limites de la portabilité en C et C++](C_Cpp/Les_limites_de_la_portabilite_en_C_et_Cpp.md)
* [Ordre d'initialisation des variables](C_Cpp/Ordre_initialisation_des_variables.md)
* [Librairie Boost en C++](C_Cpp/Librairie_Boost_en_Cpp.md)

## Javascripts

### Outils

* [Gestionnaire de paquets (NPM / NPX)](Javascript/NPM_NPX.md)

## Python

### Librairies

* [Manipulation de tableaux numériques (Pandas)](Python/Python-Pandas.md)

### Outils

* [Environnement virtuel (Anaconda)](Python/Python-Environnement_virtuel.md)
* [Environnement virtuel (UV)](Python/Python-UV.md)

# Réseaux

## Adressage IP

* [Les plages d'adresses IPv4](Network/Plage_adresses_IPv4.md)

# Standards

## Encodage

* ASCII
* [Unicode (UTF8, UTF16 et UTF32)](Standards/Unicode.md)

* Base64

# Web

## HTML/CSS

### Standards

* [Sémantique HTML](Web/HTML-Semantique.md)
* [Accessibilité (ARIA)](Web/ARIA.md)
* [Données (DATA)](Web/HTML-Data.md)

* [Grilles CSS (GRID)](Web/FullCSSGrid.md)
* [Containers CSS (@container)](Web/CSS-Container.md)
* [Media CSS (@media)](Web/CSS-MediaQueries.md)
* [Animations CSS](Web/CSS-animation.md)

### Outils

* [Syntactically Awesome Stylesheets (SASS)](Web/CSS-SASS.md)

### Divers

* [Rappels sur le CSS](Web/CSS-Rappels.md)
* [Datasheet_des techniques_CSS_pour_créer_un_layout.md](Web/CSS-datasheet_techniques_css_pour_creer_un_layout.md)
* [Le Javascript appliqué au Web](Web/Javascript.md)

### Hacks

* [Full height en HTML_CSS avec scrolling](Web/Full_height_en_HTML_CSS_avec_scrolling.md)

### Librairies

#### Validation de champs

* JOI.js

#### ORM: Object–relational mapping

* Prisma
* Entity Framework

## HTTP

* [Application Programming Interface (API)](Web/API.md)
* [En-Têtes (Headers)](Web/HTTP-Header.md)

## Frameworks

* React
* Vue.js
* [Next.js (React)](Web/React_Next.md)
* ExpressJS (BackEnd)

# Systèmes

## Windows

* [Changer la clé de produit de Windows XP sans réinstaller](Windows/Changer_la_cle_de_produit_Windows_XP_sans_reinstaller.md)
* [Déterminer la véritable taille d'un dossier](Windows/Determiner_la_veritable_taille_d_un_dossier.md)
* [Interdire l'utilisation d'une clé USB](Windows/Interdire_utilisation_une_cle_USB.md)

## Linux

### Conteneurs

* [Linux Containers (LCX)](Linux/LCX.md)
* [Gestionnaire de conteneurs (Docker)](Linux/Docker.md)
* [Arborescence des dossiers](Linux/Arborescence.md)

## Android

## iOS

## MacOS

# Desktop

## Framework

* React Native (Javascript pour Android, iOS)
* Flutter (Dart pour Android, iOS, Windows, Linux, MacOS)
* .Net MAUI (CLR pour Windows, Android, iOS, MacOS)
* Qt (C++ pour Windows, Linux, MacOS, Android, iOS, ...)

# Electronique

## Electricité

### Connaissances

* Courant Alternatif et courant Continu

## Montage

### Relais

## Arduino

* [Débricker l'arduino Nano ESP32](Arduino/Debricker_arduino_Nano_ESP32.md)

# Automatisme

## Concepts

* Grafcet

# Intelligence Artificielle

## Infrastructure / Orchestration IA

- [Model Context Protocol (MCP)](IA/IA-MCP.md)
- APIs
- Agents IA
- Tool calling
- RAG
- Vector databases

## Machine Learning

### Régression (Prédire une Valeur)

#### Régression Linéaire

##### Concept

* [Prédiction par régression linéaire](IA/MachineLearning/RegressionLineaire.md)
* Préparation des données

##### Evaluation

* [MSE](IA/MachineLearning/MSE.md)
* [RMSE](IA/MachineLearning/RMSE.md)
* [MAE](IA/MachineLearning/MAE.md)
* [MAPE](IA/MachineLearning/MAPE.md)
* [R²](IA/MachineLearning/R2.md)

#### Régression Polynomiale

##### Concept

* [Prédiction par régression polynomiale](IA/MachineLearning/RegressionPolynomiale.md)
* Préparation des données

##### Evaluation

* [MSE](IA/MachineLearning/MSE.md)
* [RMSE](IA/MachineLearning/RMSE.md)
* [MAE](IA/MachineLearning/MAE.md)
* [MAPE](IA/MachineLearning/MAPE.md)
* [R²](IA/MachineLearning/R2.md)

#### Réseau de neurones (MLP)

### Classification (Prédire une Catégorie)

#### Régression Logistique

##### Concept

* [Prédiction par régression logistique](IA/MachineLearning/RegressionLogistique.md)
* Préparation des données

##### Evaluation

* ROC
* AUC

#### Random Forest

##### Concept

* Prédiction par arbre aléatoire
* Préparation des données

##### Evaluation

* ROC
* AUC

#### Arbres de décision

#### SVM

#### Deep Learning

### Vision (Analyser une image)

#### Transformateur de vision (ViT)

#### Réseaux de neurones convolutifs (CNN)

### Non-Supervisé (Découvrir, Regrouper, Réduire)

#### Partitionnement (K-Means)

##### Concept

* [Regroupement par partitionnement](IA/MachineLearning/KMean.md)

#### Analyse en composantes principales (PCA)

#### Auto-Encodeurs (Autoencoders)

### Génératif (Créer des données)

#### Réseau génératif (GAN)

#### Modèles de diffusion (Diffusion Models)

### Texte / Langage (Séquences)

#### RNN / LSTM / GRU

#### Large Langage Model (Transformer)

##### Modèles

* [Mistral](IA/IA-Mistral.md)

##### Outils

* Huggingface

##### Protocoles

* [Model Context Protocol (MCP)](IA/IA-MCP.md)

# Mathématiques

## Statistiques

* Régression linéaire
