include .env
export


.PHONY: *

#Command-for running container
CONTAINER = docker run --rm \
	-v ${PWD}/app:/app \
	-v ${PWD}/arduino:/root/.arduino15/ \
	--device=${DEVICE} \
		ivankomolin/arduino

#Install arduino:avr core
#Change `CORE` if used other core
install:index
	bash -c "${CONTAINER} arduino-cli core install ${CORE}"

#Upload sketch on the device
upload:
	bash -c "${CONTAINER} arduino-cli upload -p ${DEVICE} --fqbn ${FQBN}"

#Compile sketch for arduino nano device
#Change `DEVICE` if used other device
compile:
	bash -c "${CONTAINER} arduino-cli compile --fqbn ${FQBN}"

#Update index
index:
	bash -c "${CONTAINER} arduino-cli core update-index"

#Execute any commands by container, example: make exec cmd="arduino-cli lib install 'WiFi101'"
#See all commands arduino-cli: https://github.com/arduino/arduino-cli
#See all commands picocom: https://linux.die.net/man/8/picocom
exec:
	bash -c "${CONTAINER} ${cmd}" || true