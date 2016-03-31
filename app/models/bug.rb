class Bug < ActiveRecord::Base
  before_create :add_created_dt

  belongs_to :developer, :class_name => "User"

  validates_associated :developer
  validates :developer_id, presence: true

  private
    def add_created_dt
      # puts "callback"
      self.submitted_dt = DateTime.current()
    end

end
