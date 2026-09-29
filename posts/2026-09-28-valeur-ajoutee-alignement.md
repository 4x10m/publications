---
layout: null
title: "« Valeur ajoutée, alignement » — la règle que je n'ai pas encore appliquée partout"
date: 2026-09-28
---

[OPINION] J'aime automatiser. C'est écrit dans mes notes depuis des années, et c'est vrai.

En même temps je crois que l'automatisation mal bornée ne supprime pas le travail, elle le déplace.
Les deux propositions sont dans le même cerveau, et pendant des années je n'ai pas su comment
elles tenaient ensemble. Cette semaine, j'ai trouvé deux mots.

> **Valeur ajoutée, alignement.**

C'est ma règle de décision maintenant. Elle tient en une ligne, ce qui est la seule qualité
honnête qu'une règle puisse avoir.

## Les deux critères ne regardent pas la même chose

C'est contre-intuitif, et c'est tout le contenu de la règle.

| Critère | Ce qu'il juge | La question |
|---|---|---|
| **Valeur ajoutée** | le *résultat* | « Est-ce que ça m'a fait gagner quelque chose ? » |
| **Alignement** | la *décision* | « Est-ce que j'ai décidé ça, ou est-ce que ça l'a décidé à ma place ? » |

Un seul critère ne suffit pas, et c'est facile à vérifier :

« Ça marche » peut produire un résultat que je ne voulais pas. Un script qui nettoie le mauvais
dossier, ça marche. C'est aligné avec rien.

« C'est ce que j'ai demandé » peut produire un résultat inutile. « Automatise-moi le déploiement »
et un déploiement que personne ne déploie est exactement ce que j'ai demandé.

Les deux ensemble, ça commence à morser : le résultat doit être bon, et la décision doit être
la mienne.

## Le cas où les deux se contredisent — et je ne l'ai pas résolu

> [HYPOTHÈSE] Ce qui suit est un cas que je crois possible. Je n'ai pas d'exemple à l'appui.

Voilà ce que ces deux mots ne règlent pas.

Le résultat est bon. La décision n'est pas la mienne. Ça arrive, et c'est le cas le plus
dangereux d'une automatisation, précisément parce qu'elle a l'air de marcher.

Un script qui nettoie le mauvais dossier : je gagne du temps — **valeur ajoutée** — et l'intention
dérive — **pas d'alignement**. Les deux critères sont satisfaits et le résultat est mauvais.

C'est exactement la situation de l'infrastructure « souverain » : personne ne la conteste parce
qu'elle marche, et personne ne l'a vraiment décidée parce que personne n'a eu à choisir.

Je n'ai pas d'exemple à donner. C'est la partie que je n'ai pas encore écrite : **un vrai cas où
les deux critères sont entrés en conflit, et ce que j'ai fait.** Tant que je ne l'ai pas, cette
règle est une graine, pas une position. Une graine que j'ai laissée pousser toute seule deviendrait
ma position publique sans avoir été ma pensée, et ce serait une fraude — pas grave, mais exacte.

## Ce que je propose

Si vous automatisez beaucoup aussi : essayez les deux critères séparément pendant une semaine.
Pas « est-ce que ça a marché », et « est-ce que je l'ai voulu » — mais l'un **puis** l'autre,
parce qu'ils ne répondent pas à la même question.

Et si vous trouvez un cas où ça ne marche pas — c'est-à-dire un cas où le résultat est bon et la
décision n'est pas la vôtre — j'aimerais vraiment le lire. C'est la partie de ma règle qui
n'existe pas encore, et elle ne s'écrira pas seul.

## Ce que je n'affirme pas

- Que cette règle est bonne. Je l'ai formulée il y a quelques jours, et je n'ai pas encore
  de données.
- Que « l'automatisation déplace la fatigue » est démontré. C'est une intuition que je tiens
  depuis longtemps et que je n'ai jamais mesurée.
- Que quelqu'un d'autre devrait adopter ces deux mots. Ils m'appartiennent, ils ne sont pas un
  standard.

## Sources

- La règle « valeur ajoutée, alignement » : formulation de l'auteur, 2026-09-28. C'est la seule
  chose que je n'ai pas tirée d'ailleurs.
- « J'aime automatiser » : notes personnelles, `Profil de l'utilisateur`.
- Aucune source externe. Cet article ne s'appuie sur aucun travail publié sur le sujet — c'est un
  point de départ, pas une revue.
