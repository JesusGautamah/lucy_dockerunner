# frozen_string_literal: true

require "English"
require_relative "taskhelper"

module TaskHelpers
  # ComposeTaskhelper
  class ComposeTaskhelper < TaskHelpers::Taskhelper
    def compose_command
      @compose_command ||= compose_command_finder
    end

    private

    def compose_command_finder
      @command = ["docker compose", "docker-compose"]
      @command.each do |command|
        system "#{command} --version > /dev/null 2>&1"
        return command if $CHILD_STATUS.success?

        command = false
        raise ComposeError if command == false
      end
    end
  end
end
