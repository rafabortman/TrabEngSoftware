module ApplicationHelper

def pageTitle(name)
  default = "Speedfy"
  if name.empty?
   return  default
  else
   return name + " | "+ default
end
end
end
