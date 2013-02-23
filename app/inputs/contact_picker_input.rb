class ContactPickerInput < SimpleForm::Inputs::Base
  def input
    {spellcheck: 'false'}.merge(input_html_options)
    @builder.text_field(attribute_name, input_html_options)
  end
end