#!/bin/bash
NODE_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' p1-control-plane)
PORT=$(kubectl get svc hello-service -o jsonpath='{.spec.ports[0].nodePort}')
echo "Requesting http://${NODE_IP}:${PORT}"
curl "http://${NODE_IP}:${PORT}"
