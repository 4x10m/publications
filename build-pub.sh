#!/usr/bin/env bash
# build-pub.sh — rend le dépôt `4x10m/publications` en HTML statique.
#
# À exécuter DEPUIS la racine de `4x10m/publications` (ou y être copié) :
#   cp tools/build-pub.sh <repo-publications>/ && cd <repo-publications> && ./build-pub.sh
# Le script travaille dans SON PROPRE répertoire, pas dans celui du parent.
#
# Pourquoi du HTML statique plutôt que Jekyll : le build Jekyll de GitHub Pages a échoué
# (« Page build failed. », sans log exploitable via l'API) et il n'y a ni jekyll ni pandoc ni
# kramdown sur cette machine. Le HTML statique n'a aucune dépendance de build : ce qui est
# commité est exactement ce qui est servi.
#
# Le rendu markdown → HTML passe par l'API GitHub (`/markdown`, mode gfm) : pas de tiers,
# pas de paquet à installer, pas de divergence possible entre ce que GitHub affiche et ce que
# le site sert.
#
# Les .md restent dans le dépôt : ils restent lisibles sur github.com, qui est le canal principal.
set -uo pipefail

RACINE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$RACINE" || exit 2

STYLE='
:root{--fg:#1c1c1e;--bg:#fff;--muted:#6b6b70;--line:#e3e3e6;--accent:#0b5fff}
@media(prefers-color-scheme:dark){:root{--fg:#e8e8ea;--bg:#111114;--muted:#9a9aa0;--line:#2a2a2f;--accent:#7aa7ff}}
*{box-sizing:border-box}
body{margin:0 auto;padding:3rem 1.25rem 6rem;max-width:44rem;background:var(--bg);color:var(--fg);
font:17px/1.65 -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",sans-serif}
h1,h2,h3,h4{line-height:1.25;margin:2.4rem 0 .8rem;font-weight:650;letter-spacing:-.01em}
h1{margin-top:0;font-size:2rem}h2{font-size:1.35rem;padding-bottom:.3rem;border-bottom:1px solid var(--line)}
h3{font-size:1.1rem}
p{margin:1rem 0}
a{color:var(--accent);text-decoration-thickness:1px;text-underline-offset:2px}
code{font:14px/1.5 ui-monospace,SFMono-Regular,Menlo,monospace;background:rgba(127,127,127,.13);
padding:.12em .35em;border-radius:4px}
pre{background:rgba(127,127,127,.1);padding:1rem;border-radius:8px;overflow-x:auto}
pre code{background:none;padding:0}
table{border-collapse:collapse;width:100%;margin:1.4rem 0;font-size:.94em}
th,td{text-align:left;padding:.5rem .7rem;border-bottom:1px solid var(--line);vertical-align:top}
th{font-weight:650}
blockquote{margin:1.4rem 0;padding:.2rem 0 .2rem 1.1rem;border-left:3px solid var(--line);
color:var(--muted)}
hr{border:0;border-top:1px solid var(--line);margin:2.5rem 0}
footer{margin-top:4rem;padding-top:1.2rem;border-top:1px solid var(--line);
color:var(--muted);font-size:.86rem}
ul,ol{padding-left:1.3rem}
'

enveloppe() {
  # $1 = titre, $2 = corps html
  cat <<HTML
<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>$1</title>
<meta name="description" content="Notes sur des systèmes qui tiennent, et sur ceux qui n'ont jamais été vus.">
<style>$STYLE</style>
</head>
<body>
$2
<footer><a href="/publications/">← Toutes les notes</a> · CC BY-SA 4.0</footer>
</body>
</html>
HTML
}

rendre() {
  # $1 = fichier markdown, $2 = titre, $3 = sortie
  # Le corps est envoyé en JSON via stdin : `gh api -f` ne lit pas un fichier, et un corps
  # construit à la main évite toute interpretation du markdown par le shell.
  local md="$1" titre="$2" out="$3"
  local corps
  # Le frontmatter YAML ne doit PAS être envoyé à l'API : sans ligne vide après le
  # second `---`, kramdown le lit comme un titre setext et le sert comme un `<h2>`.
  # On enlève donc le bloc d'en-tête avant le rendu, et le titre est déjà récupéré à part.
  corps="$(python3 -c '
import json,re,sys
t = open(sys.argv[1], encoding="utf-8").read()
t = re.sub(r"\A---\r?\n.*?\r?\n---\r?\n", "", t, count=1, flags=re.S)
print(json.dumps({"mode": "gfm", "text": t}))
' "$md" | gh api -X POST /markdown --input -)" || {
    echo "ECHEC rendu: $md" >&2; return 1; }
  [ -z "$corps" ] && { echo "ECHEC rendu (vide): $md" >&2; return 1; }

  # L'API GitHub enveloppe chaque tableau dans <markdown-accessiblity-table>, un élément
  # custom qui n'existe que dans le CSS de GitHub. Sur une page autonome il retombe en
  # `display:inline` et casse la mise en page. On retire le_balise, pas le tableau.
  corps="${corps//<markdown-accessiblity-table>/}"
  corps="${corps//<\/markdown-accessiblity-table>/}"

  enveloppe "$titre" "$corps" > "$out" || return 1
  echo "  $(basename "$out")  ($(wc -c < "$out") octets)"
}

echo "Rendu via l'API GitHub /markdown …"

# --- articles ----------------------------------------------------------
for md in posts/*.md; do
  [ -e "$md" ] || continue
  titre="$(grep -m1 '^title:' "$md" | sed 's/^title: *"\{0,1\}//; s/"\{0,1\}$//')"
  rendre "$md" "$titre" "posts/$(basename "$md" .md).html"
done

# --- page d'entrée -----------------------------------------------------
# Le README pointe vers les .md, parce que c'est ce que github.com affiche. Sur le site
# statique, il faut pointer vers les .html — sinon le lien mène au markdown brut.
rendre README.md "Notes — 4x10m" index.html
sed -i 's|posts/\([a-z0-9-]*\)\.md|posts/\1.html|g' index.html
echo "  index.html — liens .md convertis en .html : $(grep -c 'posts/.*\.html' index.html)"

echo "Terminé. Vérification :"
for f in index.html posts/*.html; do
  printf '  %-58s %s octets\n' "$f" "$(wc -c < "$f")"
done