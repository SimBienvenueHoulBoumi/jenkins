```bash
### Exporter la variable d’environnement ADMIN_PASSWORD AVANT de démarrer ton container, genre :

export ADMIN_PASSWORD=admin
docker compose up -d

# creer le dossier de l'agent
mkdir -p ./agent

# lancer l'agent
./connect-remote-agent.sh

## commandes
### avant tout donner les drois d'exécution
chmod +x connect-remote-agent.sh start-agent.sh

### lancer en fonction du besoin
./start-agent.sh
./status-agent.sh
./stop-agent.sh


```