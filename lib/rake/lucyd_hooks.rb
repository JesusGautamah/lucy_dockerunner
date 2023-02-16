# frozen_string_literal: true

# from https://github.com/guillermo/rake-hooks, authors Guillermo Iguaran, Joel Moss
module Rake
  # module Rake::Hooks
  module LucydHooks
    def bef(*task_names, &new_task)
      task_names.each do |task_name|
        old_task = Rake.application.instance_variable_get("@tasks").delete(task_name.to_s)
        next unless old_task

        desc old_task.full_comment if old_task.respond_to?(:full_comment)
        task task_name => old_task.prerequisites do
          new_task.call
          old_task.invoke
        end
      end
    end
  end

  Rake::DSL.include Rake::LucydHooks if defined?(Rake::DSL)
  include Rake::LucydHooks unless self.class.included_modules.include?(Rake::LucydHooks)
end
