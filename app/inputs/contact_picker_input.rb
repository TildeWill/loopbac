class ContactPickerInput < SimpleForm::Inputs::Base
  def input
    out = template.text_field_tag("#{attribute_name}_display", nil, input_html_options)
    out += @builder.hidden_field(attribute_name)
    out.html_safe
  end

  def input_html_options
    {
      spellcheck: 'false',
      data: {
        contacts: "[#{template.current_users.map(&:to_autocomplete_json).join(",")}]"
      }
    }.merge(super)
  end
end