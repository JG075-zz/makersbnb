require 'mailgun'

class SendEmail
  def initialize(mailer: nil)
      @mailer = mailer || Mailgun::Client.new(ENV["MAILGUN_API"])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    p ENV["MAILGUN_DOMAIN"]
    p user.email
    mailer.send_message(ENV["MAILGUN_DOMAIN"], {from: 'mailgun@sandbox4ea7364b34d64c608f3cc57a4b2699f6.mailgun.org',
          to: "jamesgardiner075@gmail.com",
          subject: "help",
          text: "me"})
  end

  private

  attr_reader :mailer
end
