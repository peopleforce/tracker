class PasswordFieldComponent < ViewComponent::Base
  def initialize(form:, field_name:, label: nil, autocomplete: "current-password")
    @form = form
    @field_name = field_name
    @label = label || field_name.to_s.humanize
    @autocomplete = autocomplete
  end
end 