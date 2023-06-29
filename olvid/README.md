# Déployer KeyCloak avec le plugin Olvid en local
## Pré-installation
- Installer le [Docker Engine](https://docs.docker.com/engine/install/)
- Pour accéder au service au travers du reverse proxy, il faudra ajouter cette ligne dans le fichier `hosts` de votre machine:
```bash
    0.0.0.0 keycloak.local.lan
```

## Installation
Pour lancer les services, il faudra se place à la racine du dossier `olvid` (où se trouve le fichier `docker-compose.yml`), puis exécuter la commande:
```bash
    docker-compose up 
```

Cela aura pour effet de télécharger les images nécessaires et de build le `Dockerfile` de Keycloak.

## Post-installation
- Pour accéder à la console de Keycloak, il faudra se rendre à l'adresse `http://keycloak.local.lan` dans un navigateur web.
- Les identifiants nécessaires à la connexion sont renseignés dans le fichier `docker-compose.yml`, il s'agit des variables d'environnements `KEYCLOAK_ADMIN` et `KEYCLOAK_ADMIN_PASSWORD`.

## Configuration
- Les fichiers de configurations respective de chaque service se trouvent dans le dossier `/conf`.
- Le scripts d'init de la base de donnée ainsi que les données se trouvent dans le dossier `/database`.
- Le binaire du bundle Keycloak+Olvid sera télécharger directement pendant le build du `Dockerfile`. 
    >[Ici](https://www.olvid.io/keycloak/installation/) le lien vers le site de Olvid pour vérifier la version et le hash.