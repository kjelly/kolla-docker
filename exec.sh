#!/bin/bash
docker exec -it kolla-docker env INSECURE_REGISTRY=$INSECURE_REGISTRY kb $@
