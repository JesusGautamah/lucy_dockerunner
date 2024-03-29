# frozen_string_literal: true

require "lucy_dockerunner"
require "simplecov"
require "rake"
require "dotenv/load"

# load environment variables
Dotenv.load

SimpleCov.start do
  add_filter "/spec/"
  add_filter "/lib/tasks/compose_prod.rake"
  add_filter "/lib/tasks/compose.rake"
  add_group "Tasks", "lib/tasks"
end

# Include spec/support files

Dir[File.expand_path("support/**/*.rb", __dir__)].sort.each { |f| require f }
Rake.application = Rake::Application.new
LucyDockerunner.load_tasks

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
