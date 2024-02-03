

rm_all: rmi rm rmv

rmi:
	docker rmi -f --force $$(docker images -q)

rm:
	docker rm -f --force $$(docker ps -aq)

rmv:
	docker volume rm $$(docker volume ls -q)