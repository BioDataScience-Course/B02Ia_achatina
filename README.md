SDD II module 2 : Croissance de la coquille de l’escargot géant
d’Afrique
================

Ce projet nécessite d’avoir assimilé l’ensemble des notions du premier
et du second module du cours de Science des Données biologiques 2. Il
correspond au dépôt GitHub
<https://github.com/BioDataScience-Course/B02Ia_achatina>.

## Objectif

Ce projet est **individuel**, **court** et **cadré**. Vous devrez

- ajuster et décrire une régression linéaire simple
- ajuster et décrire une régression polynomiale
- Comparer des modèles
- mettre en évidence les différences clés entre un carnet de notes et un
  rapport

## Information sur les données

*Achatina achatina* (L., 1758) a été étudié dans le cadre d’un travail
de modélisation de la croissance des coquilles d’escargots gastéropodes.

![](images/achatina.png)

Le jeu de données `achatina` contient les variables suivantes :

- `coils` : nombre de tours de coquille (sans unité)
- `radius` : rayon de la suture mesuré depuis le point de référence
  (apex, sommet de la coquille) en vue apicale (“vue du haut”) en mm
- `shell` : type de coquille juvénile (protoconche) ou adulte
  (téléoconche)

Nous pouvons visualiser ces données grâce au graphique ci-dessous.

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Les données de ce projet ont été employées dans le cadre d’une
publication de Van Osselaer et Grosjean (2000). Cette publication est
disponible dans le dossier `biblio`.

## Consignes

Ce projet comprend deux document Quarto. Le premier document
(`achatina_notebook.qmd`) est un carnet de notes que vous devez
compléter. Le second (`achatina_report.qmd`) est un rapport déjà
complété qui va vous permettre de réaliser une comparaison entre le
carnet de notes et le rapport.

Vous devez compléter uniquement le document intitulé
`achatina_notebook.qmd`

Nous vous conseillons d’organiser votre temps comme suit :

- Prise de connaissance des consignes et lecture de l’abstract de la
  publication
- Bien comprendre la question posée en lisant attentivement
  l’introduction et le but du travail qui ont été rédigés pour vous
- Réaliser l’analyse
- Interpréter les différents items de l’analyse
- Réserver suffisamment de temps pour écrire une discussion et des
  conclusions qui forment une partie importante de l’exercice
- Comparez le bloc-notes (`achatina_notebook.qmd`), le rapport
  (`achatina_report.qmd`) et la publication scientifique
  (`biblio/VanOsselaer2000_Paleobiology_SutureAndLocationOfTheCoilingAxisInGastropodShells.pdf`).

Les deux documents Quarto (`achatina_notebook.qmd` et
`achatina_report.qmd`) comprennent une bibliographie. **Vérifiez que
vous comprenez bien comment l’utiliser dans un document Quarto en
regardant les balises employées en passant l’éditeur en mode “source”.**
Faites-en de même pour les labels, légendes et références croisées des
figures, tables et équations dans `achatina_report.qmd`. Voyez aussi la
façon d’inclure des informations supplémentaires sur les auteurs dans le
même document.

Assurez-vous à la fin que vous pouvez compiler une version HTML du
fichier `abalone_notebook.qmd` (bouton ‘Rendu’) sans erreurs. Sinon,
corrigez-les avant soumission finale. N’utilisez pas l’argument
`echo=FALSE` dans vos chunks. Le code R qui génère les résultats doit
rester visible dans la version HTML finale.

Utilisez les outils de vérification mis à votre disposition (onglet
‘Construire’ -\> bouton ‘Construire tout’).

Enfin, vérifiez que votre dernier commit + push est bien enregistré sur
GitHub à la fin de l’exercice. Vous pouvez utiliser l’instruction
suivante dans votre console afin d’ouvrir directement votre dépôt sur
GitHub dans votre navigateur web.

    usethis::browse_github()

## Utilisation de l’IA

Dans le cadre de votre travail, vous avez le droit d’être aidé par
l’intelligence artificielle. Le chatbot SciViews est disponible dans
votre RStudio sur Saturn Cloud via l’addin Help. Il répond aux questions
concernant le langage R, les statistiques et la science des données.

## Référence

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-VanOsselaer2000" class="csl-entry">

Van Osselaer, Christian, et Philippe Grosjean. 2000. « Suture and
Location of the Coiling Axis in Gastropod Shells ». *Paleobiology* 26
(2): 238‑57. <http://www.jstor.org/stable/2666014>.

</div>

</div>
