# docker-opsweekly

> A fully contained opsweekly instance.

## Usage

It's probably best if you `FROM` this image and replace the `config.php` and mysql password.

__Environmental Variables__

- `MYSQL_ROOT_PASSWORD` from the official [mysql image](https://registry.hub.docker.com/_/mysql/)
- `OPSWEEKLY_MYSQL_PASSWORD` (the `Rakefile` has it set as 'opsweekly')

## Todo

- optionally install providers
  - I figure reading env variables and if set run provider specific setup
  - fitbit
  - pagerduty
