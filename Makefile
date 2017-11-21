SCRIPTS=run-as-repl.sh run-as-thunk.sh

all : datasets/setup.zip

datasets/setup.zip : ${SCRIPTS}
	zip -r $@ ${SCRIPTS}
