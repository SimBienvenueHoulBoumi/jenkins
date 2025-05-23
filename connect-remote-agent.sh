#!/bin/bash

# 🛡️ Script de connexion d’un agent Jenkins distant

set -e

JENKINS_URL="http://localhost:8082"
AGENT_NAME="controller"
AGENT_JAR="agent.jar"
WORKDIR="./remoting"  # Répertoire local pour Jenkins agent (RWX)
SECRET_FILE="./agent/secret-file"
AGENT_JAR_URL="$JENKINS_URL/jnlpJars/agent.jar"

# 🔐 Vérification du fichier secret
if [[ ! -f "$SECRET_FILE" ]]; then
  echo "❌ Fichier de secret introuvable à l’emplacement : $SECRET_FILE"
  echo "💡 Mets ton secret dans le fichier avant de lancer ce script."
  exit 1
fi

SECRET=$(cat "$SECRET_FILE")

# 📦 Téléchargement de agent.jar si nécessaire
if [[ ! -f "$AGENT_JAR" ]]; then
  echo "⬇️ Téléchargement de $AGENT_JAR depuis $AGENT_JAR_URL..."
  curl -sfLo "$AGENT_JAR" "$AGENT_JAR_URL"
else
  echo "✅ $AGENT_JAR déjà présent, skip téléchargement."
fi

# 📁 Préparation du répertoire de travail
mkdir -p "$WORKDIR"

# 🚀 Lancement de l’agent Jenkins
echo "🚀 Connexion de l’agent Jenkins « $AGENT_NAME »..."

java -jar "$AGENT_JAR" \
  -url "$JENKINS_URL" \
  -secret "$SECRET" \
  -name "$AGENT_NAME" \
  -webSocket \
  -workDir "$WORKDIR"
