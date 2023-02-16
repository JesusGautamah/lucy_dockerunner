# frozen_string_literal:true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def tasks_names
  @tasks_names = %w[install build up down restart clean_all clean_volumes clean_orphans clean_images clean_networks
                    clean_stopped]
end

def namesp
  @namesp = "compose_prod"
end

def compose_file
  @compose_file ||= "docker-compose.prod.yml"
end

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

def ask(question)
  puts question
  $stdin.gets.chomp
end

namespace :compose_prod do
  task :check_if_file_exists do
    puts "Checking if docker-compose.prod.yml exists"
    raise ComposeError unless File.exist?(file)

    puts "Checking if docker-compose.prod.yml exists... Done!"
  end

  task :install do
    puts "Installing Blockchain and Database Containers \n
    WARNING: This will delete all your data, and you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Installing Blockchain and Database Containers"
      system "sudo #{compose_command} -f docker-compose.prod.yml build"
      puts "Creating Database"
      system "sudo #{compose_command} -f docker-compose.prod.yml run --rm web rails db:create"
      puts "Migrating Database"
      system "sudo #{compose_command} -f docker-compose.prod.yml run --rm web rails db:migrate"
      puts "Seeding Database"
      system "sudo #{compose_command} -f docker-compose.prod.yml run --rm web rails db:seed"
      puts "Stopping Containers"
      system "sudo #{compose_command} -f docker-compose.prod.yml down"
      puts "Installing Blockchain and Database Containers... Done!"
      puts "This already setup your database with some initial values"
      puts "Start the containers with command: rake compose_prod:up"
      puts "Stop the containers with command: rake compose_prod:down"
      puts "Restart the containers with command: rake compose_prod:restart"
      puts "Clean up the containers with command: rake compose_prod:clean_all"
      puts "Build the containers againg with command: rake compose_prod:build"
      puts "rake compose_db_prod command documentation at README.md to see database commands usage examples"
      puts "See the production log files in Rails default logs folder when using compose_prod:up"
      puts "Alternatively, you can use rake compose_prod_logs:all to see all logs"
      puts "Read documentation for more compose_db_prod, compose_prod_logs, and compose_prod commands"
      puts "-----------------------------------------------------------------------------------"
      puts "Access the web server on port 80."
      puts "http://localhost"
      puts "Look at README.md for more details."
    else
      puts "Installation cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :build do
    puts "Building Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Building Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml build"
      puts "Building Compose... Done!"
    else
      puts "Build cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :up do
    puts "Running Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Running Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml up -d --remove-orphans"
      puts "Running Compose... Done!"
    else
      puts "Running cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :down do
    puts "Stopping Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Stopping Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml down"
      puts "Stopping Compose... Done!"
    else
      puts "Stopping cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :restart do
    puts "Restarting Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Restarting Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml restart"
      puts "Restarting Compose... Done!"
    else
      puts "Restarting cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :status do
    puts "Status of Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Status of Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml ps"
      puts "Status of Compose... Done!"
    else
      puts "Status cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :shell do
    puts "Opening shell in Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Opening shell in Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml exec web bash"
      puts "Opening shell in Compose... Done!"
    else
      puts "Opening shell cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :clean_all do
    puts "Cleaning Compose... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Cleaning Compose..."
      system "sudo #{compose_command} -f docker-compose.prod.yml down --volumes --remove-orphans"
      puts "Cleaning Compose... Done!"
    else
      puts "Cleaning cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :clean_containers do
    puts "Cleaning Containers... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Stopping Containers"
      system "sudo #{compose_command} -f docker-compose.prod.yml down"
      puts "Stopping Containers... Done!"
      puts "Cleaning Containers..."
      system "sudo #{compose_command} -f docker-compose.prod.yml rm -f"
      puts "Cleaning Containers... Done!"
    else
      puts "Cleaning cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :clean_images do
    puts "Cleaning Images... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Cleaning Images..."
      system "sudo #{compose_command} -f docker-compose.prod.yml rmi -f"
      puts "Cleaning Images... Done!"
    else
      puts "Cleaning cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :clean_volumes do
    puts "Cleaning Volumes... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Cleaning Volumes..."
      system "sudo #{compose_command} -f docker-compose.prod.yml down --volumes"
      puts "Cleaning Volumes... Done!"
    else
      puts "Cleaning cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
  end

  task :clean_orphans do
    puts "Cleaning Orphans... WARNING: you are running this in production"
    # ask in terminal if you want to continue
    choice = ask("Are you sure you want to continue? (y/n)")
    if choice == "y"
      puts "Cleaning Orphans..."
      system "sudo #{compose_command} -f docker-compose.prod.yml down --remove-orphans"
      puts "Cleaning Orphans... Done!"
    else
      puts "Cleaning cancelled"
    end
    puts "-----------------------------------------------------------------------------------"
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
  bef before_action do
    docker_abort_error = "Dockerfile not found.\nYou must have a Dockerfile file."
    compose_abort_error = "Compose file not found.\nYou must have a docker-compose.prod.yml file."
    dockerfile_checker ? abort(docker_abort_error) : puts("Dockerfile found")
    compose_checker ? abort(compose_abort_error) : puts("Compose Production file found")
  end
end
