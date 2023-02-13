# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'compose_db.rake', type: :task do
  it 'is available' do
    expect(Rake::Task.task_defined?('compose_db:drop')).to be(true)
  end

  context "calls the drop task" do
    it 'calls the drop task' do
      expect(Rake::Task['compose_db:drop']).to receive(:invoke)
      Rake::Task['compose_db:drop'].invoke
    end

    it 'prints a message informing the user that the database will be dropped' do
      expect { Rake::Task['compose_db:drop'].invoke }.to output(/Dropping Database.../).to_stdout
    end
  end

  context "calls the rollback task" do
    it 'calls the rollback task' do
      expect(Rake::Task['compose_db:rollback']).to receive(:invoke)
      Rake::Task['compose_db:rollback'].invoke
    end

    it 'prints a message informing the user that the database will be rolled back' do
      expect { Rake::Task['compose_db:rollback'].invoke }.to output(/Rolling Back Database.../).to_stdout
    end
  end

  context "calls the complete_setup task" do
    it "calls the complete_setup task" do
      expect(Rake::Task['compose_db:complete_setup']).to receive(:invoke)
      Rake::Task['compose_db:complete_setup'].invoke
    end

    it "prints a message informing the user that the database will be set up" do
      expect { Rake::Task['compose_db:complete_setup'].invoke }.to output(/Setting up Database.../).to_stdout
    end
  end

  context "calls the setup task" do
    it "calls the setup task" do
      expect(Rake::Task['compose_db:setup']).to receive(:invoke)
      Rake::Task['compose_db:setup'].invoke
    end

    it "prints a message informing the user that the database will be set up" do
      expect { Rake::Task['compose_db:setup'].invoke }.to output(/Setting up and seeding Database.../).to_stdout
    end
  end

  context "calls the create task" do
    it "calls the create task" do
      expect(Rake::Task['compose_db:create']).to receive(:invoke)
      Rake::Task['compose_db:create'].invoke
    end

    it "prints a message informing the user that the database will be created" do
      expect { Rake::Task['compose_db:create'].invoke }.to output(/Creating Database.../).to_stdout
    end
  end
 
  context "calls the migrate task" do
    it "calls the migrate task" do
      expect(Rake::Task['compose_db:migrate']).to receive(:invoke)
      Rake::Task['compose_db:migrate'].invoke
    end

    it "prints a message informing the user that the database will be migrated" do
      expect { Rake::Task['compose_db:migrate'].invoke }.to output(/Migrating Database.../).to_stdout
    end
  end

  context "calls the seed task" do
    it "calls the seed task" do
      expect(Rake::Task['compose_db:seed']).to receive(:invoke)
      Rake::Task['compose_db:seed'].invoke
    end

    it "prints a message informing the user that the database will be seeded" do
      expect { Rake::Task['compose_db:seed'].invoke }.to output(/Seeding Database.../).to_stdout
    end
  end

  context "calls the reset_setup task" do
    it "calls the reset_setup task" do
      expect(Rake::Task['compose_db:reset_setup']).to receive(:invoke)
      Rake::Task['compose_db:reset_setup'].invoke
    end

    it "prints a message informing the user that the database will be reset" do
      expect { Rake::Task['compose_db:reset_setup'].invoke }.to output(/Resetting Database.../).to_stdout
    end
  end

  context "calls the reset task" do
    it "calls the reset task" do
      expect(Rake::Task['compose_db:reset']).to receive(:invoke)
      Rake::Task['compose_db:reset'].invoke
    end

    it "prints a message informing the user that the database will be reset" do
      expect { Rake::Task['compose_db:reset'].invoke }.to output(/Resetting Database.../).to_stdout
    end
  end

  context :force_reset do
    it "calls the force_reset task" do
      expect(Rake::Task['compose_db:force_reset']).to receive(:invoke)
      Rake::Task['compose_db:force_reset'].invoke
    end

    it "prints a message informing the user that the database will be reset" do
      expect { Rake::Task['compose_db:force_reset'].invoke }.to output(/Force Resetting Database.../).to_stdout
    end
  end
end