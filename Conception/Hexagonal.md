# Hexagonal Architecture

Le cœur de l'application ne doit dépendre d’aucune technologie externe.

Donc :

- pas de dépendance directe à la base de données
- pas de dépendance à l’UI
- pas de dépendance à un framework

Tout passe par des **ports (interfaces)**.



## Le cœur (Core / Domain)

C’est la logique métier pure :

- règles métier
- entités
- use cases

## Les Ports

Un **port = une interface**

Il définit *ce dont le métier a besoin*.

Exemple :

```c#
public interface IUserRepository
{
    User GetById(int id);
}
```

## Les Adapters

Les adapters implémentent les ports.

Exemple :

```c#
public class SqlUserRepository : IUserRepository
{
    public User GetById(int id)
    {
        // SQL / Entity Framework / etc.
    }
}
```

# Quand utiliser ?

**Très testable**

Tu peux tester sans :

- base de données
- API
- UI

```
var useCase = new GetUserUseCase(new FakeRepo());
```

**Très découplé**

Tu peux remplacer :

- SQL → MongoDB
- API → mock
- UI → web / desktop

sans toucher au cœur.

**Très évolutif**

Ajout facile de :

- nouvelle UI (mobile + web)
- nouvelles bases de données
- microservices



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

> UI -> Controller -> UseCase -> Port -> Adapter -> DB
