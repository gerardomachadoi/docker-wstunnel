# Ubuntu Docker image with nginx wstunnel netcat

Use supervisor manage nginx wstunnel(https://github.com/erebe/wstunnel) and netcat.

root password: root!

Example:

    wstunnel -L 12345:127.0.0.1:10022 ws://server --upgradePathPrefix wstunnel

    nc 127.0.0.1 12345
    ls

Cannot get root privliage on heroku dyno

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
