module IndexHelper
  
  def Last_Mili(number)
   number = number%3600000
   number = number%60000
   number = number%1000
   number
  end 

  def Last_Mili_To_Seg(number)
   number = number%3600000
   number = number%60000
   number = number/1000
   number = number.floor
   number
  end

  def Last_Mili_To_Min(number)
   number = number%3600000
   number = number/60000
   number = number.floor
   number
  end

  def Last_Mili_To_Hour(number)
   number = number/3600000
   number = number.floor
   if number > 720 
     number = 720 
   end
  number
  end

  def maxLength(item, lim)
   if item.mb_chars.length > lim-1
   item = item[0..lim]
  end
  item
  end


end
