# Test.Docker
Steps for setting up testing on docker.

# pre-requisites
1. get set up w/ kinematic and quickstart terminal
2. open quickstart terminal

# stand-alone chrome
To set up a test chrome container: `docker run -d -p 4444:4444 -v /dev/shm:/dev/shm selenium/standalone-chrome:3.5.2-antimony`

# set up grid
1. To set up a hub with 3 chrome nodes:
```
docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.5.2-antimony
docker run -d --link selenium-hub:hub --name chrome-node1 selenium/node-chrome:3.5.2-antimony
docker run -d --link selenium-hub:hub --name chrome-node2 selenium/node-firefox:3.5.2-antimony
docker run -d --link selenium-hub:hub --name chrome-node3 selenium/node-firefox:3.5.2-antimony
```
   #### note
   instead of using the `--link selenium-hub:hub` argument, you can omit it and link everything within a `docker-compose.yml` file.

2. To admire your handywork:
* type `docker images` to view images on local machine
* type `docker ps` to see all containers currently running locally
* visit `http://localhost:4444/grid/console` to see hub (I had to us my machine IP instead of localhost for some reason)

# execute tests
1. see files.
2. follow [him](https://github.com/jfroom/docker-compose-rails-selenium-example)

#### note
our tests use 2 of Ruby built-in's: [DesiredCapabilities](https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities), which specifies what kind of driver we need; and [RemoteWebDriver](https://github.com/SeleniumHQ/selenium/wiki/RemoteWebDriver), which fetches a matching driver (in this case, a node from our hub)

# extras
### stand-alone chrome
To set up a test chrome container: `docker run -d -p 4444:4444 -v /dev/shm:/dev/shm selenium/standalone-chrome:3.5.2-antimony`
### run image w/ leave in exec for debugging
docker run -it {CONTAINER_NAME} /bin/bash
### stop all containers
docker stop $(docker ps -aq)
### clean up
docker rm `docker ps -aq`
### remove all images
docker rmi $(docker iamges -q)
