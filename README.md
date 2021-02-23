# Naïve Docker

Run [NaïveProxy](https://github.com/klzgrad/naiveproxy) in Docker.

## Usage

- Fill out [Caddy config](config/Caddyfile)
- Put your certificate at `config/cert.pem` and key at `config/key.pem`
- Build the image with `docker build -t naive .`
- Start with `docker-compose up -d`
