# Kafka playtime

[Progress tracking](https://github.com/mdub/kafka-playtime/projects/1)

# Running on Linux

Prefix commands with `sudo` due to the docker daemon running as `root`.

There seems to be [a bug with docker-compose](https://github.com/docker/compose/issues/4076#issuecomment-324932294) where it takes ~40ms to connect to the terminal output of the container, so stuff logged to the terminal in this time is lost. The best workaround seems to be adding a delay of 0.1 seconds like so:

```bash
sudo ./auto/dev sh -c 'sleep 0.1; scripts/publish'
```

## Setup

```bash
./auto/dev/setup
```

## Usage

### Shell

To open a shell in the console container that has the Kafka management utils:

```bash
./auto/dev/console
```

### Watch events

To watch all raw events, starting from the beginning:

```bash
./auto/dev/console scripts/watch
```

### Watch robot commands (same as events)

To watch all raw events, from now onwards:

```bash
./auto/dev/robctl watch commands
```

Starting from the beginning:

```bash
./auto/dev/robctl watch commands --history
```

### Watch board

To watch the toy robot world, viewing the board and all robots:

```bash
./auto/dev/robctl watch world
```

### Control a robot

To control a robot:

```bash
./auto/dev/robctl control ROBOT_NAME
```

Valid commands are:

```
place 0 0 s
place 4 4 n
move
left
right
```
