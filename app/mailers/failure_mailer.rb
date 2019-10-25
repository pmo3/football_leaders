class FailureMailer < ApplicationMailer
  def notify(failed_interactors)
    @failed_interactors = failed_interactors
    mail(to: "obiedman@gmail.com")
  end
end
