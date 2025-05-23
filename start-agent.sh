#!/bin/bash

set -euo pipefail

# 🚀 Script unifié de démarrage d’un agent Jenkins distant

JENKINS_URL="http://localhost:8082"
AGENT_JAR_URL="$JENKINS_URL/jnlpJars/agent.jar"
AGENT_NAME="controller"
WORKDIR="./agent"
SECRET_FILE="$WORKDIR/secret-file"

mkdir -p "$WORKDIR"

echo "🔧 Démarrage de l’agent Jenkins distant..."
