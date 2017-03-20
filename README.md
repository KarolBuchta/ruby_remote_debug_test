# ruby_remote_debug_test
Repository for reproduction of ruby remote debug issue in IntelliJ IDEA Ultimate and RubyMine

## Environment

- The official docker image is used (ruby:2.1.9), extended for ssh access in a own docker image
- RubyMine Version: 2016.3.2
- IntelliJ IDEA Ultimate: 2016.3.5

## Reproduction of issue

1.) Install docker compose and docker for the operating system of choice 

2.) Clone this repository

3.) Run this command from within the project root folder:

```

dc up

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

7.) Observe no Gems are found or copied to the local stubs folder, gems are not found.


## Further infos

- The same issue can be observed in both RubyMine as well as Ultimate.
- We have tried this with .rbenv on our live docker container as well, it was with jruby. Gems where neither found nor copied as well.
- We also tried this with a normal ruby within our dev container, so no jruby involved. Still the same issue.
- This is the minimum config, with the official ruby docker image, still no success with discovering gems.
