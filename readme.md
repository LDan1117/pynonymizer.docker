# pynonymizer.docker

This service provides a Dockerized version of [Pynonymizer](https://github.com/rwnx/pynonymizer), a tool for anonymizing databases.

## Usage

### Prerequisites

Before using this service, ensure you have the following installed:

- Docker: Follow the [official Docker documentation](https://docs.docker.com/get-docker/) for installation instructions.

### Docker Setup

Clone this repository and build the image:

```bash
   git clone https://github.com/LDan1117/pynonymizer.docker.git
   cd pynonymizer.docker
   docker-compose build
```

### Anonymizing Databases

1. Edit environment variables in `.env.local` file to match your database
1. Run `docker-compose up` and observe the output.

## Customization

If you wish to anonymize other databases or customize the anonymization strategies, you can create your own strategy files and mount them into the Docker container. Ensure that the paths provided in the environment file match the paths of your strategy files.
