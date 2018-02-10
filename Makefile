.PHONY: db

NAME=personal_tracker
BASE_TAG=shaneburkhart/${NAME}
DEV_FILE=deploy/dev/docker-compose.yml

all: run

build:
	 docker build -t ${BASE_TAG} .
	 docker build -t ${BASE_TAG}:dev ./deploy/dev

db:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rake db:migrate
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rake db:seed

run:
	docker-compose -f ${DEV_FILE} -p ${NAME} up -d

stop:
	docker stop $$(docker ps -q) || echo "Nothing to stop..."

clean: stop
	docker rm $$(docker ps -aq) || echo "Nothing to remove..."

restart:
	docker-compose -f ${DEV_FILE} -p ${NAME} restart

wipe: clean
	rm -rf deploy/dev/data
	$(MAKE) db || echo "\n\nDatabase needs a minute to start...\nWaiting 7 seconds for Postgres to start...\n\n"
	sleep 7
	$(MAKE) db

ps:
	docker ps -a

c:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web /bin/bash

t:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rspec ${FILE}

tr:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rspec spec/requests

tc:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rspec spec/controllers

tm:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rspec spec/models

ta:
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm web bundle exec rspec spec/models/*ability_spec.rb

pg:
	echo "Enter 'postgres'..."
	docker-compose -f ${DEV_FILE} -p ${NAME} run --rm pg psql -h pg -d mydb -U postgres --password

bundle:
	echo "You shouldn't ever need to bundle.  If you are getting bundle errors, delete the Gemfile.lock and 'make build'."

logs:
	docker-compose -f ${DEV_FILE} -p ${NAME} logs -f
