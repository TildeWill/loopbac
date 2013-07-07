class FeedbackMailer < ActionMailer::Base
  default from: "Loopbac <system@loopb.ac>"

  def feedback_approved(feedback)
    @feedback = feedback
    mail(to: feedback.subject.email, subject: "#{feedback.author.name} just gave you feedback")
  end
end