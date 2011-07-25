class Invention < ActiveRecord::Base
 #belongs_to :user
 belongs_to :patent
 belongs_to :inventor , :class_name =>"User"
end
