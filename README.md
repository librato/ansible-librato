# Ansible Role: Librato

An Ansible role that installs and configures the Librato Agent and plugins

## Requirements

None

## Dependencies

None

## Quickstart

The bare minimum required to get started is to set the `email` and `token` variables and include the role:

```yaml
- hosts: all
  roles:
    - { role: librato.librato, librato_email: 'you@domain.com', librato_token: 'your-token-here' }
```

By default, the following plugins are enabled: `cpu`, `df`, `disk`, `swap`, `memory`, `load`.

To include a plugin, set any variables you need for it, then add it to the `librato_enabled_plugins` variable:

```yaml
- hosts: all
  vars:
    librato_apache_path: '/my-status-endpoint'
    librato_enabled_plugins: ['apache']
```

### Supported Plugins

* `cpu`
* `df`
* `memory`
* `load`
* `disk`
* `swap`
* `apache`
* `nginx`
* `nginx_plus`
* `jvm`
* `memcached`
* `varnish`
* `zookeeper`
* `docker`
* `elasticsearch`
* `mongodb`
* `postgresql`
* `mysql`
* `redis`
* `haproxy`

## Usage

### Using custom or upstream collectd plugins

To use your own custom or upstream collectd plugin, simply have another module drop the config into `/opt/collectd/etc/collectd.conf.d/` and any      custom plugins into `/opt/collectd/share/collectd/`.

## Reference

### Plugin: `apache`
  - `librato_apache_protocol`

    **Type**: string

    The protocol to use. Defaults to `http`. Change this to `https` if you require SSL.

  - `librato_apache_host`

    **Type**: string

    The hostname to use. Defaults to `localhost`.
  - `librato.apache.path`

    **Type**: string

    The path to the status page. Defaults to `/server-status`. `?auto` is automatically appended, so no need to include it.

  - `librato_apache_user`

    **Type**: string

    The username to use for password-protected status pages. Defaults to empty.
  - `librato_apache_password`

    **Type**: string

    The password to use for password-protected status pages. Defaults to empty.

### Plugin: `docker`
  - `librato_docker_protocol`

    **Type**: string

    The protocol to use. Defaults to `http`. Change this to `https` if you require SSL.

  - `librato_docker_host`

    **Type**: string

    The Docker hostname. Defaults to `localhost`.

  - `librato_docker_port`

    **Type**: string

    The Docker port. Defaults to `2735`

### Plugin: `elasticsearch`

  - `librato_elasticsearch_protocol`

    **Type**: string

    The protocol to use. Defaults to `http`. Change this to `https` if you require SSL.

  - `librato_elasticsearch_host`

    **Type**: string

    The ElasticSearch hostname. Defaults to `localhost`.

  - `librato_elasticsearch_port_`

    **Type**: string

    The ElasticSearch port. Defaults to `9200`.

  - `librato_elasticsearch_cluster_name`

    **Type**: string

    The ElasticSearch cluster name, if set. Defaults to `nil`.

  - `librato_elasticsearch_verbose`

    **Type**: true/false

    Verbosity trigger of the plugin. Defaults to `true`.

### Plugin: `haproxy`
  - `librato_haproxy_socket_file`

    **Type**: string

    The HAProxy socket file. Defaults to `/run/haproxy/admin.sock`.

  - `librato_haproxy_proxies`

    **Type**: array

    The default proxies to collect. Defaults to `server`, `frontend`, `backend`.

### Plugin: `jvm`
  - `librato_jvm_host`

    **Type**: string

    The JVM host. Defaults to `localhost`.

  - `librato_jvm_service_url`

    **Type**: string

    The JVM service URL to query. Defaults to `service:jmx:rmi:///jndi/rmi://localhost:17264/jmxrmi`.

  - `librato_jvm_mbeans`

    **Type**: mapping

    Additional mbeans to collect. Defaults to empty.

    Format of the mapping is:
    ```yaml
    librato_jvm_mbeans: [
      {
        name: 'mbean name'
        object_name: 'object name'
        instance_prefix': 'instance prefix (optional)',
        instance_from': 'instance from (optional)',
        values: [
          {
            type: 'value type',
            table: true|false,
            attribute: 'attribute'
            instance_prefix: 'instance prefix (optional)',
            instance_from: 'instance from (optional)'
          }
        ]
      }
    ]
    ```

### Plugin: `memcached`
  - `librato_memcached_host`

    **Type**: string

    The memcached hostname. Defaults to `localhost`.

  - `librato_memcached_port`

    **Type**: string

    The memcached port. Defaults to `11211`.

### Plugin: `mongodb`
  - `librato_mongodb_host`

    **Type**: string

    The MongoDB hostname. Defaults to `localhost`.

  - `librato_mongodb_port`

    **Type**: string

    The MongoDB port. Defaults to `27017`.

  - `librato_mongodb_user`

    **Type**: string

    The MongoDB username to connect with. Defaults to `nil`.

  - `librato_mongodb_password`

    **Type**: string

    The MongoDB password to connect with. Defaults to `nil`.

  - `librato_mongodb_databases`

    **Type**: array

    Databases to collect metrics for. Defaults to empty. `admin` database is automatically included in the array.

  - `librato_mongodb_name`

    **Type**: string

    Set the name of the plugin instance. Defaults to `mongodb`.

### Plugin: `mysql`
  - `librato_mysql_databases`

    **Type**: mapping

    Databases to collect metrics for. Defaults to empty.

    Format of the hash is:
    ```yaml
    databases: [
      {
        name: 'mydb'
        host: 'localhost'
        port: 3306
        user: ''
        password: ''
        innodb_stats: true
        slave_stats: false
      }
    ]
    ```

### Plugin: `nginx`
  - `librato_nginx_protocol`

    **Type**: string

    The protocol to use. Defaults to `http`. Change this to `https` if you require SSL.

  - `librato_nginx_host`

    **Type**: string

    The hostname to use. Defaults to `localhost`.

  - `librato_nginx_path`

    **Type**: string

    The path to the status page. Defaults to `/basic_status`.

### Plugin: `nginx_plus`
  - `librato_nginx_plus_protocol`

    **Type**: string

    The protocol to use. Defaults to `http`. Change this to `https` if you require SSL.

  - `librato_nginx_plus_host`

    **Type**: string

    The hostname to use. Defaults to `localhost`.

  - `librato_nginx_plus_path`

    **Type**: string

    The path to the status page. Defaults to `/status`.

  - `librato_nginx_plus_verbose`

    **Type**: string

    Verbosity on/off for the plugin. Defaults to `false`.

### Plugin: `postgresql`
  - `librato_postgresql_socket_file`

    **Type**: string

    The PostgreSQL socket file. Defaults to `/var/run/postgresql`.

  - `librato_postgresql_user`

    **Type**: string

    The PostgreSQL user to connect as. Defaults to `postgresql`.

  - `librato_postgresql_databases`

    **Type**: mapping

    The databases to collect metrics for. Defaults to empty.

    The format of the hash is:
    ```yaml
    databases = [
      {
        name: 'mydb'
        instance: 'baz'
        host: 'localhost'
        port: 5432
        user: ''
        password: ''
        ssl_mode: 'prefer'
      }
    ]
    ```

### Plugin: `redis`
  - `librato_redis_host`

    **Type**: string

    The Redis hostname. Defaults to `localhost`.

  - `librato_redis_port`

    **Type**: string

    The Redis port. Defaults to `6379`.

  - `librato_redis_timeout`

    **Type**: string

    The timeout for connecting to Redis in milliseconds. Defaults to `2000`.

### Plugin: `varnish`

  Varnish has no configurable attributes.

### Plugin: `zookeeper`
  - `librato_zookeeper_host`

    **Type**: string

    The ZooKeeper hostname. Defaults to `localhost`.

  - `librato_zookeeper_port`

    **Type**: string

    The ZooKeeper port. Defaults to `2181`.

### Global Variables

- `librato_email`

  **Type**: string

  The email to use for sending metrics. Use in conjunction with `token`. This attribute is required and defaults to empty.

- `librato_token`

  **Type**: string

  The API token to use for sending metrics. Use in conjunction with `email`. This attribute is required and defaults to empty.

- `librato_version`

  **Type**: string

  The version of the Librato Agent to install.

- `librato_repo_url`

  **Type**: string

  The base URL for the packages. Defaults to Librato's repo URL `https://packagecloud.io/librato/`.

- `librato_repo_base`

  **Type**: string

  The repo base to use. Defaults to Librato's repo collection `librato-collectd`.

- `librato_config_base`

  **Type**: string

  The base path for collectd's config files. Defaults to `/opt/collectd/etc`.

- `librato_plugin_config_path`

  **Type**: string

  The path for collectd's plugin configs. Defaults to `/opt/collectd/etc/collectd.conf.d`.

- `librato_hostname`

  **Type**: string

  The hostname to use for the node.  Defaults to `nil` in favor of using `FQDNLookup`.

- `librato_fqdn_lookup`

  **Type**: true/false

  Perform an FQDN lookup for the hostname. Defaults to `true`.

- `librato_interval`

  **Type**: integer

  The global plugin polling interval in seconds. Defaults to `60`.

- `librato_use_log_file`

  **Type**: true/false

  Write collectd logs to a file. Defaults to `true`.

- `librato_use_syslog`

  **Type**: true/false

  Write collectd logs to syslog. Defaults to `false`.

- `librato_use_logstash`

  **Type**: true/false

  Write collectd logs to a logstash-formatted file. Defaults to `false`.

- `librato_log_file_log_level`

  **Type**: string

  The log level to use for `log_file`. Defaults to `info`.

- `librato_log_file_filename`

  **Type**: string

  The filename to use for `log_file`. Defaults to `/opt/collectd/var/log/collectd.log`.

- `librato_log_file_timestamp`

  **Type**: true/false

  Use timestamps in the log file or not. Defaults to `true`.

- `librato_log_file_print_severity`

  **Type**: true/false

  Include severity levels in the log file or not. Defaults to `true`.

- `librato_syslog_log_level`

  **Type**: string

  The log level to use for `syslog`. Defaults to `info`.

- `librato_logstash_log_level`

  **Type**: string

  The log level to use for `logstash`. Defaults to `info`.

- `librato_logstash_filename`

  **Type**: string

  The file name to use for `logstash`. Defaults to `/opt/collectd/var/log/collectd.json.log`

- `librato_default_plugins`

  **Type**: array

  A list of default plugins to include. Defaults to: `cpu`, `df`, `disk`, `swap`, `memory`, `load`.

- `librato_enabled_plugins`
   
  **Type**: array

  A list of plugins to enable. This is separate from the default plugins and is used to include plugins aside from those. Defaults to empty.

### Supported Platforms

* RHEL 6 / CentOS 6
* RHEL 7 / CentOS 7
* Fedora 23
* Amazon Linux 2016.03
* Ubuntu 12.04
* Ubuntu 14.04
* Ubuntu 15.04
* Ubuntu 15.10
* Ubuntu 16.04
* Debian 7
* Debian 8

### Supported Ansible Versions

This role requires Ansible 2.2 or later. 

## Development

### Testing

Integration tests utilize `kitchen-ansible` and `serverspec`. To run the test suite:

1. Run `bundle install`
2. Run `kitchen test`

#### Testing Amazon Linux

Testing Amazon Linux through `test-kitchen` requires a bit more setup:

1. Ensure `kitchen-ec2` is installed: `gem install kitchen-ec2`
2. Update `.kitchen.yml` to have the correct AWS key ID you're going to use
3. Set `security_group_ids` in the driver section to include a security group accessible from your laptop. Not setting this will use the `default`    security group.
4. Set `transport.ssh_key` to the path of your SSH key. It looks for `id_rsa` by default.

## License

MIT

## Authors & Contributors
Mike Julian (@mjulian)
