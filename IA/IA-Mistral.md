# Mistral IA



## Capacités et limites de l'API Mistral

### Experiment (Gratuit)

Accès gratuit. Les requêtes API peuvent être utilisées pour améliorer nos services.

-  Accès aux modèles d'IA de pointe
-  Créer et déployer des agents
-  Commencez à expérimenter rapidement

> En choisissant le plan Experiment, vous acceptez que vos requêtes  anonymisées puissent être utilisées à des fins de recherche et vous  acceptez les [Conditions d'utilisation](https://mistral.ai/terms/#terms-of-service-la-plateforme) et la [Politique de confidentialité](https://mistral.ai/terms/#privacy-policy) de Mistral AI.

**Nous proposons deux types de limites de débit :**

- Requêtes par seconde (RPS)

- Jetons par minute/mois


**Points importants :**

- Les limites de débit sont définies au niveau de l’espace de travail.

- Elles sont définies par niveau d’utilisation, chaque niveau étant associé à des limites de débit spécifiques.

- Si vous souhaitez augmenter vos limites d’utilisation, n’hésitez pas à nous contacter via le bouton d’assistance en précisant votre cas d’utilisation.

### Scale (Payant)

Payez pour ce que vous utilisez. Facturé mensuellement ou prélevé sur vos crédits.

-  Paiement à l'utilisation ; voir les prix
-  Accès aux modèles de pointe
-  Accès à la création et au déploiement d'agents
-  Accès à l'API de réglage fin
-  Max. 6 requêtes par seconde, évolutif selon les besoins
-  Max. 2M tokens d'entrée par minute, extensible sur demande
-  Max. 10B tokens d'entrée par mois, extensible sur demande
-  20M jetons par minute, et 200M jetons par mois pour Mistral Embed
-  Accès à toutes les fonctionnalités, y compris les fonctionnalités de prévisualisation et bêta
-  Les requêtes API ne sont pas utilisées pour entraîner nos modèles

## Appels vers une API de LLM.

### 1. **Paramètres de base**

- **`name`** : Nom de l'agent (ex: `"Agent_Support_Technique"`).
- **`description`** : Description du rôle de l'agent (pour les humains).

- **`model`** : Le modèle de langage sous-jacent (ex: `"mistral-small-latest"`, `"mistral-large-latest"`).

------

### **2. Paramètres du modèle (inference)**

Ces paramètres contrôlent **comment le modèle génère ses réponses** :

- **`temperature`** (0.0 → 2.0) :
  - **Faible (0.1-0.3)** : Réponses plus déterministes et répétables (idéal pour du code ou des réponses factuelles).
  - **Élevée (0.7-1.0)** : Réponses plus créatives et variées (idéal pour du brainstorming ou du texte libre).
  - *Exemple* : `0.3` pour un agent technique, `0.8` pour un agent créatif.
- **`max_tokens`** :
  - Nombre maximal de tokens (mots/sub-mots) dans la réponse.
  - *Exemple* : `500` pour des réponses courtes, `2000` pour des réponses détaillées.
- **`top_p`** (0.0 → 1.0) :
  - Contrôle la diversité des réponses en sélectionnant les tokens les plus probables jusqu'à atteindre une somme de probabilité `p`.
  - *Exemple* : `0.9` pour un bon équilibre entre diversité et pertinence.
- **`top_k`** :
  - Limite le nombre de tokens considérés à chaque étape (ex: `top_k=50`).
  - Souvent utilisé avec `top_p`.
- **`stop_sequences`** :
  - Liste de mots/phrases qui arrêtent la génération (ex: `["\n\n", "Fin."]`).

------

### **3. Paramètres de contexte**

- **`system_prompt`** :
  - Instructions permanentes pour le modèle (ex: *"Tu es un expert en Python. Réponds toujours avec des exemples de code."*).
- **`user_message`** :
  - Le message de l'utilisateur (input dynamique).
- **`history`** :
  - Historique de la conversation pour maintenir le contexte.

------

### **4. Paramètres des outils**

- **`tools`** :
  - Liste des outils activés pour l'agent (ex: `["web_search", "code_interpreter", "database_query"]`).
- **`tool_choice`** :
  - Mode de sélection des outils (`"auto"` ou `"none"`).

------

### **5. Paramètres de sécurité et d'accès**

- **`api_key`** :
  - Clé d'authentification pour les requêtes API.
- **`permissions`** :
  - Qui peut utiliser/modifier l'agent (ex: `["team:dev", "team:support"]`).
- **`rate_limits`** :
  - Limites de requêtes (ex: `100 requêtes/minute`).

------

### **6. Paramètres d'intégration**

- **`endpoint`** :
  - URL pour appeler l'agent via API (ex: `/api/v1/agents/mon_agent`).
- **`webhook`** :
  - URL de rappel pour les notifications ou déclencheurs.

------

### **7. Paramètres avancés**

- **`seed`** :
  - Valeur pour la reproductibilité des réponses (ex: `42`).
- **`logprobs`** :
  - Active le retour des probabilités des tokens (utile pour le débogage).
- **`stream`** :
  - Active le streaming des réponses (ex: `true` pour un chat en temps réel).

## Approche d'une simple de prompt