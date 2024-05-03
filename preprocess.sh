#!/bin/bash

echo "Applying environment variables"

echo "DATA_SERVER: $DATA_SERVER"
echo "GAME_SERVER: $GAME_SERVER"
echo "DATA_SERVER_ROOT: $DATA_SERVER_ROOT"

jq --arg DATA_SERVER "$DATA_SERVER" '.Backend = $DATA_SERVER' /ROOT/BUILD/Server_Data/StreamingAssets/DeploymentConfig.json > tmp.$$.json && mv tmp.$$.json /ROOT/BUILD/Server_Data/StreamingAssets/DeploymentConfig.json
jq --arg GAME_SERVER "$GAME_SERVER" '.Server = $GAME_SERVER' /ROOT/BUILD/Server_Data/StreamingAssets/DeploymentConfig.json > tmp.$$.json && mv tmp.$$.json /ROOT/BUILD/Server_Data/StreamingAssets/DeploymentConfig.json

echo "Running PM2 Command"

# pm2-runtime pm2.json 

# run pm2-runtime with the pm2.json file in daemon mode
pm2-runtime start pm2.json