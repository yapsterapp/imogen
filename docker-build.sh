#!/usr/bin/env bash

docker build --network=host -t "employeerepublic/imogen:0.1.0.3" . -f Dockerfile
