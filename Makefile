
all: esp-sdk esp-rtos

esp-rtos: esp-rtos/Dockerfile
  docker build esp-rtos --tag esp-rtos:latest

esp-sdk: esp-sdk/Dockerfile
	docker build esp-sdk --tag esp-sdk:latest
