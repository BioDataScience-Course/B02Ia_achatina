Croissance de la coquille de l’escargot géant d’Afrique
================

# Introduction

*Achatina achatina* (Linnæus, 1758) a été étudié dans le cadre d’un
travail de modélisation de la croissance des coquilles d’escargots
gastéropodes.

![](images/achatina.png)

Le jeu de données `achatina` comprend les variables suivantes :

-   `coils` : nombre de tours de coquille (sans unité)
-   `radius` : rayon de la suture mesuré depuis le point de référence
    (apex, sommet de la coquille) en vue apicale (“vue du haut”) en mm
-   `shell` : type de coquille juvénile (protoconche) ou adulte
    (téléoconche)

Nous pouvons visualiser ces données grâce au graphique ci-dessous.

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

# Objectif

Ce projet est **individuel**, **court** et **cadré**. Il doit être
terminé **le 27 octobre à 12h30**. Son template se trouve à
<https://github.com/BioDataScience-Course/B02Ib_achatina>.

Votre objectif est de construire un modèle de croissance de la coquille
de ces mollusques. Utilisez les différentes notions que vous avez
apprises sur la régression linéaire dans les modules 1 et 2 du cours.

# Consignes

Complétez le document `achatina_notebook.Rmd` se trouvant dans le
dossier `docs/`.

Respectez la structure du document.

-   Introduction
-   But (quelle est la question posée ici ?)
-   Analyses (vos analyses avec une description complètes)
-   Discussion et conclusion

**À la fin de votre étude, vérifiez que votre document
`docs/achatina_notebook.Rmd` compile en un fichier final HTML sans
erreurs via le bouton Knit.** Un rapport d’analyse contenant des erreurs
ou autres anomalies qui empêchent cette compilation n’est pas recevable
! Vérifiez aussi avant la fin que vous avez **enregistré vos
modifications**, puis fait un **commit**, un **pull** et un **push**.
Vous pouvez vérifier directement dans le dépôt GitHub : il présence
votre travail tel qu’il sera visible à la correction. **L’oubli d’un
enregistrement et/ou d’un commit ou d’un push peut faire qu’une partie
de votre travail ne sera pas pris en compte**, donc vérifiez plutôt deux
fois qu’une.

# Informations complémentaires sur les données

Les données de ce projet ont été employées dans le cadre d’une
publication de Van Osselaer et Grosjean (2000). Elle est disponible dans
le dossier `biblio`. Elle vous permettra de compléter les sections
introduction et matériel et méthodes grâce aux informations qui s’y
trouvent. *Vous pouvez vous inspirer des balises utilisées dans
`README.Rmd` pour vos références bibliographiques dans
`docs/achatina.Rmd`.* Évitez cependant de perdre trop de temps à lire la
bibliographie dans le cadre de cet exercice. Nous vous conseillons
d’organiser votre temps comme suit :

-   Prise de connaissance des consignes et lecture de l’abstract de la
    publication
-   Bien comprendre la question posée et rédiger le but du travail
-   Réaliser l’analyse
-   Interpréter les différents items de l’analyse
-   Réserver suffisamment de temps pour écrire une discussion et un
    conclusion
-   Rédiger l’introduction et le matériel et méthodes à la fin, et en
    fonction du temps restant

# Notes

### Plagiat

N’oubliez pas que le plagiat est interdit. Citez vos sources.

### Entraide

L’entraide est encouragée. Vous devez cependant citer les personnes qui
ont contribué à votre projet. Utilisez les “block quotes” sous un chunk
ou sous un paragraphe pour spécifier vos collaborateurs. Les “block
quotes” sont des paragraphes Markdown commençant par un signe plus grand
que suivi d’une espace (`>`). Vous pouvez aussi y indiquer d’autres
remarques, par exemple, la difficulté ou le temps nécessaire pour
remplir une section. Terminez avec un “block quote” avant la section
bibliographie où vous indiquez le temps total nécessaire, le temps
supplémentaire qu’il faudrait éventuellement, et vos suggestions
relatives à ce projet pour l’améliorer dans le futur. Voici un exemple
de “block quote”

> Adapté de Grosjean, en collaboration avec Engels (j’aurais pu me
> débrouiller ici, mais j’aurais perdu trop de temps sur ce chunk)

# Référence

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-VanOsselaer2000" class="csl-entry">

Van Osselaer, Christian, and Philippe Grosjean. 2000. “<span
class="nocase">Suture and Location of the Coiling Axis in Gastropod
Shells</span>.” *Paleobiology* 26 (2): 238–57.
<http://www.jstor.org/stable/2666014>.

</div>

</div>
