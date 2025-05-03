class SubmitButtonComponent < ViewComponent::Base
  def initialize(form:, text: "Submit", variant: :primary, **html_options)
    @form = form
    @text = text
    @variant = variant
    @html_options = html_options
  end

  private

  def button_classes
    base_classes = "flex w-full justify-center rounded-xl py-3 px-4 text-base font-bold shadow-md transition"
    
    case @variant
    when :primary
      "#{base_classes} border border-transparent bg-teal-500 text-white hover:bg-teal-600 focus:outline-none focus:ring-2 focus:ring-teal-300 focus:ring-offset-2"
    when :secondary
      "#{base_classes} border border-teal-400 bg-white text-teal-600 hover:bg-cream-100 focus:outline-none focus:ring-2 focus:ring-teal-300 focus:ring-offset-2"
    else
      base_classes
    end
  end
end 