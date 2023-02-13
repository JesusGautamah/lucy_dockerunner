# LucyDockerunner

Lucy Dockerunner is a Ruby gem that provides a simple wrapper around the Docker Compose CLI to make it easier to run Docker Compose commands from Ruby.

[![Gem Version](https://badge.fury.io/rb/lucy_dockerunner.svg)](https://badge.fury.io/rb/lucy_dockerunner)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ruby Version](https://img.shields.io/badge/Ruby-2.6.0%2B-blue.svg)](https://www.ruby-lang.org/en/)

Ruby version: >= 2.6.0

This gem version: 0.1.4

## Installation

You can install the gem by executing:

    $ gem install lucy_dockerunner

Or add it to your Gemfile:

    gem 'lucy_dockerunner'

## Usage

### Add the following code to your Rakefile to load the tasks
````ruby
require 'lucy_dockerunner'

LucyDockerunner.load_tasks
````

###### Docker actions
* `rake compose:install` - build docker compose and migrate the database
* `rake compose:build` - build docker compose services
* `rake compose:up` - start the docker compose services
* `rake compose:down` - stop the docker compose services
* `rake compose:status` - show the status of the docker compose services
* `rake compose:shell` - open a shell in the web service
* `rake compose:db_detach` - detach the database from the docker compose services
* `rake compose:redis_detach` - detach the redis from the docker compose services
* `rake compose:back_detach` - detach the backend(redis, sidekiq, db) from the docker compose services
* `rake compose:restart` - restart the docker compose services
* `rake compose:clean_all` - clean all docker compose services
* `rake compose:clean_images` - clean all docker compose images
* `rake compose:clean_volumes` - clean all docker compose volumes
* `rake compose:clean_orphans` - clean all docker compose orphans
* `rake compose:clean_containers` - clean all docker compose containers
#### Database actions
* `rake compose_db:migrate` - migrate the database
* `rake compose_db:reset` - reset the database
* `rake compose_db:drop` - drop the database
* `rake compose_db:create` - create the database
* `rake compose_db:seed` - seed the database
* `rake compose_db:rollback` - rollback the database
* `rake compose_db:setup` - setup the database
* `rake compose_db:complete_setup` - complete setup the database
* `rake compose_db:reset_setup` - drop and setup the database
* `rake compose_db:reset` - reset the database

### Tests actions
* `rake compose_test:all` - run all tests
* `rake compose_test:clean_all` - run all tests after cleaning docker compose services
* `rake compose_test:controllers` - run controllers tests
* `rake compose_test:models` - run models tests
* `rake compose_test:requests` - run requests tests
* `rake compose_test:helpers` - run helpers tests
* `rake compose_test:mailers` - run mailers tests
* `rake compose_test:routing` - run routing tests
* `rake compose_test:views` - run views tests

### LOGS actions
* `rake compose_logs:web` - show web logs
* `rake compose_logs:db` - show db logs
* `rake compose_logs:redis` - show redis logs
* `rake compose_logs:sidekiq` - show sidekiq logs
* `rake compose_logs:all` - show all logs
* `rake compose_logs:tail_web` - tail web logs
* `rake compose_logs:tail_db` - tail db logs
* `rake compose_logs:tail_redis` - tail redis logs
* `rake compose_logs:tail_sidekiq` - tail sidekiq logs
* `rake compose_logs:tail_all` - tail all logs

## Start the docker compose services
````bash
$ rake compose:up
````
### Access the web service
http://localhost


## References
The code code inside the 'lib/rake/hooks.rb' file is based on the code of the [rake-hooks](https://github.com/guillermo/rake-hooks) from Guillermo Iguaran, Joel Moss as described in the [Ruby Toolbox](https://www.ruby-toolbox.com/projects/rake-hooks) page.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JesusGautamah/lucy_dockerunner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/JesusGautamah/lucy_dockerunner/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LucyDockerunner project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JesusGautamah/lucy_dockerunner/blob/master/CODE_OF_CONDUCT.md).
