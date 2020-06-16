# ytDownloaderOpenVpnDocker

For the extra slow download experience of ytDownloader behind a Vpn

1. Build the iamge: docker image build -t ytdownloader .
2. Add the config folder to your workingDir: mkdir config
3. Add your personal OpenVpn config files to config folder --> see docker-compose-linux.yml
4. Modify your .ovpn file
- Add: auth-user-pass /etc/openvpn/easy-rsa/keys/auth.txt
- Add: ca /etc/openvpn/easy-rsa/keys/ca.crt
- Add: cert /etc/openvpn/easy-rsa/keys/client.crt
- Add: key /etc/openvpn/easy-rsa/keys/client.key
5. Create a auth.txt file in your config folder --> add username and password for your openvpn config, seperate by a new line
6. Run: docker-compose -f docker-compose-linux.yml up