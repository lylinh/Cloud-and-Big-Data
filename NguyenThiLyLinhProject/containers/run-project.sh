source number-slave.sh $1
source build-image.sh
source start-containers.sh

docker exec -it master bin/bash -c "bash /root/shared/sujet-tp-scale/run_commands.sh $1 $2"

docker cp master:/root/shared/sujet-tp-scale/output.txt ../containers

docker exec -it master bin/bash -c "bash /root/shared/sujet-tp-scale/run-command_end.sh"

source kill-containers.sh
source clean-image.sh
