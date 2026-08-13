#!/usr/bin/env bash
# Publica los cambios de index.html en GitHub y actualiza el sitio de GitHub Pages.
# Uso: ./publish.sh "mensaje del cambio"
set -e

cd "$(dirname "$0")"

MSG="${1:-Actualiza la simulación}"

if git diff --quiet && git diff --cached --quiet; then
  echo "No hay cambios que publicar."
  exit 0
fi

git add -A
git commit -m "$MSG"
git push

echo ""
echo "Listo. GitHub Pages se reconstruye en aproximadamente un minuto:"
echo "  https://xcaaaam.github.io/orion-giza/"
