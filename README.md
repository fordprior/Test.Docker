# Test.Docker
Steps for setting up testing on docker.

# stand-alone chrome
To set up a test chrome container: `docker run -d -p 4444:4444 -v /dev/shm:/dev/shm selenium/standalone-chrome:3.5.2-antimony`

# set up grid
1. To set up a hub with 3 chrome nodes:
```docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.5.2-antimony
$ docker run -d --link selenium-hub:hub selenium/node-chrome:3.5.2-antimony
$ docker run -d --link selenium-hub:hub selenium/node-firefox:3.5.2-antimony```
2. Now, go to `http://localhost:4444/grid/console` to see hub (I had to us my machine IP instead of localhost for some reason)

# execute tests
1. see files.
