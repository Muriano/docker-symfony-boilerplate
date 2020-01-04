# Docker Symfony Boilerplate
This project pretends to be a quickly and easy to use base to bootstrap your own developments, if they are based in PHP7 and Symfony Framework.

## Requirements:
* Docker version 18.09.2
* docker-compose version 1.23.2
* GNU make

## How to install:
* Fork this repo
* cd to repo folder.
* Run `make build` to build project containers and dependencies.

or

* Execute in your favorite terminal: `$ composer create-project muriano/docker-symfony-boilerplate {yourProjectNameHere}`

## What do you get:
* A ready to go base installation of Symfony (Currently version 5)
* A php-fpm container for local development with a bunch of useful extensions like zip, pdo, etc. You will also get the dependency manager `composer` and a little hack `prestissimo` to boost up your dependencies installation speed.
* A nginx web server ready to work with you already installed Symfony based app.
* A base Makefile with a few but helpful command to run your project.

## Booting Up your project
Of course, you'll need Docker and docker-compose installed in your development machine, but it is a piece of cake to get them running, so this readme won't cover that part of the dirty task.

To take your project alive, just type in your terminal: `make up`. That's all. Docker compose will build the base image, you can see it in [docker/app/Dockerfile]. It is a PHP FPM based image with composer and prestissimo installed on, and a bunch of useful PHP extension, such as PDO. Feel free to add or remove as many as you need.

Config file [docker-compose.yml] has been set up to redirect host machine port `8080` to container's port `80`. You'll probably need to change this value to your own so, once again, feel free to make as many changes as you need.

## Getting started with the code
A base symfony application should be installed for this project. You can see a demo page if you enter [http://localhost:8080] (or whatever other port you were configured). Feel free to make as many changes as you need. Just keep in mind it should be a Symfony based application.
You would probable want to modify [etc/nginx/nginx.conf] and [etc/nginx/conf.d] to apply your own configuration. Any change made in that file will require a restart of the running server container.

This repository supposes that you're already familiar with Symfony Framework and you knows where to start digging and typing your code.

Use [app/src] to put your code on.

Use [app/tests] to put your tests on.

Piece of cake!
