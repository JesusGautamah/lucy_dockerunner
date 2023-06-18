# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"

def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_command ||= task_helper.compose_command
end

namespace :compose_assets do
  task :precompile do
    puts "Precompiling Assets..."
    system "#{compose_command} -f #{compose_file} run web rake assets:precompile"
    puts "Precompiling Assets... Done!"
  end

  task :clean do
    puts "Cleaning Assets..."
    system "#{compose_command} -f #{compose_file} run web rake assets:clean"
    puts "Cleaning Assets... Done!"
  end

  task :clobber do
    puts "Clobbering Assets..."
    system "#{compose_command} -f #{compose_file} run web rake assets:clobber"
    puts "Clobbering Assets... Done!"
  end
end
