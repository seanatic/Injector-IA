# DISCOURS ADEME - BINDING INJECTOR

## FOCUS SLIDE DEMO

Regardons brievement un schéma de présentation de la démonstration.

Les développements sur cette partie sont toujours en cours, et dans le but de ne pas impacter la démonstration du flot de données présentées par IoT et Thalos, j’ai décidé de faire tourner notre binding INJECTOR, sur le PC CLOUD, en parallèle de la démonstration des bindings REDIS et CLOUD-PUBLICATION.

Dans notre démonstration nous allons donc lire un fichier CSV et le mettre en forme d'objet JSON pour ensuite les transmettre à la base de données REDIS par l'intermédiaire du binding REDIS, tous les deux exécutés dans un conténeur. 

---

## FOCUS FICHIER CSV

Pour commencer cette présentation de la partie simulation de navire,

Partons du fichier csv appelé NOMINALS visible à l'écran.

Nous avons extrait les données du simulateur ERS, et dans le cas d’étude présenté aujourd’hui, 
    il s’agit de données issues d’une session de mesures nominales du DIESEL GENERATOR.
	- Sur la première ligne nous observons les labels ERS, autrement dit les noms des variables supervisée dans le logiciel
	- Sur la seconde ligne leur unité associée
	- Sur les lignes suivantes sont représenté les mesures effectuées à intervalles réguliers

Prenons l’exemple des deux variables notés N03100 et E03102,
    et regardons dans la documentation du simulateur à quoi elles correspondent.

Il s’agit de la vitesse de rotation du DG, exprimée en rpm, ainsi que la puissance transmise par ce dernier exprimée en kW.

---

## FOCUS TERMINAUX

Passons maintenant à la démonstration du binding INJECTOR.

J’ai donc ouvert trois terminaux sur le PC CLOUD :
-	Le premier va nous permettre de lancer notre binding avec la commande INJECT_NOMINALS
-	Le second va exécuter le binder et faire appel au binding REDIS présent dans un conteneur nommé RP-CLOUD-PUB-DEVEL
-	Enfin le troisième terminal est un prompt dans le conteneur qui va nous permettre de lancer le journalctl du binding redis et ainsi voir tous les événements liés au binding redis.

Lançons la commande journalctl
Lançons le binder avec notre binding INJECTOR et le binding REDIS
Lançons enfin la commande pour injecter des données dans la base à partir des CSV obtenus par ERS.

Notons que des requêtes sont reçues et traitées par le binder.

Nous pouvons aussi regarder les événements liés au binding REDIS dans le terminal du conteneur.

Je vais maintenant couper le serveur pour reprendre la main, puisque mes développements utilisent aujourd’hui des requêtes synchrones. Et nous allons confirmer que les données envoyées par le binding INJECTOR sont bien présents dans la base.

Accèdons à ces données à travers les commandes du binding REDIS. Il me faut pour cela relancer le binder.
J’effectue les deux requêtes pour lire les données N03001 et E03002 dans la base, et nous obtenons donc le résultat des commandes à l'écran.

--- 

## CONCLUSION

Nous venons de voir un outil qui nous permet de jouer des signatures numériques nominales et non-nominales sur notre banc de test, et qui nous permettra, dans la suite du projet, d’éprouver notamment les algorithmes de détection de panne et d'alimenter virtuellement les interfaces utilisateurs.
