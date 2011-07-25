class Submission < ActiveRecord::Base
#  belongs_to :user
  belongs_to :patent
  belongs_to :submitter , :class_name =>"User"
end
