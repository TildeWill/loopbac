class LoopKickoffDecorator < Draper::Decorator
  delegate_all

  def reviewer_emails
    source.reviewer_emails.join(",")
  end
end
