class UserDecorator < Draper::Decorator
  delegate_all

  def to_autocomplete_json
    {value: id, label: "#{name} (#{email})", icon: "/photos/#{login}"}.to_json
  end
end