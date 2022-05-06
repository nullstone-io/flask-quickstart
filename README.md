# Python Flask Quickstart

This is a Python Flask Quickstart for [Nullstone](https://nullstone.io).
This is based on the Flask official [quickstart guide](https://flask.palletsprojects.com/en/2.1.x/quickstart/).

This uses the Nullstone official [nullstone/flask](https://hub.docker.com/repository/docker/nullstone/flask) image.

## How to launch via Nullstone

1. Create a public web app. (Remember `app-name` for later)
2. Add the `SECRET_KEY for Flask Cookies` capability to the app.
3. Provision
  ```shell
  nullstone up --wait --block=<app-name> --env=<env-name>
  ```
4. Build, push, and deploy
  ```shell
  docker build -t flask-app .
  nullstone launch --source=flask-app --app=<app-name> --env=<env-name>
  ```

## How to run locally

You can run this project locally inside Docker or using elixir alone.
To use docker, this project contains `docker-compose.yml` that runs with `MIX_ENV=dev`.
This setup ensures that using Docker doesn't inhibit typical development workflows:
- Hot reload is configured so that changes to the app doesn't require a reboot
- Dependencies are installed on boot of docker container
- `FLASK_DEBUG` is set to enable the debugger.

```shell
docker compose up
```

Visit [http://localhost:9000](http://localhost:9000).

### Hot reload

The `app` in `docker-compose.yml` is configured to run flask in debug mode.
You do not need to rebuild/restart the flask app when making changes to code.

### Update dependencies

Any time you change `requirements.txt`, you need to update your dependencies.
The dependencies will be installed on boot of the docker container; restart the container to update.

```shell
docker compose restart app
```
