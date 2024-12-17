NAME = inception

$(NAME):
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

all: $(NAME)

build:
	docker compose -f srcs/docker-compose.yml build --no-cache

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down

fdown:
	docker compose -f srcs/docker-compose.yml down; \
	docker system prune -a -f

ffdown:
	docker compose -f srcs/docker-compose.yml down; \
	docker system prune -a -f; \
	docker volume rm $$(docker volume ls -q) || true
