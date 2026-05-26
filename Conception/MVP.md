# MVP "Modèle Vue Présentateur"

MVP est particulièrement adapté aux applications avec interface utilisateur basé sur les événements (clic, défilement, saisie, ...). Le programme s'abonne aux événements et appelle les méthodes du contrôleur.

* Le modèle contient les structures de données et la logique métiers

* La vue définit l'interface est expose dans une interface ses événements et données

* Le présentateur récupère les données, met à jour la vue et réagit aux événements



# Différence clé avec MVVM

| MVVM                  | MVP                                  |
| --------------------- | ------------------------------------ |
| Binding automatique   | Pas de binding intelligent           |
| ViewModel passif      | Presenter pilote activement          |
| Très utilisé WPF/MAUI | Très utilisé WinForms/Android ancien |
| DataBinding central   | Events/interfaces centraux           |
