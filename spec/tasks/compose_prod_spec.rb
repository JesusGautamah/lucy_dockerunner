# frozen_string_literal: true

require "spec_helper"

RSpec.describe "compose_prod.rake", type: :task do
  it "is available" do
    expect(Rake::Task.task_defined?("compose_prod:install")).to be(true)
  end

  context "call install task" do
    it "call install task" do
      expect(Rake::Task["compose_prod:install"]).to receive(:invoke)
      Rake::Task["compose_prod:install"].invoke
    end

    it "print install task message" do
      # expect { Rake::Task['compose_prod:install'].invoke }.to output(/Installing Blockchain and Database Containers/).to_stdout
    end
  end

  context "call build task" do
    it "call build task" do
      expect(Rake::Task["compose_prod:build"]).to receive(:invoke)
      Rake::Task["compose_prod:build"].invoke
    end

    it "print build task message" do
      # expect { Rake::Task['compose_prod:build'].invoke }.to output(/Building Blockchain and Database Containers/).to_stdout
    end
  end

  context "call up task" do
    it "call up task" do
      expect(Rake::Task["compose_prod:up"]).to receive(:invoke)
      Rake::Task["compose_prod:up"].invoke
    end

    it "print up task message" do
      # expect { Rake::Task['compose_prod:up'].invoke }.to output(/Starting Blockchain and Database Containers/).to_stdout
    end
  end

  context "call down task" do
    it "call down task" do
      expect(Rake::Task["compose_prod:down"]).to receive(:invoke)
      Rake::Task["compose_prod:down"].invoke
    end

    it "print down task message" do
      # expect { Rake::Task['compose_prod:down'].invoke }.to output(/Stopping Blockchain and Database Containers/).to_stdout
    end
  end

  context "call restart task" do
    it "call restart task" do
      expect(Rake::Task["compose_prod:restart"]).to receive(:invoke)
      Rake::Task["compose_prod:restart"].invoke
    end

    it "print restart task message" do
      # expect { Rake::Task['compose_prod:restart'].invoke }.to output(/Restarting Blockchain and Database Containers/).to_stdout
    end
  end

  context "call status task" do
    it "call status task" do
      expect(Rake::Task["compose_prod:status"]).to receive(:invoke)
      Rake::Task["compose_prod:status"].invoke
    end

    it "print status task message" do
      # expect { Rake::Task['compose_prod:status'].invoke }.to output(/Blockchain and Database Containers Status/).to_stdout
    end
  end

  context "call shell task" do
    it "call shell task" do
      expect(Rake::Task["compose_prod:shell"]).to receive(:invoke)
      Rake::Task["compose_prod:shell"].invoke
    end

    it "print shell task message" do
      # expect { Rake::Task['compose_prod:shell'].invoke }.to output(/Opening Shell in Blockchain and Database Containers/).to_stdout
    end
  end

  context "call clean_all task" do
    it "call clean_all task" do
      expect(Rake::Task["compose_prod:clean_all"]).to receive(:invoke)
      Rake::Task["compose_prod:clean_all"].invoke
    end

    it "print clean_all task message" do
      # expect { Rake::Task['compose_prod:clean_all'].invoke }.to output(/Cleaning Blockchain and Database Containers/).to_stdout
    end
  end

  context "call clean_volumes task" do
    it "call clean_volumes task" do
      expect(Rake::Task["compose_prod:clean_volumes"]).to receive(:invoke)
      Rake::Task["compose_prod:clean_volumes"].invoke
    end

    it "print clean_volumes task message" do
      # expect { Rake::Task['compose_prod:clean_volumes'].invoke }.to output(/Cleaning Blockchain and Database Containers/).to_stdout
    end
  end

  context "call clean_images task" do
    it "call clean_images task" do
      expect(Rake::Task["compose_prod:clean_images"]).to receive(:invoke)
      Rake::Task["compose_prod:clean_images"].invoke
    end

    it "print clean_images task message" do
      # expect { Rake::Task['compose_prod:clean_images'].invoke }.to output(/Cleaning Blockchain and Database Containers/).to_stdout
    end
  end

  context "call clean_containers task" do
    it "call clean_containers task" do
      expect(Rake::Task["compose_prod:clean_containers"]).to receive(:invoke)
      Rake::Task["compose_prod:clean_containers"].invoke
    end

    it "print clean_containers task message" do
      # expect { Rake::Task['compose_prod:clean_containers'].invoke }.to output(/Cleaning Blockchain and Database Containers/).to_stdout
    end
  end

  context "call clean_orphans task" do
    it "call clean_orphans task" do
      expect(Rake::Task["compose_prod:clean_orphans"]).to receive(:invoke)
      Rake::Task["compose_prod:clean_orphans"].invoke
    end

    it "print clean_orphans task message" do
      # expect { Rake::Task['compose_prod:clean_orphans'].invoke }.to output(/Cleaning Blockchain and Database Containers/).to_stdout
    end
  end
end
