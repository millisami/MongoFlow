module ApplicationHelper
  def editable?(item)
    admin? || item.user == current_user
  end
  
  def title
    if @title
      @title + " : " + APP_CONFIG[:app_title]
    else
      APP_CONFIG[:default_title]
    end
  end
  
  def safe(txt)
    sanitize(txt, :tags => %w(a p code b strong i em blockquote), :attributes => %w(href)).split("\n").join("\n<br />")
  end

  def form_errors(obj)
    content_tag :ul, :class => 'errorExplanation' do
      obj.errors.full_messages.collect { |msg| content_tag :li, msg }.join('')
    end
  end
  
end
