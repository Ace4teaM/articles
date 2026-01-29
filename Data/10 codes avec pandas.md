```
import pandas as pd
```

## ⚡ Explications rapides :

1. **`pd.DataFrame({...})`** → créer un tableau
2. **`.head()`** → voir les premières lignes
3. **`df["col"]`** → sélectionner une colonne (Series)
4. **`df[["col1","col2"]]`** → sélectionner plusieurs colonnes
5. **`df[condition]`** → filtrer les lignes
6. **`df["new_col"] = ...`** → ajouter une colonne calculée
7. **`groupby("col")["col2"].sum()`** → agrégation par groupe
8. **`sort_values("col")`** → trier
9. **`fillna()`** → gérer les valeurs manquantes
10. **`describe()`** → résumé statistique rapide



# 1️⃣ Créer un DataFrame
```python
df = pd.DataFrame({"ville": ["PARIS","LYON","MARSEILLE"], "benefices": [100, 80, 50], "revenu": [1000, 900, 700]})
```



# 2️⃣ Voir les premières lignes
```python
print(df.head())
```



# 3️⃣ Sélectionner une colonne
```python
print(df["ville"])
```



# 4️⃣ Sélectionner plusieurs colonnes
```python
print(df[["ville", "revenu"]])
```



# 5️⃣ Filtrer des lignes
```python
print(df[df["revenu"] > 800])
```



# 6️⃣ Ajouter une nouvelle colonne
```python
df["ratio"] = df["benefices"] / df["revenu"]
```



# 7️⃣ Agréger des données (somme par ville)
```python
print(df.groupby("ville")["benefices"].sum())
```



# 8️⃣ Trier les données
```python
print(df.sort_values("revenu", ascending=False))
```



# 9️⃣ Remplacer les valeurs manquantes
```python
df["benefices"].fillna(0, inplace=True)
```



# 🔟 Résumé statistique
```python
print(df.describe())
```

