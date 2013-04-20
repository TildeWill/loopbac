class FeedbackMailer < ActionMailer::Base
  default from: "Loopbac Feedback <loops@loopb.ac>"

  def feedback_received(feedback)
    @feedback = feedback
    mail(to: feedback.about_email, subject: "#{feedback.user.name} just gave you feedback")
  end
end