require 'mailgun'

class SendEmail
  def initialize(mailer: nil)
      @mailer = mailer || Mailgun::Client.new(ENV["MAILGUN_API"])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV["MAILGUN_DOMAIN"], {from: "mailgun@#{ENV["MAILGUN_DOMAIN"]}",
          to: user.email,
          subject: "Welcome to MakersBnb",
          text: "Hello #{user.name},\nYou are truly awesome!"})
  end

  private

  attr_reader :mailer
end
