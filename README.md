# Yappa Mailcatcher Docker Image

This adds mailcatcher, which is accessible through your boot2docker ip on port 1080. To find out which IP your boot2docker is on, type `boot2docker ip` in your terminal. Mailcatcher will be running on http://\<boot2dockerIp\>:1080

## Usage

Add the following to your docker-compose.yml file:

```YAML
mailcatcher:
    image: yappabe/mailcatcher
    ports:
        - 1025:1025
        - 1080:1080
```
Next, add this container to your php container's links.

You can now use mailcatcher as an smtp server, simply use 'mailcatcher', or whatever you named this container as host on port 1025.

## References
* http://mailcatcher.me/
