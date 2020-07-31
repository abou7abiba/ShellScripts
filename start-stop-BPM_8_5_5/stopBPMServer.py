import sys

bpmServerName = "bpm85_DepEnv.SingleCluster.aibrahimtpNode01.0"
bpmNodeName = "aibrahimtpNode01"

try:
	AdminTask.stopMiddlewareServer('[-serverName ' + bpmServerName + ' -nodeName ' + bpmNodeName + ' ]')
except:
    print 'Error stopping server: ' +  bpmServerName + ', Node: bpmNodeName' + sys.exc_type, sys.exc_value.args
