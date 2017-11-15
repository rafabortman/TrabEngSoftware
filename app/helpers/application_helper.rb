module ApplicationHelper

def pageTitle(name)
  default = "Speedfy"
  if name.empty?
   return  default
  else
   return name + " | "+ default
end
end

def flash_message
  messages = ""
  [:notice, :info, :warning, :error].each {|type|
    if flash[type]
      messages += "<p class=\"#{type}\">#{flash[type]}</p>"
    end
  }

  messages
end
end