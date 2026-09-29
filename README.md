# Notes

Écritures sur ce que je construis, et sur ce que je n'ai jamais montré.

Quand une idée n'est pas étayée par une mesure qu'un tiers peut refaire, elle est marquée comme
hypothèse et elle est publiée comme telle — ou pas publiée du tout.

## Articles

- **[J'ai compté mes commits. Le ratio m'a déplu.](posts/2026-09-28-audit-709-commits.md)** —
  2026-09-28. Un audit de 709 commits sur 74 dépôts. Le chiffre qui compte n'est pas 709, c'est
  2 sur 58 : le nombre de dépôts qui portent une licence.
- **[« Valeur ajoutée, alignement »](posts/2026-09-28-valeur-ajoutee-alignement.md)** — 2026-09-28.
  Deux critères pour décider si une automatisation est terminée. Le troisième cas, celui où ils se
  contredisent, je ne l'ai pas encore écrit.

## Sur la méthode

Les chiffres viennent de deux choses, toutes deux reproductibles :

- un audit qui parcourt l'historique git et compte les dépôts, les README et les licences ;
- un script d'une centaine de lignes qui lit `git log --all --format='%an <%ae>'` et signale les
  identités abandonnées.

Quand un chiffre n'est pas vérifiable par un tiers, il n'est pas dans le texte. Il est écrit
comme une hypothèse, et étiqueté comme tel.

## Sur le nom

Je publie sous `4x10m`, qui est mon vrai compte GitHub. Mon nom civil apparaît dans l'historique
de certains dépôts, et j'ai décidé de ne pas réécrire cet historique. La raison est dans le
premier article : un historique scrubé est une affirmation, et une affirmation s'entretient à
jamais. Le mien dit ce qui s'est réellement passé.

## Licence

CC BY-SA 4.0. Je peux réutiliser vos citations, à condition de me citer et de partager la même
licence. Pour du code, ce dépôt n'en contient pas.
