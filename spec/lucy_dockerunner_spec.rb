# frozen_string_literal: true

RSpec.describe LucyDockerunner do
  it "has a version number" do
    expect(LucyDockerunner::VERSION).not_to be nil
  end

  it "loads rake tasks with superuser and verbose flags" do
    expect(LucyDockerunner.load_tasks).to be_a(Array)
  end
end
