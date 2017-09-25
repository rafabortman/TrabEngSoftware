module ApplicationHelper

def pageTitle(name)
  default = "Speedfy"
  if name.empty?
   return  default
  else
   return name + " | "+ default
end
end

def userLength(user)
   if user.mb_chars.length > 13
   user = user[0..13]	
  end
user
end
end
