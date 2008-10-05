class Page < ActiveRecord::Base
  include WhiteListHelper
  def format_content
    #ERB::Util::html_escape(content).gsub("\n", "<br />").gsub("\r", "")
    white_list(content).gsub("\n", "<br />").gsub("\r", "")
  end
end
