# did-ssh

## Description
This module provides the tools necessary to allow users to authenticate to
a ssh server using the public/private keypair associated with a
[Veres One](https://veres.one/) DID.

The included `did-authorized-keys` utility program works in conjunction with
`sshd` running on the server. When a user attempts to login using the private
key associated with their DID, the server will retrieve the users public key
from the Veres One ledger.

Users are able to manage the keys associated with their Veres One DID using
the [did-client](https://github.com/digitalbazaar/did-client). This reduces
the burden of key management for system administrators.

## System Requirements
- Node 8.x
- Working `gcc` tool chain for building native dependencies
- Ubuntu 16.04+
- git


## Client Installation
Clone this repository and run `npm install`.
```
git clone https://github.com/digitalbazaar/did-ssh.git
cd did-ssh
npm install
```
### Generate a DID and Public/Private Key Files
Public and private key files are stored in `~/.ssh`. Make note of the DID
for future reference.
```
./generate-did

# optionally encrypt the ssh private key with a passphrase
./generate-did -p mySecretPassphrase
```

## Server Installation
Clone this repository and run the included `install.sh` script with:
```
# as `ubuntu` user in the home directory `/home/ubuntu`
git clone https://github.com/digitalbazaar/did-ssh.git
cd did-ssh
sudo ./install.sh
```
Edit the `user.yml` file and restart `sshd`:
```
# use the editor of your choice
# use the examples given to associate linux users with DIDs
sudo nano /did-ssh/users.yml
sudo systemctl restart ssh.service
# check for sshd errors
sudo journalctl -xe
```
