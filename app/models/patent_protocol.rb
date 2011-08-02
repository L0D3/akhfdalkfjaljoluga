class PatentProtocol < ActiveRecord::Base
  belongs_to :patent
   scope :with_patents_by_amtl,
           lambda {|amtl|
             joins(:patent).where(:patents => {:amtlaktenzeichen.matches =>amtl })
                   }
   scope :with_patents_by_intern,
           lambda {|intern|
             joins(:patent).where(:patents => {:internaktenzeichen.matches=>intern })
                   }
                     search_methods :with_patents_by_intern,:with_patents_by_amtl
end
