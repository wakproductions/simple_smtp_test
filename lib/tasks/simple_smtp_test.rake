require "#{Rails.root}/lib/tasks/simple_smtp_test_mailer.rb"

desc 'Tests out the email settings in the current environment'
task :simple_smtp_test, [:to_email_address] => :environment do |t, args|
  raise 'Error: Please provide an email address as a parameter.' if args[:to_email_address].blank?

  puts "Current Mail Server Settings:"
  puts "\n#{ActionMailer::Base.smtp_settings.to_yaml}\nCurrent Rails Environment: #{Rails.env}"
  puts "Preparing to send test message to #{args[:to_email_address]}..."

  mailobj = SimpleSmtpTestMailer.test_email(args[:to_email_address])
  mailobj.raise_delivery_errors = true
  begin
    mailobj.deliver
  rescue Exception => e
    puts "An error has occurred: #{e.message}"
    next
  end

  puts 'Message successfully sent. Please check that the test message was received.'
end