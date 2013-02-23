class Google::ContactDecorator < Draper::Decorator
  delegate_all

  def to_autocomplete_json
    {value: "#{login}@#{h.current_user.domain}", label: "#{first_name} #{last_name}", icon: '/assets/missing_profile.png'}.to_json
  end
end
