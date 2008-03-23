class MainController < ApplicationController
  def index
    @regions = Region.find(:all)
    
    
    @categories = Category.find(:all, :order => 'name')

    @thirds = []
    len3 = ((@categories.length % 3) == 0) ? (@categories.length / 3) : (@categories.length + 1)
    for third in 0..2 do
      abeg = third * len3
      aend = abeg + (len3 - 1)
      aend = @categories.length - 1 if aend > @categories.length - 1
      @thirds += [@categories[abeg .. aend]]
    end

  end
end
