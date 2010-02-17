module MainHelper
  def format_website(url)
    return '' unless url
    u = url
    u = 'http://' + u unless u[0..6] == 'http://'
    "<a href=\"#{u}\">#{u}</a>"
  end
  
  def generate_dropdown(title, link, link_list)
	  "<div class=\"dropdown\">" + 
	    "<div><a href=\"#{link}\">#{title}</a></div>" + 
	    "<div class=\"up\">" +
	      link_list.collect { |l| "<a href=\"#{l[1]}\">#{l[0]}</a>" }.join('') +
	    "</div>" +
	  "</div>"
  end
  
  def generate_dropdown_for(category)
    generate_dropdown(category.name, url_for(:action => "show_category", :id => category.id),
      category.subcategories.collect { |s| [s.name, url_for(:action => "show_subcategory", :id => s.id)]}) 
  end
end
