class LoopMailer < ActionMailer::Base
  default from: "noreply@loopb.ac"

  def kickoff_subject(loop)
    @loop = loop
    mail(to: loop.email, subject: "You've been asked to loopbac")
  end

  def kickoff_reviewer(loop)
    @loop = loop
    mail(to: loop.email, subject: "You've been asked to loopbac")
  end
end