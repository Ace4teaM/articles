# Clean Architecture

Clean Architecture résous un problème qui apparait quand: **Le métier dépend de** la base de données, de l’UI, du framework ou d’Internet.

La Clean Architecture inverse cela avec une règle simple : **Les dépendances doivent pointer vers le métier.**

Le cœur métier :

- ne connaît pas la base SQL,
- ne connaît pas le framework web,
- ne connaît pas l’UI,
- ne connaît pas le moteur graphique.



Donc il s'agit d'une architecture en couche:

1. Frameworks: UI, DB, Web, API
2. Adaptateurs d'interface: Contrôleur, Présentateur, "Adapte le monde extérieur vers le métier"
3. Cas d'utilisations: Actions
4. Entités : Données et règles métiers



# Quand utiliser ?

Le métier peut fonctionner :

- sans base réelle,
- sans UI,
- sans framework.

Donc :

- tests très faciles,
- remplacement technologie facile.



# La règle

Le métier définit les interfaces :

```
public interface IUserRepository
{
    User GetById(int id);
}
```

Puis l’infrastructure implémente :

```
public class SqlUserRepository : IUserRepository
{
	...
}
```



# Exemple

> Controller -> UseCase -> IRepository -> SQLRepository
