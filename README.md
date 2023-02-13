# LucyDockerunner

Lucy Dockerunner is a Ruby gem that provides a simple wrapper around the Docker Compose CLI to make it easier to run Docker Compose commands from Ruby.

## Installation

You can install the gem by executing:

    $ gem install lucy_dockerunner

Or add it to your Gemfile:

    gem 'lucy_dockerunner'

###### Docker actions
* `rake compose:install` - build docker compose and migrate the database
* `rake compose:build` - build docker compose services
* `rake compose:up` - start the docker compose services
* `rake compose:down` - stop the docker compose services
* `rake compose:db_detach` - detach the database from the docker compose services
* `rake compose:redis_detach` - detach the redis from the docker compose services
* `rake compose:back_detach` - detach the backend(redis, sidekiq, db) from the docker compose services
* `rake compose:restart` - restart the docker compose services
* `rake compose:clean_all` - clean all docker compose services
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
* `rake compose_logs:follow_web` - follow web logs
* `rake compose_logs:follow_db` - follow db logs
* `rake compose_logs:follow_redis` - follow redis logs
* `rake compose_logs:follow_sidekiq` - follow sidekiq logs
* `rake compose_logs:follow_all` - follow all logs

## Start the blockchain
````bash
$ rake compose:up
````
### Access the blockchain web interface
http://localhost
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lucy_dockerunner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/lucy_dockerunner/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LucyDockerunner project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lucy_dockerunner/blob/master/CODE_OF_CONDUCT.md).
