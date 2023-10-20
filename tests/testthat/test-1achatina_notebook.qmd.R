# Vérifications de achatina_notebook.qmd
acha <- parse_rmd("../../achatina_notebook.qmd",
  allow_incomplete = TRUE, parse_yaml = TRUE)

test_that("Le bloc-notes est-il compilé en un fichier final HTML ?", {
  expect_true(is_rendered("achatina_notebook.qmd"))
  # La version compilée HTML du carnet de notes est introuvable
  # Vous devez créer un rendu de votre bloc-notes Quarto (bouton 'Rendu')
  # Vérifiez aussi que ce rendu se réalise sans erreur, sinon, lisez le message
  # qui s'affiche dans l'onglet 'Travaux' et corrigez ce qui ne va pas dans
  # votre document avant de réaliser à nouveau un rendu HTML.
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.
  
  expect_true(is_rendered_current("achatina_notebook.qmd"))
  # La version compilée HTML du document Quarto existe, mais elle est ancienne
  # Vous avez modifié le document Quarto après avoir réalisé le rendu.
  # La version finale HTML n'est sans doute pas à jour. Recompilez la dernière
  # version de votre bloc-notes en cliquant sur le bouton 'Rendu' et vérifiez
  # que la conversion se fait sans erreur. Sinon, corrigez et regénérez le HTML.
})

test_that("La structure du document est-elle conservée ?", {
  expect_true(all(c("Introduction", "But", "Matériel et méthodes",
    "Analyses", "Description des données",
    "Modélisation par régression linéaire simple",
    "Analyse des résidus du modèle linéaire simple",
    "Modélisation avec la régression polynomiale",
    "Analyse des résidus du modèle polynomial", "Comparaison des modèles",
    "Discussion et conclusions",
    "Comparaison bloc-notes - rapport - publication")
    %in% (rmd_node_sections(acha) |> unlist() |> unique())))
  # Les sections (titres) attendues du bloc-notes ne sont pas toutes présentes
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs titres indispensables par rapport aux exercices ont disparu ou ont
  # été modifié. Vérifiez la structure du document par rapport à la version
  # d'origine dans le dépôt "template" du document (lien au début du fichier
  # README.md).
  
  expect_true(all(c("setup", "import", "plot", "plotcomment", "lin",
    "lincomment", "linsummary", "linsummarycomment", "linresid",
    "linresidcomment", "poly", "polycomment", "polysummary",
    "polysummarycomment", "polyresid", "polyresidcomment", "compa",
    "compacomment")
    %in% rmd_node_label(acha)))
  # Un ou plusieurs labels de chunks nécessaires à l'évaluation manquent
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs chunks indispensables par rapport aux exercices sont introuvables.
  # Vérifiez la structure du document par rapport à la version d'origine dans
  # le dépôt "template" du document (lien au début du fichier README.md).
  
  expect_true(any(duplicated(rmd_node_label(acha))))
  # Un ou plusieurs labels de chunks sont dupliqués
  # Les labels de chunks doivent absolument être uniques. Vous ne pouvez pas
  # avoir deux chunks qui portent le même label. Vérifiez et modifiez le label
  # dupliqué pour respecter cette règle. Comme les chunks et leurs labels sont
  # imposés dans ce document cadré, cette situation ne devrait pas se produire.
  # Vous avez peut-être involontairement dupliqué une partie du document ?
})

test_that("L'entête YAML a-t-il été complété ?", {
  expect_true(acha[[1]]$author != "___")
  expect_true(!grepl("__", acha[[1]]$author))
  expect_true(grepl("^[^_]....+", acha[[1]]$author))
  # Le nom d'auteur n'est pas complété ou de manière incorrecte dans l'entête
  # Vous devez indiquer votre nom dans l'entête YAML à la place de "___" et
  # éliminer les caractères '_' par la même occasion.
  
  expect_true(grepl("[a-z]", acha[[1]]$author))
  # Aucune lettre minuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en majuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.
  
  expect_true(grepl("[A-Z]", acha[[1]]$author))
  # Aucune lettre majuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en minuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.
})

test_that("Chunk 'import' : importation des données", {
  expect_true(is_identical_to_ref("import", "names"))
  # Les colonnes dans le tableau `achatina` importé ne sont pas celles attendues
  # Votre jeu de données de départ n'est pas correct. Ce test échoue si vous
  # avez modifié le chunk 'import'.
  # Vérifiez le chunk 'import' du document par rapport à la version d'origine
  # dans le dépôt "template" du document (lien au début du fichier README.md).
  
  expect_true(is_identical_to_ref("import", "classes"))
  # La nature des variables (classe) dans le tableau `achatina` est incorrecte
  # Vérifiez le chunk d'importation des données.
  
  expect_true(is_identical_to_ref("import", "nrow"))
  # Le nombre de lignes dans le tableau `achatina` est incorrect
  # Vérifiez l'importation des données dans le chunk d'importation et
  # réexécutez-le pour corriger le problème.
  
  expect_true(is_identical_to_ref("import", "units"))
  # Les unités renseignées pour les variables de `achatina` sont incorrectes
  # Vérifiez la labélisation des variables dans le chunk d'importation et
  # réexécutez-le pour corriger le problème.
  
  expect_true(is_identical_to_ref("import", "nas"))
  # Les valeurs manquantes pour les variables de `achatina` sont incorrectes
  # Vérifiez l'importation et la manipulation des données dans le chunk
  # d'importation et réexécutez-le pour corriger le problème.
})

test_that("Chunk 'plot' : représentation graphique des données", {
  expect_true(is_identical_to_ref("plot"))
  # Le graphique produit par le chunk 'plot' n'est pas celui attendu
  # Lisez bien la consigne et corrigez l'erreur. En cas de doute, vérifiez le
  # chunk 'plot' du document par rapport à la version d'origine dans le dépôt
  # "template" du document (lien au début du fichier README.md).
  
  expect_true(is_identical_to_ref("plotcomment"))
  # L'interprétation du graphique rayon en fonction du nombre de tours est
  # (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre les
  # crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'lin' et 'lincomment', régression linéaire simple", {
  expect_true(is_identical_to_ref("lin"))
  # La régression linéaire simple réalisée n'est pas celle attendue
  # Vérifiez en particulier la formule que vous avez écrite pour décrire la
  # relation entre les variables dans votre modèle. Relisez les consignes
  # attentivement, si nécessaire. Faut-il réaliser le modèle sur les données
  # transformées ou non ?
  
  expect_true(is_identical_to_ref("lincomment"))
  # L'interprétation de la régression linéaire simple est (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent la régression d'un 'x' entre les
  # crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'linsummary' et 'linsummarycomment', résumé de la première régression", {
  expect_true(is_identical_to_ref("linsummary"))
  # Le tableau résumé de la régression linéaire simple est incorrect
  # Si le modèle est correct (test précédent), vérifiez que vous réalisez bien
  # le résumé de ce modèle et qu'ensuite vous utilisez `tabularise()` pour le
  # mettre en forme.
  
  expect_true(is_identical_to_ref("linsummarycomment"))
  # L'interprétation du résumé de la régression linéaire simple est
  # (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent le résumé de la régression d'un
  # 'x' entre les crochets [] -> [x]. Ensuite, vous devez recompiler la version
  # HTML du bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les
  # résultats. Assurez-vous de bien comprendre ce qui est coché ou pas : vous
  # n'aurez plus cette aide plus tard dans le travail de groupe ou les
  # interrogations !
})

test_that("Le code pour l'équation paramétrée du modèle linéaire simple est-il correct ?", {
  expect_true(rmd_select(acha, by_section(
    "Modélisation par régression linéaire simple")) |>
      as_document() |> is_display_param_equation("achatina_lm"))
  # Le code pour générer l'équation paramétrée du modèle linéaire simple est
  # incorrect
  # Vous avez appris à faire cela dans un learnr du module. Revoyez cette
  # matière et vérifiez comment l'équation se présente dans le document final
  # généré avec le bouton ('Rendu').
})

test_that("Chunks 'linresid' & 'linresidcomment' : graphique d'analyse des résidus de la première régression", {
  expect_true(is_identical_to_ref("linresid"))
  # Le graphique d'analyse des résidus de la régression linéaire simple n'est
  # pas réalisé ou est incorrect
  # Relisez les consignes et vérifiez votre code concernant ce graphique.
  
  expect_true(is_identical_to_ref("linresidcomment"))
  # L'interprétation du graphique d'analyse des résidus de la régression
  # linéaire simple est (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre les
  # crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'poly' et 'polycomment', régression polynomiale", {
  expect_true(is_identical_to_ref("poly"))
  # La régression polynomiale réalisée n'est pas celle attendue
  # Vérifiez en particulier la formule que vous avez écrite pour décrire la
  # relation entre les variables dans votre modèle. Avez-vous recherché le degré
  # optimal du polynôme ? Avez-vous simplifié le modèle le cas échéant ? Relisez
  # les consignes attentivement, si nécessaire. Faut-il réaliser le modèle sur
  # les données transformées ou non ?
  
  expect_true(is_identical_to_ref("polycomment"))
  # L'interprétation de la régression polynomiale est (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent la régression d'un 'x' entre les
  # crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'polysummary' et 'polysummarycomment', résumé de la régression polynomiale", {
  expect_true(is_identical_to_ref("polysummary"))
  # Le tableau résumé de la régression polynomiale est incorrect
  # Si le modèle est correct (test précédent), vérifiez que vous réalisez bien
  # le résumé de ce modèle et qu'ensuite vous utilisez `tabularise()` pour le
  # mettre en forme.
  
  expect_true(is_identical_to_ref("polysummarycomment"))
  # L'interprétation du résumé de la régression polynomiale est
  # (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent le résumé de la régression d'un
  # 'x' entre les crochets [] -> [x]. Ensuite, vous devez recompiler la version
  # HTML du bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les
  # résultats. Assurez-vous de bien comprendre ce qui est coché ou pas : vous
  # n'aurez plus cette aide plus tard dans le travail de groupe ou les
  # interrogations !
})

test_that("Le code pour l'équation paramétrée du modèle polynomial est-il correct ?", {
  expect_true(rmd_select(acha, by_section(
    "Modélisation avec la régression polynomiale")) |>
      as_document() |> is_display_param_equation("achatina_poly"))
  # Le code pour générer l'équation paramétrée du modèle polynomial est
  # incorrect
  # Vous avez appris à faire cela dans un learnr du module. Revoyez cette
  # matière et vérifiez comment l'équation se présente dans le document final
  # généré avec le bouton ('Rendu').
})

test_that("Chunks 'polyresid' & 'polyresidcomment' : graphique d'analyse des résidus de la régression polynomiale", {
  expect_true(is_identical_to_ref("polyresid"))
  # Le graphique d'analyse des résidus de la régression polynomiale n'est
  # pas réalisé ou est incorrect
  # Relisez les consignes et vérifiez votre code concernant ce graphique.
  
  expect_true(is_identical_to_ref("polyresidcomment"))
  # L'interprétation du graphique d'analyse des résidus de la régression
  # polynomiale est (partiellement) fausse
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre les
  # crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunk 'compacomment', comparaison des deux modèles", {
  expect_true(is_identical_to_ref("compacomment"))
  # La comparaison des deux modèles est (partiellement) fausse
  # Quelle métrique utilise-t-on pour comparer des modèles de complexités
  # différentes ? Comment utilise-t-on ces métriques (revoyez dans le cours) ?
  # Les modèles sont-ils imbriqués ?
  # Vous devez cochez les phrases qui décrivent le résumé de la régression d'un
  # 'x' entre les crochets [] -> [x]. Ensuite, vous devez recompiler la version
  # HTML du bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les
  # résultats. Assurez-vous de bien comprendre ce qui est coché ou pas : vous
  # n'aurez plus cette aide plus tard dans le travail de groupe ou les
  # interrogations !
})

test_that("La discussion et les conclusions sont-elles complétées ?", {
  expect_true(!(rmd_select(acha, by_section(
    "Discussion et conclusions")) |> as_document() |> grepl(
      "^- +\\.+ *$", x = _) |> any()))
  # La discussion et les conclusions ne semblent pas complétées ou vous avez
  # laissé traîné un item de liste avec "..."
  # Vous devez remplacer les trois points (...) pas vos éléments de discussion.
  # Ce test concerne la discussion toute entière, comparaison des trois types de
  # documents comprise.
  
  expect_true(!(rmd_select(acha, by_section(
    "Comparaison bloc-notes - rapport - publication")) |> as_document() |>
      grepl("^- +\\.+ *$", x = _) |> any()))
  # La comparaison bloc-notes - rapport - publication ne semble pas complétée
  # ou vous avez laissé traîné un item de liste avec "..."
  # Vous devez remplacer les trois points (...) pas vos éléments de comparaison
  # des trois types de documents après les avoir minutieusement comparés (test
  # uniquement sur cette section). C'est la fin d'un exercice assez long, mais
  # comprendre comment bien rédiger chaque type de document est crucial... alors
  # encore un petit effort !
})
