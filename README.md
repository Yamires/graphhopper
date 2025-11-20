# Rapport tâche 2 - IFT3913A25 - Poldo Silva et Costarella-Serra 

## Nouveaux tests 

1. [testSetAndGetDistanceInfluence()](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/CustomModelTest.java#L94-L107)

    **Intention :** 
    Vérifier que la valeur de distanceInfluence est correctement enregistrée et récupérée

    **Motivation des données de test :**
    - ***null :*** Confirme qu'aucune valeur n'est définie initialement.
    - ***2.5, 4.0, 6.5:*** Valeurs arbitraires, mais distinctes, utilisés pour tester l'enregistrement, la modification et la lecture cohérente des valeurs.
   
   **Oracle :** 
   - `getDistanceInfluence()` retourne null par défaut.
   - Après appel à `setDistanceInfluence()`, `getDistanceInfluence()` retourne la valeur donnée.
   
2. [testReadValidArgs()](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/PMapTest.java#L100-L105)

   **Intention du test :**
    - Vérifier que `read()` interprète correctement un tableau de chaînes "clé=valeur" et stocke les paires dans la map avec le type adéquat.

    **Motivation des données de test choisies :**
    - Deux clés ("foo" et "bar") sont utilisées avec des entiers en valeur pour représenter un cas d’utilisation classique.
    
    **Explication de l'oracle :**
    - Après parsing, la clé "foo" doit renvoyer 1 et la clé "bar" doit renvoyer 2 via `getInt()`. L’oracle consiste à comparer ces résultats avec les valeurs attendues.

3. [testReadDuplicateKeyThrows](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/PMapTest.java#L120-L123)

    **Intention du test :**
    - Vérifier que `read()` rejette correctement un tableau d’arguments contenant une clé dupliquée.
   
    **Motivation des données de test :**
    - On fournit deux entrées "foo=1" et "foo=2". Cela simule un scénario où un utilisateur fournit une même clé deux fois avec des valeurs différentes, ce qui doit être interdit.
   
    **Oracle :**
    - Le code de `read()` lève une `IllegalArgumentException` lorsqu’une clé est ajoutée en double. L’oracle est la vérification que cette exception est bien levée.
      
4. [testGetBool](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/PMapTest.java#L142-L149)

    **Intention du test :**
    - Vérifier que `getBool()` retourne la valeur stockée lorsqu’elle existe, et qu’il renvoie la valeur par défaut  lorsque la clé est absente.
   
    **Motivation des données de test :**
    - La clé "flag" est insérée avec la valeur ***true*** pour tester la récupération d’un booléen existant.
    - On utilise ensuite une clé ("missing") pour vérifier que la valeur par défaut est utilisée, une fois avec ***false***, une fois avec ***true***.
   
    **Oracle :**
    - L’oracle valide que la valeur retournée par getBool() correspond à la valeur associée à la clé, ou à la valeur par défaut si la clé n’existe pas.
5. [testEmptyString()](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/HelperTest.java#L147-L151)
   
    **Intention du test :**
    -  Vérifier que la méthode `parseList()` retourne une liste vide lorsqu’elle reçoit en entrée une chaîne de caractères vide.
     
   **Motivation des données :**
   - S’assurer que la méthode `parseList()` est robuste face à un cas limite (entrée vide) et qu’elle ne provoque pas d’erreurs d’exécution. 
   
   - **Oracle du test :** 
   - Pour une chaîne vide en entrée, la méthode doit retourner une liste vide.

6. [testNormalList()](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/HelperTest.java#L170-L178)
    **Intention du test :**
    - Vérifier que la méthode `parseList()` est capable de parser correctement une chaîne représentant une liste et de restituer tous les éléments dans l’ordre attendu.
      
   **Motivation des données :**
    - S’assurer que la méthode `parseList()` identifie correctement chaque élément d’une liste non vide, en conservant à la fois la taille exacte et l’ordre des éléments.
     
   **Oracle :**
   - L’oracle confirme que, pour l’entrée `[benoit, meryem, yogya]`, le résultat attendu est une liste ordonnée de taille 3, où `élément[0] = "benoit"`, `élément[1] = "meryem"` et `élément[2] = "yogya"`.       

7. [testListWithEmptyElements()](https://github.com/Jinxyyyyy/graphhopper/blob/master/web-api/src/test/java/com/graphhopper/util/HelperTest.java#L197-L205)
   **Intention :**
    - Vérifier que la méthode `parseList()` est capable d’ignorer correctement les éléments vides lorsqu’elle parse une chaîne représentant une liste.
     
   **Motivation des données :**
   - S’assurer que la méthode`parseList()` gère de manière robuste la présence d’éléments vides, afin d’éviter des erreurs d’exécution ou un comportement inattendu.
   
   **Oracle du test :**
   - L’oracle confirme que, pour l’entrée `[benoit, , yogya, , ]`, le résultat attendu est une liste ordonnée de taille 2, où élément[0] = "benoit" et élément[1] = "yogya".

## Score de mutation 

### com.graphhopper.util.PMap 
**Avant ajout de 3 tests** 
- Line coverage 36% (21/59) 
- Mutation coverage 34% (13/38)
- Test Strength 87% (12/15)

**Après ajout de 3 tests**
- Line coverage 68% (40/59)
- Mutation coverage 58% (22/38)
- Test Strength 88% (22/25)

#### Analyse
On observe une forte augmentation de la couverture des mutants passant de 34% à 58%, avec 9 mutants supplémentaires détectés. Cette amélioration s'explique une meilleure couverture de deux méthodes non testées : `getBool()` et `read()`. 
 
**Nouveaux mutants détectés :**

    `L71#2 negated conditional -> NO_CONVERAGE` ---> `KILLED`
    `L76#1 negated conditional -> NO_CONVERAGE` ---> `KILLED`
    `L80#1 negated conditional -> NO_CONVERAGE` ---> `KILLED`
    `L84#1 Replaced integer addition with substraction -> NO_CONVERAGE` ---> `KILLED`
    `L86#1 negated conditional -> NO_CONVERAGE` ---> `KILLED`
    `L90#1 replaced return value for null for read() ---> `KILLED`
    `L108#1 replaced boolean return with true for getBool() -> NO_CONVERAGE` ---> `KILLED`
    `L108#2 negated conditional -> NO_CONVERAGE` ---> `KILLED`
    `L108#1 replaced boolean return with false for getBool() -> NO_CONVERAGE` ---> `KILLED`

- `getBool()` : 
    Avant l'ajout des tests, cette méthode n'était pas couverte, ce qui empêchait la détection de 3 mutants. 
    Les nouveaux tests ajoutés augmentent la couverture de code sur cette méthode, permettant aux mutants d'être détectés et tués. 
- `read()`:
    Avant l'ajout des tests, cette méthode n'était pas couverte, ce qui empêchait la détection de 6 mutants.
    Les nouveaux tests ajoutés augmentent la couverture de code sur cette méthode, permettant aux mutants d'être détectés et tués.

En résumé, l'ajout de 3 tests augmente significativement la couverture du code et le score du de mutation.

### com.graphhopper.util.CustomModel
**Avant ajout de 1 test**
- Line coverage 53% (39/74)
- Mutation coverage 24% (8/33)
- Test Strength 50% (8/16)

**Après ajout de 1 test**
- Line coverage 55% (41/74)
- Mutation coverage 30% (10/33)
- Test Strength 88% (10/17)

#### Analyse
On observe une augmentation du score de mutation, passant de 8/33 à 10/33, soit 2 mutants supplémentaires détectés. 
Cela est dû principalement de la couverture deux 2 méthodes (`setDistanceInfluence()` et `getDistanceInfluence()`) non couvertes auparavant. 

**Nouveaux mutants détectés :**

    `L141#1 replaced value with null for setDistanceInfluence() -> NO_CONVERAGE` ---> `KILLED`
    `L145#1 replaced Double return value with 0 for getDistanceInfluence() -> SURVIVED Covering tests` ---> `KILLED`

- `setDistanceInfluence()` :
    Avant l'ajout des tests, cette méthode n'était pas couverte, ce qui empêchait la détection ce mutant.
    Le nouveau test execute la méthode et valide son comportement, ce qui a permis de tuer le mutant. 
- `getDistanceInfluence()` :
    Les tests n'évaluaient pas la valeur de retour, laissant le mutant survivre. 
    Le nouveau test ajoute une assertion sur la valeur retournée, validant le comportement et tuant le mutant. 

En résumé, l'ajout d'un test sur cette classe a permis d'améliorer la couverture de mutation. 

### com.graphhopper.util.Helper

**Avant ajout de 3 tests**
- Line coverage 27% (45/167)
- Mutation coverage 25% (43/173)
- Test Strength 88% (43/49)

**Après ajout de 3 tests**
- Line coverage 33% (55/167)
- Mutation coverage 27% (47/173)
- Test Strength 88% (47/54)

#### Analyse

On observe une augmentation du score de 2% avec 4 nouveaux mutants détectés et une hausse de 6% de la couverture des lignes. Cette amélioration s'explique principalement par la meilleure couverture de la méthode `parseList()`.
Cependant, la force de test reste stable à 88%, ce qui suggère que les cas nouveaux cas de test n'améliorent pas significativement la qualité du code.

Cela pourrait être dû au fait que les 3 nouveaux tests testent la meme fonction (`parseList()`) avec des assertions simples et du même type. Une amélioration possible est de tester plus de méthodes de la classe `Helper.java`, valider les exceptions et ajouter des tests paramétrés. 

**Nouveaux mutants détectés :**

    `L408#2 negated conditional → NO_COVERAGE` ---> `KILLED`
    `L410#1 Replaced integer subtraction with addition -> NO_COVERAGE` ---> `KILLED`
    `L414#1 negated conditional → NO_COVERAGE` ---> `KILLED`
    `L418#1 replaced return value with Collections.emptyList parseList() → NO_COVERAGE` ---> `KILLED`

On observe qu’avant l’introduction des trois nouveaux cas de test, quatre mutants liés à la méthode `parseList()` n’étaient pas tués. Cela s’explique simplement par le fait que les tests initiaux ne couvraient pas correctement cette méthode.

En bref, l'augmentation du score de mutation et la couverture des lignes n'implique pas toujours l'augmentation de la force de test. 

## Justification Java Faker 

[testRandomBearingsWithFaker()](https://github.com/Jinxyyyyy/graphhopper/blob/master/navigation/src/test/java/com/graphhopper/navigation/NavigateResourceTest.java#L52-L75)

Le test `testRandomBearingsWithFaker()` a pour objectif de vérifier le bon fonctionnement d’une méthode qui traite des angles représentés sous forme de chaînes de caractères. L’idée principale est de s’assurer que la méthode peut correctement extraire et manipuler des valeurs provenant d’entrées variées, même lorsque celles-ci sont générées aléatoirement.

Pour cela, nous utilisons **Java Faker**, une bibliothèque qui permet de générer des nombres aléatoires. Chaque valeur aléatoire est combinée pour former une chaîne représentant **deux angles séparés par une virgule**. Cette approche simule des entrées réalistes mais variables, afin de tester la robustesse de la méthode dans différentes situations.

L’importance de ce test est en sa capacité à **détecter des erreurs de parsing ou de traitement des données**. Le test vérifie que, pour chaque chaîne générée, le premier angle est correctement identifié et stocké dans la liste des résultats. Si la méthode échoue à extraire la bonne valeur, le test échoue.

Cette stratégie permet donc de tester de manière **dynamique et répétable** la méthode sur un large éventail de données possibles, ce qui est beaucoup plus efficace que de coder manuellement chaque scénario. Elle garantit que la méthode reste fiable même lorsque les valeurs d’entrée changent, ce qui est crucial pour tout système qui doit traiter des données variées provenant de différentes sources.

En résumé, le test `testRandomBearingsWithFaker()` valide que la méthode gère correctement des entrées multiples, aléatoires et variées, tout en assurant que le comportement attendu, l’extraction correcte du premier angle, est toujours respecté.


critère	description
Github action (GA) (25%)	l'action échoue si le score de mutation est plus bas que sur la dernière exécution de l'action
documentation GA (25%)	les modifications apportées à l'action ainsi que la validation des modifications sont documentées et justifiées;
mocks (20%)	2 classes sont simulées avec des mocks et les tests sont adaptés pour utiliser ces mocks
documentation mocks (20%)	le choix des classes, la définition des mocks, les changements dans les tests sont documentés et justifiés
humour (10%)	rickroll dans le CI


## Conception des Github Actions

L’objectif du projet est de mettre en place, au sein de GitHub Actions, un mécanisme automatique capable de faire échouer un build dès qu’une régression du score de mutation est détectée. Pour y parvenir, plusieurs éléments sont nécessaires : un score de mutation de référence (issu du build précédent), le score de mutation obtenu lors du build courant, et une méthode fiable permettant de comparer ces deux valeurs.

Nous avons choisi de récupérer, pour chaque module testable du projet, le score de mutation global. Une approche plus fine, par exemple récupérer un score de mutation pour chaque classe, aurait été possible, mais elle alourdirait considérablement la suite du pipeline et complexifierait l’analyse. À l’inverse, une approche moins granulaire consistant à calculer un score global unique pour l’ensemble de GraphHopper fournirait trop peu d’informations en cas d’échec du build, rendant le diagnostic difficile pour l’utilisateur.
Ainsi, la granularité par module représente un bon compromis : elle reste suffisamment simple à implémenter tout en offrant une information pertinente et exploitable lorsque le build échoue.

Le flux d'exécution du workflows est le suivant: 
### 1 Récupération des scores de mutation du build précédent
[lien vers l'action]
Avant d'exécuter les tests de mutations sur le build courant, le workflow tente de récupérer les scores de mutations des builds précédents. 
Le script `download-pit-scores.sh` [lien vers le script] effectue les actions suivantes:
1- Le script interroge GitHub pour récupérer les runs précédents
\```bash
gh run list \
  --workflow="$WORKFLOW" \
  --branch="$BRANCH" \
  --status=success \
  --limit="$LIMIT"
\```
2- Pour chaque run trouvé, on télécharge l'artificat **pit-scores-baselines**. Lorsqu'un artifact est trouvé, il est téléchargé dans le répertoire courant. Le script s'arrêt dès qu'il trouve un run contenant les scores. 
3- Deux cas sont possibles 
    1- Des scores ont été trouvés: On a une baseline pour comparaison.
    2- Aucun score trouvé: C'est le premier run, on set la baseline pour le prochain build. 

### 2 Exécution des tests de mutation sur le build courant
lien vers l'action
Après la compilation et l'exécution des tests unitaires, le workflow lance les tests de mutation avec **PITEST**. Le script `run-pit-test.sh` contient la logique d'execution. 
Il y a 2 points importants dans la logique d'exécution. 
1- Les modules CORE et READER-GTFS sont exclus. Les tests de mutations n'achèvent jamais, possiblement à cause de boucles infinis. 
2- Les paramètres `-DreportsDirectory=target/pit-reports -DoutputFormats=XML,HTML` permettent de générer un rapport dans les répertoires `target/pit-reports/mutations.xml`et `target/pit-reports/index.html`. `mutations.xml`sera nécessaire pour évaluer la régression des scores de mutations. 

### 3 Verification de la régression de mutation
lien vers l'action
Le script `check-mutation-regression.sh` effectue les actions suivantes: 
1- Récupère pour chaque module testé, un fichier `mutations.xml`
2- Calcule le score de mutation par module **(coverage = (mutations tués / mutants totaux) x 100)**
3- Pour chaque module, le score courant est comparé au score précédent sauvegardé dans `pit-score-<module>.txt`.
4- Un statut est attribué selon 3 cas, **Improved**, **Unchanged** ou **Regression**
5- En cas de **Regression**, `failed=true`.
6- Les scores sont ajoutés dans un rapport `mutation-report.md`
7- Les scores de références sont mises-à-jour et enregistrés dans `pit-score-<module>.txt`
8- Si `failed=true`, l'action échoue automatiquement si au moins un module a vu son score baisser.  

### 4 Enregistrement et archivage des scores et rapport
Que le build soit un succès ou un échec, les données sont sauvegardés sous forme d'artifacts. 
1. lien vers Upload PIT scores baseline: On sauvegarde **toujours** tous les fichiers `pit-score-*.txt` et on le conserve 90 jours. 
2. lien vers Upload PIT reports: On sauvegarde **toujours** tous les fichiers dans `*/target/pit-reports/` et conserve 30 jours. Cela inclut `mutations.xml` et `ìndex.html`
3. lien vers archire test reports on failure: En cas **d'échec**, On sauvegarde tous les rapports Surefire et conserve 7 jours, pour faciliter le débogage. 


## Validation des modifications
Pour exécuter la validation, il est nécessaire de forcer une regression des scores de mutation. 
Dans un premier temps, il faut établir un run avec des scores de validation qui seront les scores de référence, donc on fait simplement push le code snas aucune modification. 
Dans un 2ième run, on va modifier le code sur des endroits que l'on sait que le score de mutation va descendre. Ces endroits ce sont les tests qu'on ajouté dans la tâche 2. On sait que l'ajout de ses tests fait augmenter le score de mutation, alors le retirer le fera descendre. 
Dans une 3ieme run, on veut valider que la méthode fonction globalement, donc, on va éliminer des tests au hasard dans tous les modules et observer la variation des scores.
