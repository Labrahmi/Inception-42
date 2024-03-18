
all:
	sh srcs/requirements/tools/setup.sh
	docker-compose -f srcs/docker-compose.yml up --build -d

up: all

down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: down
	sudo rm -rf /home/$(USER)/data/*/*
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

re: fclean all

prune:
	docker system prune -a -f