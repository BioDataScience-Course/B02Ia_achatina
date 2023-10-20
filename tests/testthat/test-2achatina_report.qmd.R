# Vérifications de achatina_report.qmd
test_that("Le rapport est-il compilé en un fichier final HTML ?", {
  expect_true(is_rendered("achatina_report.qmd"))
  # La version compilée HTML du rapport est introuvable
  # Vous devez créer un rendu de votre rapport Quarto (bouton 'Rendu')
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.
  
  expect_true(is_rendered_current("achatina_report.qmd"))
  # La version compilée HTML du rapport Quarto existe, mais elle est ancienne
  # Vous avez modifié le rapport Quarto après avoir réalisé le rendu.
  # La version finale HTML n'est sans doute pas à jour. Recompilez la dernière
  # version de votre rapport en cliquant sur le bouton 'Rendu' et vérifiez
  # que la conversion se fait sans erreur. Sinon, corrigez et regénérez le HTML.
})
