class User < ActiveRecord::Base
#   validates_presence_of  :typ, :name,:telefon,:email,:straße,  :on=>:update
   has_many :ansprechpartnervon, :class_name => "User", :foreign_key => "ansprechpartner_id"  
   belongs_to :ansprechpartner, :class_name => "User", :primary_key => "ansprechpartner_id"
   has_many :procurations
   has_many :inventions
   has_many :submissions
   has_many :patent_procurations,  :through => :procurations
   has_many :patent_inventions,   :through => :inventions
   has_many :patent_submissions,  :through => :submissions
   def ansprechpartner
     User.find(ansprechpartner_id) unless ansprechpartner_id.nil?
   end
   def ansprechpartner_von
     User.find_all_by_ansprechpartner_id (:id).map(&:name).join(',')
   end
end
