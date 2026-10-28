# Apporter une solution à un problème métier



## Une méthode réutilisable pour tout problème métier

Pour aborder un problème avec une technologie IA, une démarche en six étapes est pertinente.

1. Définir le résultat attendu. Par exemple, réduire de 30 minutes à moins de 2 minutes le délai de détection d'un défaut d'archivage.
2. Observer le système. Recueillir les journaux, les métriques, les erreurs, les horodatages, les états des services et les événements OPC.
3. Rechercher les causes. Vérifier si le problème est déterministe, s'il suit des règles connues ou s'il présente des symptômes variables difficiles à interpréter.
4. Choisir la méthode la plus simple qui fonctionne. Règles, statistiques, apprentissage automatique, modèle de langage ou combinaison de ces techniques.
5. Tester sur des incidents historiques. Vérifier si la solution détecte les pannes, évite les fausses alertes et recommande des actions adaptées.
6. Déployer progressivement. Commencer par l'observation et les recommandations, puis autoriser uniquement les actions automatiques validées et maîtrisées.



# Exemple

Un service informatique subit occasionnellement des dysfonctionnements qui interrompent l’archivage des données. Une intervention manuelle est alors nécessaire pour redémarrer le service et vérifier que la communication avec le serveur OPC est toujours opérationnelle. Si la communication n’est pas rétablie, le serveur OPC doit également être redémarré. Ces opérations peuvent devoir être répétées, sur l’un ou les deux systèmes, jusqu’au rétablissement effectif de la communication et de l’archivage des données.

## Application à l'exemple du service et du serveur OPC

Une architecture réaliste pourrait être la suivante :

**Collecte des observations**

Logs, état du service, dernières données archivées, qualité OPC, latence

**Moteur de diagnostic**

Règles déterministes + éventuellement IA pour interpréter les symptômes

**Orchestrateur de remédiation**

Procédure contrôlée, temporisations, limites de tentatives, journalisation

**Vérification du rétablissement**

Communication OPC valide et archivage effectif, avec contrôle des éventuelles données manquantes

**Le moteur de diagnostic pourrait distinguer plusieurs situations :**

| Symptôme observé                                 | Première vérification                                        |
| ------------------------------------------------ | ------------------------------------------------------------ |
| Service arrêté                                   | Processus, code de sortie, événements système                |
| Service actif mais aucun nouvel archivage        | Blocage interne, stockage, file d'attente, erreurs d'écriture |
| Communication OPC interrompue                    | État de la session, réseau, serveur OPC, certificats ou délais d'attente |
| Service redémarré mais archivage toujours absent | Vérifier la cause persistante avant toute nouvelle tentative |
| Communication rétablie mais données manquantes   | Vérifier la reprise de l'acquisition et la complétude de l'historique |

Il ne faut pas conclure qu'un service est opérationnel uniquement parce que son processus existe. Le test pertinent est fonctionnel : une donnée attendue est-elle effectivement reçue et archivée ?

De même, relancer systématiquement les deux serveurs peut masquer la cause réelle et aggraver la situation. Il vaut mieux diagnostiquer avant d'agir, avec un nombre limité de tentatives et une escalade vers un opérateur si la reprise échoue.

## À quel moment l'IA devient-elle réellement intéressante ?

Dans cet exemple, trois questions permettent de le déterminer.

- Les causes sont-elles connues et répétitives ? Si oui, des règles et un automate suffisent probablement.
- Les journaux contiennent-ils des symptômes complexes, variables et difficiles à corréler ? Un modèle de langage peut aider à interpréter les erreurs et à rapprocher un incident d'incidents précédents.
- Dispose-t-on d'un historique suffisamment riche pour apprendre les signes avant-coureurs ? Si oui, un modèle statistique ou d'apprentissage automatique peut éventuellement détecter une dégradation avant la panne.

Il faut distinguer deux rôles de l'IA. Un modèle de langage peut aider à comprendre un incident et à formuler un diagnostic. Un modèle prédictif peut estimer qu'une panne devient plus probable à partir des mesures historiques. Ces deux fonctions peuvent être réunies, mais elles ne répondent pas au même besoin.

## Pour définir une première solution concrète

Il reste surtout à préciser la nature des symptômes et les données disponibles. La question la plus utile pour commencer est la suivante :

Dispose-t-on déjà de journaux d'erreurs et de traces horodatées des incidents, ou faut-il d'abord instrumenter le service et la communication OPC pour recueillir ces informations ?