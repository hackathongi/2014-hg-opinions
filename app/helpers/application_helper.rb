module ApplicationHelper

  # default types: success, error, notice
  def show_flash(*arguments)
    messages = [:success, :error, :notice] + arguments
    flash.select do |key, value|
      messages.include? key
    end.each do |type, message|
      @is_error = (type === :error)
      unless message.blank?
        haml_tag :p, sanitize(message), :class => "flash flash-#{type}"
      end
    end
  end
end
