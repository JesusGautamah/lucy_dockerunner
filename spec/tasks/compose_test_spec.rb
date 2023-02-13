#  frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'compose_test.rake', type: :task do
  it 'Run rake compose_test:all' do
    expect(Rake::Task.task_defined?('compose_test:all')).to be(true)
  end

  it 'Run rake compose_test:clean_test' do
    expect(Rake::Task.task_defined?('compose_test:clean_test')).to be(true)
  end

  it 'Run rake compose_test:controllers' do
    expect(Rake::Task.task_defined?('compose_test:controllers')).to be(true)
  end

  it 'Run rake compose_test:models' do
    expect(Rake::Task.task_defined?('compose_test:models')).to be(true)
  end

  it 'Run rake compose_test:requests' do
    expect(Rake::Task.task_defined?('compose_test:requests')).to be(true)
  end

  it 'Run rake compose_test:helpers' do
    expect(Rake::Task.task_defined?('compose_test:helpers')).to be(true)
  end

  it 'Run rake compose_test:mailers' do
    expect(Rake::Task.task_defined?('compose_test:mailers')).to be(true)
  end

  it 'Run rake compose_test:routing' do
    expect(Rake::Task.task_defined?('compose_test:routing')).to be(true)
  end

  it 'Run rake compose_test:views' do
    expect(Rake::Task.task_defined?('compose_test:views')).to be(true)
  end
end

