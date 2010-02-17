module MainHelper
  def format_website(url)
    return '' unless url
    u = url
    u = 'http://' + u unless u[0..6] == 'http://'
    "<a href=\"#{u}\">#{u}</a>"
  end
  
  def generate_dropdown_js(id)
		#" onfocus=\"Effect.Appear('dropdown_#{id}', { duration: 0.8 });\"" +
    " onmouseover=\"Effect.Appear('dropdown_#{id}', { duration: 0.8 });\"" + 
	  " onmouseout=\"Effect.Fade('dropdown_#{id}', { duration: 0.8 });\"" +
	  " onblur=\"Effect.Fade('dropdown_#{id}', { duration: 0.8 });\""
	end
  
  def generate_dropdown(title, link, id, link_list)
	  "<div " + generate_dropdown_js(id) + "><li>" + 
	  "<a href=\"#{link}\">#{title}</a></li>" + 
	  "<ul id=\"dropdown_#{id}\" class=\"dropdown\" style=\"display: none\">" +
	  link_list.collect {|l| "<li>#{l}</li>" }.join('') +
	  "</ul></div>"
  end
  
  def generate_dropdown_for(category)
    generate_dropdown(category.name, url_for(:action => "show_category", :id => category.id), category.id, category.subcategories)
  end
end
