# frozen_string_literal: true

require "spec_helper"

RSpec.describe "compose_log.rake", type: :task do
  it "is available" do
    expect(Rake::Task.task_defined?("compose_logs:all")).to be(true)
  end

  context "user calls the discord task" do
    it "calls docker compose logs discord" do
      expect(Rake::Task["compose_logs:discord"]).to receive(:invoke)
      Rake::Task["compose_logs:discord"].invoke
    end

    it "prints the discord logs" do
      expect { Rake::Task["compose_logs:discord"].invoke }.to output(/Showing Discord Logs.../).to_stdout
    end
  end

  context "user calls the telegram task" do
    it "calls docker compose logs telegram" do
      expect(Rake::Task["compose_logs:telegram"]).to receive(:invoke)
      Rake::Task["compose_logs:telegram"].invoke
    end

    it "prints the telegram logs" do
      expect { Rake::Task["compose_logs:telegram"].invoke }.to output(/Showing Telegram Logs.../).to_stdout
    end
  end

  context "user calls the web task" do
    it "calls docker compose logs web" do
      expect(Rake::Task["compose_logs:web"]).to receive(:invoke)
      Rake::Task["compose_logs:web"].invoke
    end

    it "prints the web server logs" do
      expect { Rake::Task["compose_logs:web"].invoke }.to output(/Showing Web Logs.../).to_stdout
    end
  end

  context "user calls the bot task" do
    it "calls docker compose logs bot" do
      expect(Rake::Task["compose_logs:bot"]).to receive(:invoke)
      Rake::Task["compose_logs:bot"].invoke
    end
  end

  context "user calls the db task" do
    it "calls docker compose logs db" do
      expect(Rake::Task["compose_logs:db"]).to receive(:invoke)
      Rake::Task["compose_logs:db"].invoke
    end

    it "prints the database logs" do
      expect { Rake::Task["compose_logs:db"].invoke }.to output(/Showing Database Logs.../).to_stdout
    end
  end

  context "user calls the nginx task" do
    it "calls docker compose logs nginx" do
      expect(Rake::Task["compose_logs:nginx"]).to receive(:invoke)
      Rake::Task["compose_logs:nginx"].invoke
    end

    it "prints the nginx logs" do
      expect { Rake::Task["compose_logs:nginx"].invoke }.to output(/Showing Nginx Logs.../).to_stdout
    end
  end

  context "user calls the redis task" do
    it "calls docker compose logs redis" do
      expect(Rake::Task["compose_logs:redis"]).to receive(:invoke)
      Rake::Task["compose_logs:redis"].invoke
    end

    it "prints the redis logs" do
      expect { Rake::Task["compose_logs:redis"].invoke }.to output(/Showing Redis Logs.../).to_stdout
    end
  end

  context "user calls the sidekiq task" do
    it "calls docker compose logs sidekiq" do
      expect(Rake::Task["compose_logs:sidekiq"]).to receive(:invoke)
      Rake::Task["compose_logs:sidekiq"].invoke
    end

    it "prints the sidekiq logs" do
      expect { Rake::Task["compose_logs:sidekiq"].invoke }.to output(/Showing Sidekiq Logs.../).to_stdout
    end
  end

  context "user calls the all task" do
    it "calls docker compose logs" do
      expect(Rake::Task["compose_logs:all"]).to receive(:invoke)
      Rake::Task["compose_logs:all"].invoke
    end

    it "prints all the logs" do
      expect { Rake::Task["compose_logs:all"].invoke }.to output(/Showing All Logs.../).to_stdout
    end
  end

  context "user calls the tail_discord task" do
    it "calls docker compose logs discord -f" do
      expect(Rake::Task["compose_logs:tail_discord"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_discord"].invoke
    end

    it "tails the discord logs" do
      expect { Rake::Task["compose_logs:tail_discord"].invoke }.to output(/Tailing Discord Logs.../).to_stdout
    end
  end

  context "user calls the tail_telegram task" do
    it "calls docker compose logs telegram -f" do
      expect(Rake::Task["compose_logs:tail_telegram"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_telegram"].invoke
    end

    it "tails the telegram logs" do
      expect { Rake::Task["compose_logs:tail_telegram"].invoke }.to output(/Tailing Telegram Logs.../).to_stdout
    end
  end

  context "user calls the tail_bot task" do
    it "calls docker compose logs bot -f" do
      expect(Rake::Task["compose_logs:tail_bot"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_bot"].invoke
    end
  end

  context "user calls the tail_nginx task" do
    it "calls docker compose logs nginx -f" do
      expect(Rake::Task["compose_logs:tail_nginx"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_nginx"].invoke
    end

    it "tails the nginx logs" do
      expect { Rake::Task["compose_logs:tail_nginx"].invoke }.to output(/Tailing Nginx Logs.../).to_stdout
    end
  end

  context "user calls the tail_web task" do
    it "calls docker compose logs web -f" do
      expect(Rake::Task["compose_logs:tail_web"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_web"].invoke
    end

    it "tails the web server logs" do
      expect { Rake::Task["compose_logs:tail_web"].invoke }.to output(/Tailing Web Logs.../).to_stdout
    end
  end

  context "calls the tail_db task" do
    it "calls the tail_db task" do
      expect(Rake::Task["compose_logs:tail_db"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_db"].invoke
    end

    it "tails the database logs" do
      expect { Rake::Task["compose_logs:tail_db"].invoke }.to output(/Tailing Database Logs.../).to_stdout
    end
  end

  context "calls the tail_redis task" do
    it "calls the tail_redis task" do
      expect(Rake::Task["compose_logs:tail_redis"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_redis"].invoke
    end

    it "tails the redis logs" do
      expect { Rake::Task["compose_logs:tail_redis"].invoke }.to output(/Tailing Redis Logs.../).to_stdout
    end
  end

  context "calls the tail_sidekiq task" do
    it "calls the tail_sidekiq task" do
      expect(Rake::Task["compose_logs:tail_sidekiq"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_sidekiq"].invoke
    end

    it "tails the sidekiq logs" do
      expect { Rake::Task["compose_logs:tail_sidekiq"].invoke }.to output(/Tailing Sidekiq Logs.../).to_stdout
    end
  end

  context "calls the tail_all task" do
    it "calls the tail_all task" do
      expect(Rake::Task["compose_logs:tail_all"]).to receive(:invoke)
      Rake::Task["compose_logs:tail_all"].invoke
    end
  end
end
