# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'compose_log.rake', type: :task do
  it 'is available' do
    expect(Rake::Task.task_defined?('compose_logs:all')).to be(true)
  end

  context "calls the web task" do
    it 'calls the web task' do
      expect(Rake::Task['compose_logs:web']).to receive(:invoke)
      Rake::Task['compose_logs:web'].invoke
    end

    it 'prints the web server logs' do
      expect{ Rake::Task['compose_logs:web'].invoke }.to output(/Showing Web Logs.../).to_stdout
    end
  end

  context "calls the db task" do
    it 'calls the db task' do
      expect(Rake::Task['compose_logs:db']).to receive(:invoke)
      Rake::Task['compose_logs:db'].invoke
    end

    it 'prints the database logs' do
      expect{ Rake::Task['compose_logs:db'].invoke }.to output(/Showing Database Logs.../).to_stdout
    end
  end

  context "calls the redis task" do
    it 'calls the redis task' do
      expect(Rake::Task['compose_logs:redis']).to receive(:invoke)
      Rake::Task['compose_logs:redis'].invoke
    end
    
    it 'prints the redis logs' do
      expect{ Rake::Task['compose_logs:redis'].invoke }.to output(/Showing Redis Logs.../).to_stdout
    end
  end

  context "calls the sidekiq task" do
    it "calls the sidekiq task" do
      expect(Rake::Task['compose_logs:sidekiq']).to receive(:invoke)
      Rake::Task['compose_logs:sidekiq'].invoke
    end 

    it 'prints the sidekiq logs' do
      expect{ Rake::Task['compose_logs:sidekiq'].invoke }.to output(/Showing Sidekiq Logs.../).to_stdout
    end
  end

  context "calls the all task" do
    it 'calls the all task' do
      expect(Rake::Task['compose_logs:all']).to receive(:invoke)
      Rake::Task['compose_logs:all'].invoke
    end

    it "prints all the logs" do
      expect{ Rake::Task['compose_logs:all'].invoke }.to output(/Showing All Logs.../).to_stdout
    end
  end

  context "calls the tail_web task" do
    it 'calls the tail_web task' do
      expect(Rake::Task['compose_logs:tail_web']).to receive(:invoke)
      Rake::Task['compose_logs:tail_web'].invoke
    end

    it "tails the web server logs" do
      expect{ Rake::Task['compose_logs:tail_web'].invoke }.to output(/Tailing Web Logs.../).to_stdout
    end
  end

  context "calls the tail_db task" do
    it 'calls the tail_db task' do
      expect(Rake::Task['compose_logs:tail_db']).to receive(:invoke)
      Rake::Task['compose_logs:tail_db'].invoke
    end

    it "tails the database logs" do
      expect{ Rake::Task['compose_logs:tail_db'].invoke }.to output(/Tailing Database Logs.../).to_stdout
    end
  end

  context "calls the tail_redis task" do
    it 'calls the tail_redis task' do
      expect(Rake::Task['compose_logs:tail_redis']).to receive(:invoke)
      Rake::Task['compose_logs:tail_redis'].invoke
    end

    it "tails the redis logs" do
      expect{ Rake::Task['compose_logs:tail_redis'].invoke }.to output(/Tailing Redis Logs.../).to_stdout
    end
  end

  context "calls the tail_sidekiq task" do
    it "calls the tail_sidekiq task" do
      expect(Rake::Task['compose_logs:tail_sidekiq']).to receive(:invoke)
      Rake::Task['compose_logs:tail_sidekiq'].invoke
    end

    it "tails the sidekiq logs" do
      expect{ Rake::Task['compose_logs:tail_sidekiq'].invoke }.to output(/Tailing Sidekiq Logs.../).to_stdout
    end
  end

  context "calls the tail_all task" do
    it 'calls the tail_all task' do
      expect(Rake::Task['compose_logs:tail_all']).to receive(:invoke)
      Rake::Task['compose_logs:tail_all'].invoke
    end

    it "tails all the logs" do
      # expect{ Rake::Task['compose_logs:tail_all'].invoke }.to output(/Tailing All Logs.../).to_stdout
    end
  end
end
