# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

namespace :compose_db do
  task :drop do
    puts "Dropping Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:drop"
    puts "Dropping Database... Done!"
  end

  task :rollback do
    puts "Rolling Back Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rails db:rollback"
    puts "Rolling Back Database... Done!"
  end

  task :complete_setup do
    puts "Setting up Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:create"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:migrate"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:seed"
    puts "Setting up Database... Done!"
  end

  task :setup do
    puts "Setting up and seeding Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:setup"
    puts "Setting up and seeding Database... Done!"
  end

  task :create do
    puts "Creating Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:create"
    puts "Creating Database... Done!"
  end

  task :migrate do
    puts "Migrating Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:migrate"
    puts "Migrating Database... Done!"
  end

  task :seed do
    puts "Seeding Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:seed"
    puts "Seeding Database... Done!"
  end

  task :reset_setup do
    puts "Resetting Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:drop"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:setup"
    puts "Resetting up Database... Done!"
  end

  task :reset do
    puts "Resetting Database..."
    system "#{compose_command} -f #{compose_file} run --rm web rake db:drop"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:create"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:migrate"
    system "#{compose_command} -f #{compose_file} run --rm web rake db:seed"
    puts "Resetting Compose... Done!"
  end

  task :force_reset do
    puts "Force Resetting Database..."
    system "rake compose:down"
    system "rake compose_db:reset"
    puts "Force Resetting Database... Done!"
  end
end
