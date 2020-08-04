# The Glassdale PD Criminal API

https://api.glassdale.us

## Setup

### Installations

1. On Windows, install [OpenSSL](https://tecadmin.net/install-openssl-on-windows/).
1. On OSX, install OpenSSL with `brew install openssl`
1. On Linux, install OpenSSL with `sudo apt-get install openssl`

### Private Certificate

1. Create a directory `~/cert` and `cd` to it.
1. Create a file in that directory named `cert.sh`
1. Copy the contents of the [cert.sh gist](https://gist.github.com/stevebrownlee/a8b4077a39a60720bb201b22459f62df) into the file.
1. `chmod +x cert.sh`
1. `./cert.sh localhost`
1. Create following aliases in `.bashrc` for Windows or `.zshrc` for OSX.
    ```sh
    alias hs="serve -l 8080"
    alias shs="serve --ssl-cert ~/cert/server/fullchain.pem --ssl-key ~/cert/server/privkey.pem -l 8080"
    ```
1. `source ~/.zshrc` or `source ~/.bashrc`