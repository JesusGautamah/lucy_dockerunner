# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"
require_relative "../rake/hooks"

def tasks_names
  @tasks_names = %w[install build up down restart clean_all clean_volumes clean_orphans clean_images clean_networks
                    clean_stopped]
end

def namesp
  @namesp = "compose"
end

def dev_compose_file
  @dev_compose_file ||= "docker-compose.yml"
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
    system "sudo #{compose_command} build"
    puts "Creating Database"
    system "sudo #{compose_command}  run --rm web rails db:create"
    puts "Migrating Database"
    system "sudo #{compose_command}  run --rm web rails db:migrate"
    puts "Seeding Database"
    system "sudo #{compose_command}  run --rm web rails db:seed"
    puts "Stopping Containers"
    system "sudo #{compose_command}  down"
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
    puts "Access the web server on port 80."
    puts "http://localhost"
    puts "Look at README.md for more details."
  end

  task :build do
    puts "Building Compose..."
    system "sudo #{compose_command}  build"
    puts "Building Compose... Done!"
  end

  task :up do
    puts compose_command
    puts "Running Compose..."
    system "sudo #{compose_command} up -d --remove-orphans"
    puts "Running Compose... Done!"
  end

  task :down do
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
  end

  task :db_detach do
    puts "Running Database Detached..."
    system "sudo #{compose_command}  up -d db"
    puts "Running Database Detached... Done!"
  end

  task :redis_detach do
    puts "Running Redis Detached..."
    system "sudo #{compose_command}  up -d redis"
    puts "Running Redis Detached... Done!"
  end

  task :back_detach do
    puts "Running Backend Detached..."
    system "sudo #{compose_command}  up -d --remove-orphans db redis sidekiq"
    puts "Running Backend Detached... Done!"
  end

  task :restart do
    puts "Restarting Compose..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Running Compose..."
    system "sudo #{compose_command}  up -d --remove-orphans"
    puts "Restarting Compose... Done!"
  end

  task :status do
    puts "Status Compose..."
    system "sudo #{compose_command}  ps"
    puts "Status Compose... Done!"
  end

  task :shell do
    puts "Running Shell..."
    system "sudo #{compose_command}  run --rm web bash"
    puts "Running Shell... Done!"
  end

  task :clean_all do
    puts "Cleaning Compose..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Removing Containers..."
    system "sudo #{compose_command}  rm -f"
    puts "Removing Containers... Done!"
    puts "Removing Images..."
    system "sudo #{compose_command}  rmi -f"
    puts "Removing Images... Done!"
    puts "Removing Volumes..."
    system "sudo #{compose_command}  down -v"
    puts "Removing Volumes... Done!"
    puts "Removing Orphans..."
    system "sudo #{compose_command}  down --remove-orphans"
    puts "Removing Networks... Done!"
    puts "Cleaning Compose... Done!"
  end

  task :clean_containers do
    puts "Cleaning Containers..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Removing Containers..."
    system "sudo #{compose_command}  rm -f"
    puts "Removing Containers... Done!"
    puts "Cleaning Containers... Done!"
  end

  task :clean_images do
    puts "Cleaning Images..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Removing Images..."
    system "sudo #{compose_command}  rmi -f"
    puts "Removing Images... Done!"
    puts "Cleaning Images... Done!"
  end

  task :clean_volumes do
    puts "Cleaning Volumes..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Removing Volumes..."
    system "sudo #{compose_command}  down -v"
    puts "Removing Volumes... Done!"
    puts "Cleaning Volumes... Done!"
  end

  task :clean_orphans do
    puts "Cleaning Networks..."
    puts "Stopping Compose..."
    system "sudo #{compose_command}  down"
    puts "Stopping Compose... Done!"
    puts "Removing Networks..."
    system "sudo #{compose_command}  down --remove-orphans"
    puts "Removing Networks... Done!"
    puts "Cleaning Networks... Done!"
  end
end

def compose_checker
  !File.exist?(compose_file)
end

def dockerfile_checker
  !File.exist?("Dockerfile")
end

tasks_names.each do |task|
  before_action = "#{namesp}:#{task}"
  before before_action do
    dockerfile_checker ? abort("Dockerfile not found.\nYou must have a Dockerfile file.") : nil
    compose_checker ? (abort "Compose file not found.\nFor development, you must have a #{dev_compose_file} file.") : nil
  end
end
