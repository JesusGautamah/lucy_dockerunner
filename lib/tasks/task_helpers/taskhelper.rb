# frozen_string_literal: true

module TaskHelpers
  # Taskhelper
  class Taskhelper
    # Compose Error
    class ComposeError < StandardError
      def initialize(message = "Docker Compose is not installed")
        super
      end
    end

    private

    def dev_error(error)
      return unless env_acceptable?

      puts "#{error.class}: #{error.message}"
      puts error.backtrace
    end

    def env_acceptable?
      # Rails.env.development? || Rails.env.test?
      true
    end
  end
end
