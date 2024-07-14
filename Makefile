all: mkdir run

mkdir: # create the directories that will be used as docker volumes
	mkdir -p /home
	mkdir -p /home/aziyani
	mkdir -p /home/aziyani/data
	mkdir -p /home/aziyani/data/mariadb
	mkdir -p /home/aziyani/data/wordpress

run: # execute the docker compose file to build and run the containers
	@docker compose -f ./srcs/docker-compose.yml up -d --build

off: # stop the containers
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down -v
	@docker volume rm -f ./data/wordpress ./data/mariadb

fclean: clean
	@docker system prune -af

restatr: fclean all

re: off all

.PHONY: all fclean restatr off run clean re
