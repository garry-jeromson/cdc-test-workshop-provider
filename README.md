# CDC Testing Workshop
A demonstration of how CDC testing works in practice.


## Getting started

This example shows two applications/services talking to each other; both are Dockerised, so all you need is Docker and 
`make`. Building the images and running the tests can be done by running:

```shell
make build
make cdc-tests
```

- Docker config
- Makefile
- Typescript consumer + tests
- Python provider + tests