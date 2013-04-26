class FeedbackMailer < ActionMailer::Base
  default from: "Loops <loops@loopb.ac>"

  def simple_feedback_received(simple_feedback)
    @simple_feedback = simple_feedback
    mail(to: simple_feedback.subject.email, subject: "#{simple_feedback.author.name} just gave you feedback")
  end
end