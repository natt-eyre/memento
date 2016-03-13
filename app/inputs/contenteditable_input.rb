class ContenteditableInput < SimpleForm::Inputs::Base

  def input(wrapper_options = nil)
    # Determine field value (either from input_html or object value or empty string)
    value = input_html_options[:value] || object.send(attribute_name)  || ''

    # If the html_safe option is present and true, prevent escaping HTML tags
    value = value.html_safe if options.key?(:html_safe) && options[:html_safe]

    # Merge input_html with the contenteditable_html option, while preserving HTML classes
    contenteditable_html = input_html_options.merge(options[:contenteditable_html] || {}) do |k, oldval, newval|
      k == :class ? [oldval, newval].join(' ') : newval
    end.merge(contenteditable: true)

    # Render the contenteditable div & the hidden input as siblings
    [
      @builder.template.content_tag(:div, value, contenteditable_html),
      @builder.hidden_field(attribute_name, input_html_options)
    ].join.html_safe
  end

end
