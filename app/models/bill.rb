class Bill < ActiveRecord::Base
  belongs_to :patent
  belongs_to :user
     scope :with_patents_by_intern,
           lambda {|intern|
             joins(:patent).where(:patents => {:internaktenzeichen.matches=>intern })
                   }
                     search_methods :with_patents_by_intern
end
