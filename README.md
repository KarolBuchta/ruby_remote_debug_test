# ruby_remote_debug_test
Repository for reproduction of ruby remote debug issue in IntelliJ IDEA Ultimate and RubyMine

## Environment

- The official docker image is used (ruby:2.1.9), extended for ssh access in an own docker image
- RubyMine Version: 2016.3.2
- IntelliJ IDEA Ultimate: 2016.3.5


## Project setup

- Find the example ruby files with example dependencies under src, the Gemfile contains two gems
- The source is copied to /var/www within the docker container as part of the docker image build. See (https://github.com/KarolBuchta/ruby_remote_debug_test/blob/master/Dockerfile#L15 "here")
- bundle install is executed as part of the image build as well
- You can connect to the running docker container by typing

```
  docker exec -it rubytest bash
```
- See steps below for a detailed reproduction case


## Reproduction of issue

1.) Install docker compose and docker for the operating system of choice 

2.) Clone this repository

3.) Run this command from within the project root folder:

```

docker-compose up

```

4.) Open up the SDK Manager in IntelliJ IDEA Ultimate (Right Click Module -> Open Module settings) or in RubyMine via Preferences

5.) Add new Ruby SDK => Choose SSH credentials

6.) Use following settings:

```
  Host: localhost
  Port: 2222
  User: root
  AuthType: Password
  Password: root
  Ruby Path: /usr/local/bin/ruby
```

7.) Observe no Gems are found or copied to the local stubs folders, gems are not found by the IDE. The debugging previously used does also not work.


## Further infos

- The same issue can be observed in both RubyMine as well as Ultimate.
- We have tried this with .rbenv on our live docker container as well, it was with jruby. Gems where neither found nor copied as well.
- This is the minimum config, with the official ruby docker image, still no success with discovering gems.

## Role of this feature

- This setting is becoming more and more popular as many people are using docker as well
- This setting is critical for us as we use it to debug a central service in our application stack
