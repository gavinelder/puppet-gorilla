# puppet-gorilla (WIP)

Configuration of [Gorilla](https://github.com/1dustindavis/gorilla) via Puppet

Please read the [Gorilla Wiki](https://github.com/1dustindavis/gorilla/wiki) on how to use Gorilla.

## Usage

```yaml
---

include::gorilla

gorilla::url: https://YourWebServer/gorilla/
gorilla::manifest: example
catalogs:
  - alpha
  - beta
gorilla::app_data_path: "C:/gorilla/cache"
gorilla::auth_user: "GorillaRepoUser"
gorilla::auth_pass: "pizzaisyummy"
gorilla::tls_auth: true
gorilla::tls_client_cert: "c:/certs/client.pem"
gorilla::tls_client_key: "c:/certs/client.key"
gorilla::tls_server_cert: "c:/certs/server"
gottlla::version: "2.1.0"
```

## Examples

### Gorilla without TLS Auth (basic setup)

```yaml
gorilla::url: https://YourWebServer/gorilla/
gorilla::auth_user: "GorillaRepoUser"
gorilla::auth_pass: "pizzaisyummy"
catalogs:
  - alpha
  - beta
```

### Gorilla custom install location

```yaml
gorilla::url: https://YourWebServer/gorilla/
gorilla::auth_user: "GorillaRepoUser"
gorilla::auth_pass: "pizzaisyummy"
catalogs:
  - alpha
  - beta
gorilla::app_data_path: "C:/gorilla/cache"
```

### Gorilla custom using Puppet Certs

```yaml
gorilla::url: https://YourWebServer/gorilla/
gorilla::auth_user: "GorillaRepoUser"
gorilla::auth_pass: "pizzaisyummy"
catalogs:
  - alpha
  - beta
gorilla::app_data_path: "C:/gorilla/cache"
gorilla::tls_auth: true
gorilla::tls_client_cert: "${::puppet_ssldir}/certs/${::clientcert}.pem"
gorilla::tls_client_key: "${::puppet_ssldir}/private_keys/${::clientcert}.pem"
# gorilla::tls_server_cert: "c:/certs/server" (Figure out how to do this.)
```

## Requirements

- [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
- [win_scheduled_task](https://github.com/bdemetris/puppet-win_scheduled_task)
