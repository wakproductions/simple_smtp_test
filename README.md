# SimpleSmtpTest
[![Code Climate](https://codeclimate.com/github/wakproductions/simple_smtp_test.png)](https://codeclimate.com/github/wakproductions/simple_smtp_test)

To use this gem, you must be using a Rails application with ActionMailer. It installs a rake command which you can
use to send yourself a test email to verify that your email settings are working. To use it, install it as a gem in your
Rails program:

    gem 'simple_smtp_test'

Then do a bundle install. The rake task should become available. To run it, simply run from the command line:

    $ rake simple_smtp_test['myemail@example.com']

It will display output which looks like this:

```
Current Mail Server Settings:

---
:address: smtp.myserver.com
:enable_starttls_auto: true
:port: 587
:user_name: myemail@example.com
:password: password

Current Rails Environment: development
Preparing to send test message to myemail@example.com...
Message successfully sent. Please check that the test message was received.
```

You should then have a message in your email inbox if the email settings work. If an error occurred while connecting
to the email server, it will display the error message in the command line output.
