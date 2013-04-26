class SimpleFeedbackDecorator < Draper::Decorator
  delegate_all

  def peer_name
    if h.current_user == subject
      author.name
    else
      subject.name
    end
  end
end
