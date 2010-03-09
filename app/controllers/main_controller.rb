class MainController < ApplicationController
  before_filter :collect_info
  
  def collect_info    
    @regions = Region.find(:all)
    @categories = Category.find(:all, :order => 'name')

    @cat_thirds = [[],[],[]]
    for i in 0..(@categories.length - 1)
      @cat_thirds[i % 3] += [@categories[i]]
    end

    @reg_thirds = [[],[],[]]
    for i in 0..(@regions.length - 1)
      @reg_thirds[i % 3] += [@regions[i]]
    end
    
    @all_pages = Page.find(:all, :order => 'name')
    @bios = @all_pages.select { |p| p.name =~ /bio/i }
    @pages = @all_pages.select { |p| not @bios.include? p }
  end
  
  def show_page
    @page = Page.find(:first,
      :conditions => ["id = ? or name like ?", params[:id], params[:id]] ) or r404
  end
  
  def search
    @term = params[:search].downcase
    terms = @term.split
    @listings = []
    
    terms.each { |term| 
      search_term = "%#{term}%"
      listings = Listing.find(:all, :conditions => [
      'lower(title) like ? or lower(body) like ? or lower(whoby) like ? or lower(email) like ?', search_term,search_term,search_term,search_term])
      @listings += listings
    }
  end
  
  def index
    names_2010 = ['Mind & Body', 'Planet', 'Spirit', 'Connections']
    names_2009 = ['Business & Professional', 'Creative Arts', 'Education', 'Events', 'Fitness', 'Food', 'Health & Alternative Healing',
        'Herbs & Supplements', 'Metaphysics', 'Recycling', 'Retail', 'Spirituality & Metaphysical', 'Sustainability']
    all_categories = @categories
    @categories = []
    @categories << all_categories.select { |c| names_2010.include? c.name }
    @categories << all_categories.select { |c| names_2009.include? c.name }
    #puts (all_categories.reject {|c| (@categories[0].include? c) or (@categories[1].include? c)}).join ', '
    #puts "\n"
    
    dropdown_2010 = [
      ["Mind & Body", ['Bodywork', 'Children\'s Services', 'Coaching & Counseling', 'Energy Healing', 'Fitness', 'Health Care', 'Senior Services', 'Women\'s Health']],
      ["Planet", ["Alternative Energy", "Gardening", "Home", "Recycling", "Sustainable Living"]],
      ["Spirit", ["Spirituality & Metaphysical"]],
      ["Connections", ['Creative Arts', 'Events', 'Food', 'Green Businesses & Professionals', 'Herbs & Supplements', 'Nonprofits', 'Holistic Pet Care',
      'Products', 'Publications & Marketing', 'Travel']]
    ]
    @dropdown = dropdown_2010.collect { |c, l| [c, "#", l.collect { |name|
      c = Category.find(:first, :conditions => ["name = ?", name])
      [c.name, c.url]
    }] }    
  end
  
  def show_category
    @category = Category.find(params[:id])
    listings = Listing.find(:all, :conditions => "category_id = #{@category.id}", :order => "title")
    if listings
      listings = listings.sort { |l,m| 
        if (not l.subcategory) or (not m.subcategory) or l.subcategory_id == m.subcategory_id
          l.title <=> m.title
        else
          l.subcategory.name <=> m.subcategory.name
        end
      }
    end
    @num_columns = 3
    @column = []
    1.upto(@num_columns) { |i| @column << [] }
    
    i = 0
    @category.subcategories.delete_if {|c| c.listings.length == 0 }.sort_by {|c| c.name}.each do |l|
      @column[i % @num_columns] << l
      i += 1
    end
    
    @listings = {}
    @listings[:left] = []
    @listings[:right] = []
    if listings.length == 1
      @listings[:left] = [listings[0]]
    else
      @listings[:left] = listings[0..(listings.length / 2 - 1)]
      @listings[:right] = listings[(listings.length / 2)..(listings.length - 1)]
    end
  end

  def show_subcategory
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
    listings = @subcategory.listings
    if listings
      listings = listings.sort { |l,m| 
        if l.subcategory_id and l.subcategory_id == m.subcategory_id
          l.title <=> m.title
        else
          l.subcategory.name <=> m.subcategory.name
        end
      }
    end
    
    @listings = {}
    @listings[:left] = []
    @listings[:right] = []
    if listings.length == 1
      @listings[:left] = [listings[0]]
    else
      @listings[:left] = listings[0..(listings.length / 2 - 1)]
      @listings[:right] = listings[(listings.length / 2)..(listings.length - 1)]
    end
  end

end
