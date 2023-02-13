# frozen_string_literal: true

require "English"
require_relative "taskhelper"

module TaskHelpers
  class ComposeTaskhelper < TaskHelpers::Taskhelper
    def compose_command
      @compose_comand ||= compose_command_finder
    end

    private

    def compose_command_finder
      @command = ["docker compose", "docker-compose"]
      @command.each do |command|
        system "#{command} --version > /dev/null 2>&1"
        return command if $CHILD_STATUS.success?

        command = false unless $CHILD_STATUS.success?
      end
      raise ComposeError unless command == false
    end
  end
end
