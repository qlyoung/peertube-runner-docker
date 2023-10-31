# peertube-runner-docker

[Peertube runner](https://docs.joinpeertube.org/maintain/tools#peertube-runner)
shoved into a container.

## Usage

`docker compose up --build -d`

If this is the first time you have run the container and the runner is not yet
registered, register it with your peertube instance like this:

```
docker compose exec peertube-runner \
  peertube-runner register \
    --url <register_url> \
    --registration-token <token> \
    --runner-name <name>
```

You should see this message:

```
PeerTube instance registered
```

If not, you should get a helpful error message.


After registration, the config file will be placed in
`config/peertube-runner-nodejs` and next time the container starts up it will
use this config file.
