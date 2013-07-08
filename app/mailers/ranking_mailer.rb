class RankingMailer < ActionMailer::Base
  default from: "Loopbac <system@loopb.ac>"

  def new_ranking_available(feedback)
    @feedback = feedback
    mail(to: feedback.author.email, subject: "Please rank your teammate")
  end
end