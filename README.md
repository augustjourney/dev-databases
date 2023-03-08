# Database for local development

This is a small scipt that run some databases for local development in docker. I created it just to have a quick way to run some databases and switch among them.

## How to use

First, you need to have docker installed. Then, you need to make the script executable by running the following command:

```sh
chmod +x db.sh
```

### Run all services

When passing no flags, all services will be run.

```sh
./db.sh
```

### Run specific service or services

To run only one service or a combination of services, you can use the following flags: -m = Mongodb, -p = Postgres, -r = Redis.

Run only Mongodb

```sh
./db.sh -m
```

Run only Postgres

```sh
./db.sh -p
```

RUn only Redis

```sh
./db.sh -r
```

Run Mongodb + Redis

```sh
./db.sh -mr
```

Run Postgres + Redis

```sh
./db.sh -pr
```

Shut down services

```sh
./db.sh -d
```