# mod-auth-oidc-client

Example Apache app using the mod_auth_openidc provider.

## Configuration

- Register application with OIDC Provider (e.g. CalNet)
- Replace the placeholder values in `sites-enabled/000-default.conf` with those provided by the OIDC Provider
- Create some self-signed certs in `apache/ssl`

```shell
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout selfsigned.key -out selfsigned.crt -subj "/CN=localhost"
```
