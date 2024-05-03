# DMCC Tech Server Build Repo

## Getting Started

This repo will update the docker-based Unity Server build currently hosted ona docker server.

## Steps to deploy.

1. Clone this repo.
2. Create a build containing the following files inside a rar file named `BUILD.rar`:
   1. BUILD/
      1. Server_Data/\*
      2. UnityPlayer.so
      3. Server.x86_64
      4. (The files may expand or change in the future)
3. Double check step no.2 as it is very crucial
4. Push to main branch.
5. Each build commit on this branch might take 1 to 2 minutes.

## Notice

If there is a build issue or the build is not working, please contact the developer.

## Build Command

```bash
docker build -t landvault-game-server . --build-arg GAME_SERVER="client-unity.int2.lv-aws-x3.xyzapps.xyz/" --build-arg DATA_SERVER="https://client-be.int2.lv-aws-x3.xyzapps.xyz/api/"
```
