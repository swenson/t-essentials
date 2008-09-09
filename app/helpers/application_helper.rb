# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def fixwebsite(url)
    return "http://#{url}" unless url[0..6] == 'http://'
    return url
  end
  
  def email(addr)
    link_to addr, "mailto:#{addr}"
  end
  
  def twodec(num)
    sprintf("%.2f", num)
  end
  
  def money(num)
    if num
      "$" + twodec(num)
    else
      "$0.00"
    end
  end
end
