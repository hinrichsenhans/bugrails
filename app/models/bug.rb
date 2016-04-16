class Bug < ActiveRecord::Base
  #callbacks
  before_create :add_created_dt, :add_new_status

  #associations
  belongs_to :developer, :class_name => "User"
  belongs_to :submitter, :class_name => "User"
  belongs_to :tester, :class_name => "User"

  belongs_to :product

  belongs_to :component
  belongs_to :version_found, :class_name => "Version"
  belongs_to :version_integrated, :class_name => "Version"
  belongs_to :milestone

  belongs_to :status
  belongs_to :substatus

  #validations
  validates :title, :presence => true
  # "It's broke" is 10 characters, so descriptions need to at least try to be verbose
  validates :description, length: { minimum: 6 }

  validates_presence_of   :developer
  validates_presence_of   :submitter
  validates_presence_of   :tester

  validates_presence_of :version_found      #cannot be blank
  validates_associated  :version_integrated #can be blank

  validates_associated :milestone

  validates_presence_of :component

  private
    def add_created_dt
      self.submitted_dt = DateTime.current()
    end

    def add_new_status
      self.status = Status.find_by(:name => "NEW")
    end
end
