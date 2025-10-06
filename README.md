# Render-dyad

Ce repository permet de déployer gratuitement le projet [dyad](https://github.com/iaautomatalex/dyad) sur Render.com, une plateforme d’hébergement cloud gratuite, avec une base de données Postgres.

## Déploiement rapide

1. Fork ce repository sur ton propre compte GitHub.
2. Sur [Render.com](https://render.com), crée un nouveau service Web, choisis "Deploy from a GitHub repo", et sélectionne ce repo.
3. Render va automatiquement créer la base de données Postgres et connecter l’application grâce au fichier `render.yaml`.
4. Rends-toi dans les paramètres Render, renseigne les variables d’environnement si besoin (voir la doc de dyad).
5. Clique sur "Deploy".

## Personnalisation

- Le Dockerfile installe les dépendances et lance dyad.
- Modifie la commande de lancement dans le Dockerfile si nécessaire (`CMD`).
- Le fichier `render.yaml` gère la base de données Postgres gratuite et configure les variables d’environnement.

## Liens utiles

- [dyad sur GitHub](https://github.com/iaautomatalex/dyad)
- [Render.com](https://render.com)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/iaautomatalex/Render-dyad)
