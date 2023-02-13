# frozen_string_literal: true

require_relative "lucy_dockerunner/version"
# require "rake/hooks"

module LucyDockerunner
  class Error < StandardError; end
  
  class << self
    def load_tasks
      Dir[File.join(__dir__, 'tasks', '*.rake')].each { |r| load r }
    end
  end
end
