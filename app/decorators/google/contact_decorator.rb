class Google::ContactDecorator < Draper::Decorator
  delegate_all

  def to_autocomplete_json
    {value: login, label: "#{first_name} #{last_name}", icon: '/assets/missing_profile.png'}.to_json
  end
end
