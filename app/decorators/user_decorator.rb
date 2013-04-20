class UserDecorator < Draper::Decorator
  delegate_all

  def to_autocomplete_json
    {value: email, label: name, icon: '/assets/missing_profile.png'}.to_json
  end
end
