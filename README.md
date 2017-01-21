# docker-golang-tools

[![](https://images.microbadger.com/badges/image/graze/golang-tools.svg)](https://microbadger.com/images/graze/golang-tools "Get your own image badge on microbadger.com")

:wrench: A set of tools to develop in golang but not required in production.

## Supported tags and respective `Dockerfile` links

- [`tip`, `latest` (Dockerfile.tip)](Dockerfile.tip)
- [`1.8` (Dockerfile.1.8)](Dockerfile.1.8)
- [`1.7` (Dockerfile.1.7)](Dockerfile.1.7)
- [`1.6` (Dockerfile.1.6)](Dockerfile.1.6)

## The tools

- [glide](https://glide.sh): Package management using the `vendor` directory
- [godoc](https://godoc.org/golang.org/x/tools/cmd/godoc): Documentation
- [gofmt](https://golang.org/cmd/gofmt/): Auto formatter
- [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports): Like gofmt, but ensures correct imports
- [golint](https://github.com/golang/lint): Ensure the provided go code conforms to some standards

## Usage

You can use this image directly

```bash
$ docker run --rm -it graze/golang-tools -v .:/go/src/github.com/package/dir -w /go/src/github.com/package/dir <command>
```

Or by using a docker-compose entry:

```yaml
version: '2'
services:
    tools:
        image: graze/golang-tools
        volumes:
            - .:/go/src/github.com/graze/app
        working_dir: /go/src/github.com/graze/app
```

This can then be called using:

```bash
$ docker-compose run --rm tools <command>
```
