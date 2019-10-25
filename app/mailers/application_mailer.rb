class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@football_leaders.com', to: ENV['admin_email'], subject: "Failed to fetch standings"
  layout 'mailer'
end
