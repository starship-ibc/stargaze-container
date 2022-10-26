# Stargaze container

This Dockerfile provides a containerized version of the stargaze blockchain that can be initialized with [Polkachu state-sync] for rapid development.

## Initialization

Build the docker container

```sh
docker compose build
```

Create a container and run the state-sync.sh script.

```sh
docker compose run stargaze_node bash
```

From the container:

```sh
starsd init "$MONIKER_NAME" --chain-id "$CHAIN_ID"
./state-sync.sh
starsd tendermint unsafe-reset-all --home $HOME/.starsd
exit
```

Now you can start your docker compose as usual:

```sh
docker compose up -d
```

## Debugging

You can view the logs like so:

```sh
docker logs -f stargaze-docker-stargaze_node-1
```

Or check the status:

```sh
curl http://localhost:16657/status
```

