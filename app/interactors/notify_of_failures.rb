class NotifyOfFailures
  include Interactor

  def call
    FailureMailer.notify(context.failures).deliver_now
  end
end
