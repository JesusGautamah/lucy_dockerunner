# frozen_string_literal: true

require "spec_helper"

RSpec.describe "compose.rake", type: :task do
  it "is available" do
    expect(Rake::Task.task_defined?("compose:install")).to be(true)
  end

  it "calls the install task" do
    expect(Rake::Task["compose:install"]).to receive(:invoke)
    Rake::Task["compose:install"].invoke
  end

  it "calls the build task" do
    expect(Rake::Task["compose:build"]).to receive(:invoke)
    Rake::Task["compose:build"].invoke
  end

  it "calls the up task" do
    expect(Rake::Task["compose:up"]).to receive(:invoke)
    Rake::Task["compose:up"].invoke
  end

  it "calls the bot_detach task" do
    expect(Rake::Task["compose:bot_detach"]).to receive(:invoke)
    Rake::Task["compose:bot_detach"].invoke
  end

  it "calls the telegram_detach task" do
    expect(Rake::Task["compose:telegram_detach"]).to receive(:invoke)
    Rake::Task["compose:telegram_detach"].invoke
  end

  it "calls the discord_detach task" do
    expect(Rake::Task["compose:discord_detach"]).to receive(:invoke)
    Rake::Task["compose:discord_detach"].invoke
  end

  it "calls the nginx_detach task" do
    expect(Rake::Task["compose:nginx_detach"]).to receive(:invoke)
    Rake::Task["compose:nginx_detach"].invoke
  end

  it "calls the db_detach task" do
    expect(Rake::Task["compose:db_detach"]).to receive(:invoke)
    Rake::Task["compose:db_detach"].invoke
  end

  it "calls the redis_detach task" do
    expect(Rake::Task["compose:redis_detach"]).to receive(:invoke)
    Rake::Task["compose:redis_detach"].invoke
  end

  # it "calls the back_detach task" do
  #   expect(Rake::Task["compose:back_detach"]).to receive(:invoke)
  #   Rake::Task["compose:back_detach"].invoke
  # end

  it "calls the down task" do
    expect(Rake::Task["compose:down"]).to receive(:invoke)
    Rake::Task["compose:down"].invoke
  end

  it "calls the restart task" do
    expect(Rake::Task["compose:restart"]).to receive(:invoke)
    Rake::Task["compose:restart"].invoke
  end

  it "calls the clean_all task" do
    expect(Rake::Task["compose:clean_all"]).to receive(:invoke)
    Rake::Task["compose:clean_all"].invoke
  end

  it "calls the clean_volumes task" do
    expect(Rake::Task["compose:clean_volumes"]).to receive(:invoke)
    Rake::Task["compose:clean_volumes"].invoke
  end

  it "calls the clean_orphans task" do
    expect(Rake::Task["compose:clean_orphans"]).to receive(:invoke)
    Rake::Task["compose:clean_orphans"].invoke
  end

  it "calls the clean_images task" do
    expect(Rake::Task["compose:clean_images"]).to receive(:invoke)
    Rake::Task["compose:clean_images"].invoke
  end

  it "calls the clean_containers task" do
    expect(Rake::Task["compose:clean_containers"]).to receive(:invoke)
    Rake::Task["compose:clean_containers"].invoke
  end
end
