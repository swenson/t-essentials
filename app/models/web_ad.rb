class WebAd < ActiveRecord::Base
  @@types = ['Leaderboard / Banner', 'Vertical']
  
  def WebAd.types; @@types; end
end
