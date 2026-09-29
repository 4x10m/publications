---
layout: null
title: "J'ai compté mes commits. Le ratio m'a déplu."
date: 2026-09-28
---

J'allais écrire un article sur un sujet que je connais bien : le fait que je construis beaucoup.
Puis j'ai compté pour de vrai, et les chiffres ont dit autre chose.

Donc voilà le compte.

## [FAIT] Ce que le compte a trouvé

> Source : `audit/2026-09-27-baseline.md` et `tools/audit-identite.sh`, tous reproductibles.

| | |
|---|---|
| Période | 2026-01-06 → 2026-09-26, 75 jours actifs |
| Commits (auteur seul) | **709** |
| Répertoires `.git` détectés | 96 |
| Dépôts autonomes | 74 |
| Dépôts 100 % originaux | 30 |
| Dépôts avec un README | 37 / 58 |
| Dépôts avec une LICENSE | **2 / 58** |
| Commits vérifiables publiquement | **0** |

Où sont passés les 709 :

| Domaine | Commits |
|---|---|
| Shell / Bash / Zsh | 652 |
| CI/CD (Actions, Woodpecker, Forgejo) | 566 |
| Node / TypeScript | 554 |
| Python | 383 |
| Docker / Compose | 328 |
| Routage LLM (LiteLLM, quotas, gateways) | 314 |
| Reverse-proxy / SSO (Caddy, Traefik, Authelia) | 219 |
| Agents / MCP / harnais | 206 |
| Backend / données (Postgres, SQLite, Redis) | 175 |
| Mesh / VPN (Tailscale) | 123 |

Vous êtes en train de regarder 709 et de penser *impressionnant*. Moi aussi. C'est le piège, et ce
n'est pas une figure de style, c'est de l'arithmétique : **709 commits que personne ne peut
vérifier valent exactement autant que zéro commits que personne ne peut vérifier.** Le nombre
existe. La preuve, non.

## [FAIT] Le vrai chiffre, c'est le 2 / 58

Un dépôt sans LICENSE n'est pas un projet libre. C'est un projet où l'auteur a gardé la décision
pour lui. Je retourne mon propre raisonnement contre moi, parce que c'est le seul qui soit vrai :

**56 de mes 58 dépôts n'ont aucune licence.** Concrètement : personne ne peut légalement les
utiliser, les forker, s'en servir pour apprendre, ou construire dessus. Ils existent sur ma
machine. Les 30 dépôts « originaux » — ceux qui sont vraiment les miens et pas un fork — sont
précisément ceux que personne ne peut toucher.

J'aimerais vous sortir la conclusion intéressante. La conclusion intéressante, c'est : j'ai monté
un cabinet privé et je l'ai appelé une contribution open source, et la différence entre les deux
tient dans un fichier que je n'ai jamais écrit.

## [FAIT] Ce que les objets git disent de moi

En comptant, j'ai lu les métadonnées d'auteur. 61 dépôts, toutes branches, auteur **et**
committer — donc un même commit peut être compté deux fois, et c'est le cas ici.

**935 lignes de comptage** portent une identité que j'ai abandonné : un nom de machine Windows
(`DESKTOP-8FERO89\user`), un gmail personnel, une identité admin locale. **34 commits**
portent mon nom civil, franchement, dans `sorting/dotfiles` — le dépôt que j'aurais publié en
premier, parce que les dotfiles sont la chose la plus publique qu'un développeur possède.

Le script qui a trouvé ça fait 120 lignes de bash. Il lit deux chaînes de format :
`git log --all --format='%an <%ae>'`. C'est tout.

Un fichier `.mailmap` aurait tout caché — sans rien changer. `mailmap` réécrit l'**affichage** ;
l'objet d'origine garde la chaîne d'origine, et reste lisible via l'API GitHub et dans n'importe
quel `.patch` téléchargé.

Je publie sous `4x10m`, qui est mon vrai compte GitHub, et mon vrai nom est dans cet historique.
J'ai envisagé de le réécrire. J'ai décidé de ne pas le faire, et la raison vaut plus cher que
l'historique propre : **un historique git scrubé est une affirmation, et une affirmation
s'entretient à jamais.** Le mien dit ce qui s'est réellement passé.

## [HYPOTHÈSE] De quoi c'est vraiment fait

Voilà ma lecture, et je la signale comme une lecture, pas comme un constat.

Je ne pense pas avoir raté la publication. Je pense que **la publication n'a jamais eu de prix
associé dans ma tête.** Écrire du code a une condition de fin : ça compile, ou pas. Publier
n'en a pas. Publier a des *conséquences*, ce qui est une pression bien plus faible, et les
faibles pressions ne déplacent pas quelqu'un que de fortes pressions maintiennent en place.

Le 2 / 58, c'est le même échec dans une boîte plus petite. Ne pas choisir de licence n'est pas
oublier. C'est une décision que je n'ai jamais prise, ce qui veut dire qu'elle est en attente,
pour toujours.

Ma seule pièce à conviction : mes notes personnelles contiennent une règle qui dit *ne pas utiliser
`desktop` ni `user` comme nom*. Cette règle existe à cause de `DESKTOP-8FERO89\user` — elle est
sur 244 de mes commits d'auteur. La règle a été écrite. La conséquence est restée. L'option n'a
jamais eu lieu.

Je n'ai pas de résolution. J'ai un script qui compte l'écart.

## Ce que je n'affirme pas

- Que 709 commits est un bon chiffre. Je ne sais pas ce que ça vaut, et vous non plus.
- Que j'ai été bloqué. Personne ne m'a bloqué. Il n'y a pas eu d'incident.
- Que le 2 / 58 est un accident. C'est peut-être une décision prise une fois et jamais revue.
- Que cet article corrige quoi que ce soit. C'est une mesure. Une mesure est la forme d'honnêteté
  la moins chère, et la plus facile à confondre avec du courage.

## Ce que j'aimerais vraiment défendre

Pas que tout le monde devrait publier. Que publier est **un coût sans condition de fin visible**,
et que les gens qui aiment construire — qui sont, par disposition, bons pour boucler des boucles
— vont systématiquement sous-estimer ce coût. Si ça tient, le correctif n'est pas la discipline.
C'est d'accrocher un vrai coût à la publication, comme la compilation en accroche un au code.

J'aimerais qu'on me discute. Surtout : « pas de condition de fin visible », est-ce un vrai mécanisme,
ou est-ce que je m'invente une sociologie pour expliquer un problème d'agenda ? Si c'est la
seconde chose, je viens d'écrire une jolie histoire sur ma propre procrastination, et la version
honnête c'est que je n'en avais pas envie.

## Sources

- `audit/2026-09-27-baseline.md` — les 709 commits, la répartition par domaine, les comptes
  README / LICENSE.
- `tools/audit-identite.sh` — les 935 commits portant une identité, reproductible par
  `bash tools/audit-identite.sh <dépôt>`.
- `api.github.com/users/4x10m` — date de création du compte, nombre de dépôts publics.
