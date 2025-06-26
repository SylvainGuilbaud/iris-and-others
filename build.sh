#!/bin/bash
global_start_time=$(date +%s)

# Fonction pour calculer et afficher le temps écoulé
display_time() {
    local description="$1"
    local start_time="$2"
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))

    local hours=$((duration / 3600))
    local minutes=$(( (duration % 3600) / 60 ))
    local seconds=$((duration % 60))

    printf "%-35s %02d:%02d:%02d\n" "$description" $hours $minutes $seconds
}

# Fonction pour afficher le temps global
display_global_time() {
    length=44  # Définir la longueur de la ligne
    for ((i=0; i<length; i++)); do
        echo -n "-"
    done
    echo
    display_time "TOTAL" $global_start_time
}

# Obtenir l'architecture de la machine 
arch=$(uname -m)

if [ "$arch" == "x86_64" ]; then
    export TARGETARCH="amd64"
else
    export TARGETARCH="arm64"
fi
echo $TARGETARCH 

step_start=$(date +%s)
docker system prune -f
display_time "docker prune " $step_start

# step_start=$(date +%s)
# cd $PWD/lorah/fr-core1
# ./fr-core1.sh
# cd -
# display_time "docker prune " $step_start

# step_start=$(date +%s)
# cd ./lorah/fr-core2
# ./fr-core2.sh
# cd - 
# display_time "docker prune " $step_start

# step_start=$(date +%s)
# cd ./lorah/fr-core3
# ./fr-core3.sh
# cd -
# display_time "docker prune " $step_start

step_start=$(date +%s)
BUILDKIT_PROGRESS=plain docker compose build --no-cache
display_time "build " $step_start

if [ "$1" = "clean" ]; then
  echo "Suppression des volumes et démarrage"
  step_start=$(date +%s)
  ./clean.sh
  display_time "clean " $step_start
fi
display_global_time

