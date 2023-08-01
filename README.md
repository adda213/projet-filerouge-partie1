# projet-final DEVOPS: Partie 1 

ce répertoire représente la première partie du projet final chez EAZYTRAINING , il a été demandé dans l'énoncé du projet de containériser l'application ic-webapp , cette application est un site web vitrine qui permettre l'accès à nos application ODOO et PGADMIN que nous allons créer dans la 2eme partie de ce projet l’aide de Kubernêtes .


![site_vitrine](https://github.com/adda213/mini-projet-docker/assets/123883398/5ab02718-451e-44ce-b8e9-1692af0b2501)


------------
l'énoncé du projet : [here](https://github.com/sadofrazer/ic-webapp "here")

## création de l'image docker à l'aide de dockerfile 

il a été demander de créer cette image par définir les paramètres suivants dans le ***Dockerfile*** : 
- Image de base : `python:3.6-alpine`
- répertoire de travail : `/opt`
- les dépendances : `flask==1.1.2`
- le port : `8080`
- les variable d'environnement : `ODOO_URL`, `PGADMIN_URL`
- le `ENDPOINT`
  
le Dockerfile sera rédigé de cette façon :

```
{
FROM python:3.6-alpine
WORKDIR /opt
MAINTAINER POZOS
RUN apk update
RUN apk add git
RUN pip install flask==1.1.2
ENV ODOO_URL="https://www.odoo.com/" 
ENV PGADMIN_URL="https://www.pgadmin.org/"
EXPOSE 8080
RUN git clone https://github.com/sadofrazer/ic-webapp.git
ENTRYPOINT ["python", "ic-webapp/app.py"]
}
```

- la création de l'image avec la ligne de commande suivante dans le terminal :

```
docker build -t ic-webapp:1.0 .
```

- démarrer le conteneur qui contient l'application après la création de l'image 

```
docker run --name test-ic-webapp -d -p 80:8080 ic-webapp:1.0
```
- le surcharge des deux variables d'environnement déclaré dans le Docker file peut être fait par démarrer le conteneur avec la commande suivante :
```
docker run --name test-ic-webapp -d -p 80:8080 -e ODOO_URL= (site web de votre choix) PGADMIN_URL= (site web de votre choix) ic-webapp:1.0
```
- pour vérifier que le conteneur fonctionne correctement , tapez la commande `docker ps` pour vérifier l'état du conteneur : 
   
![image](https://github.com/adda213/projet-filerouge-partie1/assets/123883398/8b0ce02c-8daa-446f-a996-8deb1a38cf7f)

- tester le fonctionnement de l'application ,host API est indiqué sur 3: enp0s8 en utilisant la commande ` ip a;`

- supprimer le conteneur après le bon fonctionnement du test avec la commande suivante : 
```
docker ps  #pour récupérer ID du conteneur
docker rm <ID conteneur> 
```

FIN.


nom : KADDOUR BRAHIM
Prénom : Adda Zouaoui
Formation : Eazytrainning BOOTCAMP-12.
