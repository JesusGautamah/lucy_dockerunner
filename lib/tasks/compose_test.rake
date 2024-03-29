# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

namespace :compose_test do
  task :all do
    puts "Running Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec"
    puts "Running Test... Done!"
  end

  task :clean_test do
    puts "Running Clean Test..."
    system "rake compose:clean_all"
    puts "Cleaning Compose Images... Done!"
    puts "Running Tests ..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec"
    puts "Running Clean Test... Done!"
  end

  task :controllers do
    puts "Running Controllers Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/controllers"
    puts "Running Controllers Test... Done!"
  end

  task :models do
    puts "Running Models Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/models"
    puts "Running Models Test... Done!"
  end

  task :requests do
    puts "Running Requests Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/requests"
    puts "Running Requests Test... Done!"
  end

  task :helpers do
    puts "Running Helpers Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/helpers"
    puts "Running Helpers Test... Done!"
  end

  task :mailers do
    puts "Running Mailers Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/mailers"
    puts "Running Mailers Test... Done!"
  end

  task :routing do
    puts "Running Routing Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/routing"
    puts "Running Routing Test... Done!"
  end

  task :views do
    puts "Running Views Test..."
    system "#{compose_command} -f #{compose_file} run --rm web bundle exec rspec spec/views"
    puts "Running Views Test... Done!"
  end
end
