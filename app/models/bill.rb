class Bill < ActiveRecord::Base
  belongs_to :patent
  belongs_to :user
end


