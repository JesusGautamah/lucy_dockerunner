# frozen_string_literal: true

require_relative "taskhelper"


class TaskHelpers::ComposeTaskhelper < TaskHelpers::Taskhelper
  def compose_command
    @compose_comand ||= compose_command_finder
  end

  private
    def compose_command_finder
      @command = ["docker compose", "docker-compose"]
      @command.each do |command|
        system "#{command} --version > /dev/null 2>&1"
        return command if $?.success?
        command = false unless $?.success?
      end
      raise ComposeError unless command == false
    end
end
