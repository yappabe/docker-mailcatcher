# Yappa Mailcatcher Docker Image

## Usage

Add the following to your docker-compose.yml file:

```
mailcatcher:
    image: yappabe/mailcatcher
    ports:
        - 1025:1025
        - 1080:1080
```
