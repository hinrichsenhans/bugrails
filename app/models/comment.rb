class Comment < ActiveRecord::Base
  validates :comment, :presence => true
  validates_presence_of :user
  validates_presence_of :bug
  
  belongs_to :user
  belongs_to :bug

end
