# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

namespace :compose_logs do
  task :discord do
    puts "Showing Discord Logs..."
    system "#{compose_command} -f #{compose_file} logs discord"
    puts "Showing Discord Logs... Done!"
  end

  task :telegram do
    puts "Showing Telegram Logs..."
    system "#{compose_command} -f #{compose_file} logs telegram"
    puts "Showing Telegram Logs... Done!"
  end

  task :bot do
    puts "Showing Bot Logs..."
    system "#{compose_command} -f #{compose_file} logs bot"
    puts "Showing Bot Logs... Done!"
  end

  task :nginx do
    puts "Showing Nginx Logs..."
    system "#{compose_command} -f #{compose_file} logs nginx"
    puts "Showing Nginx Logs... Done!"
  end

  task :web do
    puts "Showing Web Logs..."
    system "#{compose_command} -f #{compose_file} logs web"
    puts "Showing Web Logs... Done!"
  end

  task :db do
    puts "Showing Database Logs..."
    system "#{compose_command} -f #{compose_file} logs db"
    puts "Showing Database Logs... Done!"
  end

  task :redis do
    puts "Showing Redis Logs..."
    system "#{compose_command} -f #{compose_file} logs redis"
    puts "Showing Redis Logs... Done!"
  end

  task :sidekiq do
    puts "Showing Sidekiq Logs..."
    system "#{compose_command} -f #{compose_file} logs sidekiq"
    puts "Showing Sidekiq Logs... Done!"
  end

  task :all do
    puts "Showing All Logs..."
    system "#{compose_command} -f #{compose_file} logs"
    puts "Showing All Logs... Done!"
  end

  task :tail_discord do
    puts "Tailing Discord Logs..."
    system "#{compose_command} -f #{compose_file} logs -f discord"
    puts "Tailing Discord Logs... Done!"
  end

  task :tail_telegram do
    puts "Tailing Telegram Logs..."
    system "#{compose_command} -f #{compose_file} logs -f telegram"
    puts "Tailing Telegram Logs... Done!"
  end

  task :tail_bot do
    puts "Tailing Bot Logs..."
    system "#{compose_command} -f #{compose_file} logs -f bot"
    puts "Tailing Bot Logs... Done!"
  end

  task :tail_nginx do
    puts "Tailing Nginx Logs..."
    system "#{compose_command} -f #{compose_file} logs -f nginx"
    puts "Tailing Nginx Logs... Done!"
  end

  task :tail_web do
    puts "Tailing Web Logs..."
    system "#{compose_command} -f #{compose_file} logs -f web"
    puts "Tailing Web Logs... Done!"
  end

  task :tail_db do
    puts "Tailing Database Logs..."
    system "#{compose_command} -f #{compose_file} logs -f db"
    puts "Tailing Database Logs... Done!"
  end

  task :tail_redis do
    puts "Tailing Redis Logs..."
    system "#{compose_command} -f #{compose_file} logs -f redis"
    puts "Tailing Redis Logs... Done!"
  end

  task :tail_sidekiq do
    puts "Tailing Sidekiq Logs..."
    system "#{compose_command} -f #{compose_file} logs -f sidekiq"
    puts "Tailing Sidekiq Logs... Done!"
  end

  task :tail_all do
    puts "Tailing All Logs..."
    system "#{compose_command} -f #{compose_file} logs -f"
    puts "Tailing All Logs... Done!"
  end
end
