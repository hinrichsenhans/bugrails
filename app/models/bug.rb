class Bug < ActiveRecord::Base
  before_create :add_created_dt

  belongs_to :developer, :class_name => "User"
  belongs_to :submitter, :class_name => "User"
  belongs_to :tester, :class_name => "User"

  validates_associated :developer
  validates :developer_id, presence: true

  validates_associated :submitter
  validates :submitter_id, presence: true

  validates_associated :tester
  validates :tester_id, presence: true

  private
    def add_created_dt
      # puts "callback"
      self.submitted_dt = DateTime.current()
    end

end
