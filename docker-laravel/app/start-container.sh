#!/usr/bin/env bash

# make sure /.composer exists and writable
if [ ! -d /.composer ]; then
  mkdir /.composer
fi

chmod -R ugo+rw /.composer

# run things different whether prod or dev env, etc

# Run command or start supervisord
if [ $# -gt 0 ]; then
  # If command is passed, run it
  exec "$@"
else
  # Otherwise start supervisord
  sudo /usr/bin/supervisord
fi
