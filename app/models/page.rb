class Page < ActiveRecord::Base
  def format_content
    ERB::Util::html_escape(content).gsub("\n", "<br />").gsub("\r", "")
  end
end
