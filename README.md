# xray-nginx-docker
Marzban + Vaultwarden + AdguardHome w/ nginx reverse proxy and acme.sh via Docker compose

- Unzip the latest xray release to ./marzban/core/
- Skim through the config files first and edit all the necessary variables
- Adguard Home requires 3000:3000/tcp to be allowed for the initial setup (add it next to 853:853 or use proxy_pass http://adguardhome:3000/ via nginx, remove after you're done)
- Run with `sudo docker compose up -d`. Use `sudo docker exec acme.sh --command` to set up certificate issue and renewal. Recommended way - https://github.com/acmesh-official/acme.sh/wiki/dnsapi#dns_cf
- Restart and set everything else up

- update-containers.sh does exactly what it says (pulls the latest tag, rebuilds containers if needed and removes redundant images).

- In order to use DoH, fill in the "HTTPS port" field in the Encryption settings panel with any port you want (it won't be used), then set `allow_unencrypted_doh: true` in AdGuardHome.yaml to allow AdGuard Home to respond to DoH requests without TLS encryption.

Sources:
- Marzban - https://github.com/Gozargah/Marzban
- Xray examples - https://github.com/XTLS/Xray-examples/tree/main/VLESS-TCP-XTLS-Vision
- Vaultwarden - https://github.com/dani-garcia/vaultwarden/wiki/Using-Docker-Compose
- Adguard Home - [dbeley/docker-compose](https://github.com/dbeley/docker-compose/blob/master/adguard-home/docker-compose.yml), [official documentation](https://adguard-dns.io/kb/adguard-home/faq/#reverseproxy)
- acme.sh - [setup](https://github.com/acmesh-official/acme.sh/wiki/Run-acme.sh-in-docker#3-run-acmesh-as-a-docker-daemon), [dnsapi](https://github.com/acmesh-official/acme.sh/wiki/dnsapi)
