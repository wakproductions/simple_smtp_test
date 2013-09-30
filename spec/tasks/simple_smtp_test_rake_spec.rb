require 'spec_helper'
require 'rake'

describe 'task #simple_smtp_test' do
  before do
    Rake.application.rake_require "tasks/simple_smtp_test"
    Rake::Task.define_task(:environment)
    $stdout = File.new(File.join(File.dirname(__FILE__), 'null.txt'), 'w') # redirects/stubs terminal output from the Rake task
    Rake::Task['simple_smtp_test'].reenable
  end

  it 'calls the Mail::Message#deliver method' do
    mailobj = double(:SimpleSmtpTestMailer)
    SimpleSmtpTestMailer.stub(:test_email) { mailobj }
    mailobj.should_receive(:raise_delivery_errors=)
    mailobj.should_receive(:deliver)
    Rake::Task['simple_smtp_test'].invoke('myemail@example.com')
  end

  context 'when invoked without an email address parameter' do
    it 'should raise exception' do
      expect {
        Rake::Task['simple_smtp_test'].invoke
      }.to raise_error
    end
  end
end