class Bug < ActiveRecord::Base
  before_create :add_created_dt

  belongs_to :developer, :class_name => "User"
  belongs_to :submitter, :class_name => "User"
  belongs_to :tester, :class_name => "User"
  has_one :version_found, :class_name => "Version"
  has_one :version_integrated, :class_name => "Version"
  has_one :component
  has_one :milestone

  validates_associated :developer
  validates :developer_id, presence: true

  validates_associated :submitter
  validates :submitter_id, presence: true

  validates_associated :tester
  validates :tester_id, presence: true

  validates_associated :version_found
  validates :version_found_id, presence: true
  validates_associated :version_integrated
  # validates :version_integrated_id, presence: true

  validates_associated :milestone
  # validates :milestone_id, presence: true

  validates_associated :component
  validates :component_id, presence: true

  private
    def add_created_dt
      # puts "callback"
      self.submitted_dt = DateTime.current()
    end

end
