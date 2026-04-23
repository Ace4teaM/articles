# Python Environnement Virtuel

Les environnements virtuels sont très utiles pour faire cohabiter dans un dans un espace contrôlé un ensemble de packages avec des versions spécifiques.

Un environnement est nommé est peut être ciblé pour exécuter des scripts.

## Anaconda et Jupyter

**Conda** est un **gestionnaire de paquets et d'environnements** open source, principalement utilisé pour les langages Python et R, mais aussi pour d'autres langages et outils scientifiques. Il est particulièrement populaire dans les domaines de la **data science**, du **machine learning** et de la recherche, car il simplifie la gestion des dépendances et des environnements isolés.

Utiliser **Anaconda** pour créer un environnement virtuel avec **Jupyter** et installer les dépendances nécessaires pour l'API Mistral est très simple. Voici les étapes détaillées :

------

### **1. Installer Anaconda**

Si ce n'est pas déjà fait, télécharge et installe [Anaconda](https://www.anaconda.com/download) (choisis la version adaptée à ton système d'exploitation).

------

### **2. Ouvrir l'Anaconda Prompt**

- Sous Windows, cherche **Anaconda Prompt** dans le menu Démarrer.
- Sous macOS/Linux, ouvre un terminal classique (Anaconda est intégré au terminal après installation).

------

### **3. Créer un environnement virtuel avec Conda**

Dans l'Anaconda Prompt, exécute la commande suivante pour créer un nouvel environnement (par exemple, nommé `mistral_env`) :

```bash
conda create --name mistral_env python=3.10
```

*(Remplace `3.10` par la version de Python que tu souhaites utiliser.)*

------

### **4. Activer l'environnement**

- **Windows** :

  ```
  conda activate mistral_env
  ```

- **macOS/Linux** :

  ```
  source activate mistral_env
  ```

Ton terminal devrait maintenant afficher `(mistral_env)` en préfixe.

------

### **5. Installer Jupyter Notebook**

Avec l'environnement activé, installe Jupyter Notebook :

```
conda install notebook
```

------

### **6. Installer les dépendances pour l'API Mistral**

Installe les bibliothèques nécessaires, comme `requests` ou `mistralai` :

```
conda install requests
# ou
pip install mistralai
```

*(Si `mistralai` n'est pas disponible via Conda, utilise `pip`.)*

------

### **7. Lancer Jupyter Notebook**

Toujours dans l'environnement activé, lance Jupyter Notebook :

```
jupyter notebook
```

Un navigateur s'ouvrira automatiquement avec l'interface de Jupyter.   
