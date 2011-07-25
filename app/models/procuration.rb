class Procuration < ActiveRecord::Base
  belongs_to :user
  belongs_to :patent
  belongs_to :procurator ,:class_name =>"User"
end
