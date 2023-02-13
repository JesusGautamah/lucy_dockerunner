# frozen_string_literal: true

shared_context "rake" do
  let(:task_name) { self.class.top_level_description }
  subject         { Rake.application[task_name] }

  # This allows tasks to be invoked more than once.
  before do
    subject.reenable
  end
end
