class TextFieldComponent < ViewComponent::Base
  def initialize(form:, field_name:, type: "text", label: nil, autocomplete: nil, autofocus: false, **html_options)
    @form = form
    @field_name = field_name
    @type = type
    @label = label || field_name.to_s.humanize
    @autocomplete = autocomplete
    @autofocus = autofocus
    @html_options = html_options
  end

  private

  def input_classes
    "block w-full rounded-xl border border-cream-300 px-4 py-3 placeholder-cream-400 shadow-sm focus:border-teal-400 focus:ring-2 focus:ring-teal-200 bg-cream-100 text-cream-900 text-base transition"
  end
end 