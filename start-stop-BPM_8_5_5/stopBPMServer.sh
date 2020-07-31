#!/bin/bash
gksudo /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -lang jython -user bpmadmin -password bpmadmin -profile ./stopBPMServer.py
