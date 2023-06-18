# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def tasks_names
  @tasks_names = %w[install build up down restart clean_all clean_volumes clean_orphans clean_images]
end

def namesp
  @namesp = "compose"
end

def compose_file
  @compose_file ||= ENV.fetch("LUCY_FILE", "docker-compose.yml")
end

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

namespace :compose do
  task :install do
    puts "Installing Blockchain and Database Containers"
    system "#{compose_command} -f #{compose_file} build"
    puts "Creating Database"
    system "#{compose_command} -f #{compose_file} run --rm web rails db:create"
    puts "Migrating Database"
    system "#{compose_command} -f #{compose_file} run --rm web rails db:migrate"
    puts "Seeding Database"
    system "#{compose_command} -f #{compose_file} run --rm web rails db:seed"
    puts "Stopping Containers"
    system "#{compose_command} -f #{compose_file} down"
    puts "Installing Blockchain and Database Containers... Done!"
    puts "This already setup your database with some initial values"
    puts "Start the containers with command: rake compose:up"
    puts "Stop the containers with command: rake compose:down"
    puts "Restart the containers with command: rake compose:restart"
    puts "Clean up the containers with command: rake compose:clean_all"
    puts "Test your containers with command: rake compose:test"
    puts "Build the containers againg with command: rake compose:build"
    puts "rake compose_db command documentation at README.md to see database commands usage examples"
    puts "See the development and test log files in Rails default logs folder when using compose:up"
    puts "-----------------------------------------------------------------------------------"
    puts "Access the web server on port docker configured port"
    puts "http://localhost:PORT"
    puts "Look at README.md for more details."
  end

  task :build do
    puts "Building Compose..."
    system "#{compose_command} -f #{compose_file} build"
    puts "Building Compose... Done!"
  end

  task :up do
    puts compose_command
    puts "Running Compose..."
    system "#{compose_command} -f #{compose_file} up -d --remove-orphans"
    puts "Running Compose... Done!"
  end

  task :down do
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
  end

  task :bot_detach do
    puts "Running Bot Detached..."
    system "#{compose_command} -f #{compose_file} up -d bot"
    puts "Running Bot Detached... Done!"
  end

  task :telegram_detach do
    puts "Running Telegram Detached..."
    system "#{compose_command} -f #{compose_file} up -d telegram"
    puts "Running Telegram Detached... Done!"
  end

  task :discord_detach do
    puts "Running Discord Detached..."
    system "#{compose_command} -f #{compose_file} up -d discord"
    puts "Running Discord Detached... Done!"
  end

  task :nginx_detach do
    puts "Running Nginx Detached..."
    system "#{compose_command} -f #{compose_file} up -d nginx"
    puts "Running Nginx Detached... Done!"
  end

  task :db_detach do
    puts "Running Database Detached..."
    system "#{compose_command} -f #{compose_file} up -d db"
    puts "Running Database Detached... Done!"
  end

  task :redis_detach do
    puts "Running Redis Detached..."
    system "#{compose_command} -f #{compose_file} up -d redis"
    puts "Running Redis Detached... Done!"
  end

  task :restart do
    puts "Restarting Compose..."
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
    puts "Running Compose..."
    system "#{compose_command} -f #{compose_file} up -d --remove-orphans"
    puts "Restarting Compose... Done!"
  end

  task :status do
    puts "Status Compose..."
    system "#{compose_command} -f #{compose_file} ps"
    puts "Status Compose... Done!"
  end

  task :shell do
    puts "Running Shell..."
    system "#{compose_command} -f #{compose_file} run --rm web bash"
    puts "Running Shell... Done!"
  end

  task :clean_all do
    puts "Cleaning Compose..."
    system "sudo docker system prune"
    puts "Cleaning Compose... Done!"
  end

  task :clean_containers do
    puts "Cleaning Containers..."
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
    puts "Removing Containers..."
    system "#{compose_command} -f #{compose_file} rm -f"
    puts "Removing Containers... Done!"
    puts "Cleaning Containers... Done!"
  end

  task :clean_images do
    puts "Cleaning Images..."
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
    puts "Removing Images..."
    system "#{compose_command} -f #{compose_file} rmi -f"
    puts "Removing Images... Done!"
    puts "Cleaning Images... Done!"
  end

  task :clean_volumes do
    puts "Cleaning Volumes..."
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
    puts "Removing Volumes..."
    system "#{compose_command} -f #{compose_file} down -v"
    puts "Removing Volumes... Done!"
    puts "Cleaning Volumes... Done!"
  end

  task :clean_orphans do
    puts "Cleaning Networks..."
    puts "Stopping Compose..."
    system "#{compose_command} -f #{compose_file} down"
    puts "Stopping Compose... Done!"
    puts "Removing Networks..."
    system "#{compose_command} -f #{compose_file} down --remove-orphans"
    puts "Removing Networks... Done!"
    puts "Cleaning Networks... Done!"
  end
end

def compose_exist?
  File.exist?(compose_file)
end

tasks_names.each do |task|
  before_action = "#{namesp}:#{task}"
  Rake::Task[before_action].enhance do
    compose_abort_error = "Compose file not found.\nYou must have a #{compose_file} file.\nYou can change the compose file name by setting LUCY_FILE environment variable."
    abort(compose_abort_error) unless compose_exist?
  end
end
