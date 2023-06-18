# frozen_string_literal: true

require "English"
require_relative "taskhelper"

module TaskHelpers
  # ComposeTaskhelper
  class ComposeTaskhelper < TaskHelpers::Taskhelper
    def compose_command
      @compose_command ||= find_compose_command
    end

    private

    def find_compose_command
      superuser = ENV.fetch("LUCY_SU", false)
      @command = ["docker compose", "docker-compose"]
      @command = ["#{superuser} docker compose", "#{superuser} docker-compose"] if @superuser != false

      @command.each do |command|
        system "#{command} --version > /dev/null 2>&1"
        puts "YOU'RE USING SUPERUSER PRIVILEGES" if superuser != false
        puts "Using #{command}..." if $CHILD_STATUS.success?
        return command if $CHILD_STATUS.success?

        raise ComposeError
      end
    end
  end
end
