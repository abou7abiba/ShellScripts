#!/bin/bash

# By A.Ibrahim
# gksudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches  not working on 14.04 any more

gksudo sync 
sudo echo 3 > /proc/sys/vm/drop_caches
