# Command Query Responsibility Segregation

C’est un pattern d’architecture qui consiste à **séparer complètement les opérations de lecture et d’écriture** dans une application.

Au lieu d’avoir un seul modèle qui fait tout :

```
CRUD classique :
- Create
- Read
- Update
- Delete
```

## Commands (écriture)

Tout ce qui modifie l’état

- CreateUser
- UpdateOrder
- DeleteProduct

Ne retourne pas de données métier (souvent juste succès/échec)

```c#
public class CreateUserCommand
{
    public string Name { get; set; }
}
```

## Queries (lecture)

Tout ce qui lit des données

- GetUserById
- GetAllProducts

Ne modifie jamais l’état

```c#
public class GetUserByIdQuery
{
    public int Id { get; set; }
}
```

## Pourquoi séparer ?

Parce que lecture et écriture n’ont PAS les mêmes besoins

| Lecture (Query)     | Écriture (Command) |
| ------------------- | ------------------ |
| rapide              | validée            |
| optimisée affichage | logique métier     |
| dénormalisée        | normalisée         |
| cacheable           | transactionnelle   |
