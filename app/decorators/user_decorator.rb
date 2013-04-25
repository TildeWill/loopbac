class UserDecorator < Draper::Decorator
  delegate_all

  def to_autocomplete_json
    {value: id, label: "#{name} (#{email})", icon: '/assets/missing_profile.png'}.to_json
  end
end
