module MainHelper
  def format_website(url)
    return '' unless url
    u = url
    u = 'http://' + u unless u[0..6] == 'http://'
    "<a href=\"#{u}\">#{u}</a>"
  end
end
