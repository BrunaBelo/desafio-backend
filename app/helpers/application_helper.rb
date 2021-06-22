module ApplicationHelper
    def render_message(message, message_type)
        if message.present?
            style_type = message_type == 'error' ? 'danger' : 'success'
            content_tag(:div, content_tag(:span, message), class: "alert alert-#{style_type} mt-1")
        end
    end
end
