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
  validate :status_and_substatus_valid

  private
    def add_created_dt
      self.submitted_dt = DateTime.current()
    end

    def add_new_status
      self.status = Status.find_by(:name => "NEW")
      self.substatus = Substatus.find_by(:name => "---")
    end

    def status_and_substatus_valid
      if self.new_record? #don't validate on new record; add_new_status handles it
        return true
      end
      if self.status.substatus_eligible && self.substatus.no_substatus?
        errors.add(:substatus, "No substatus has been assigned to eligible status")
      end
      if !self.status.substatus_eligible && !self.substatus.no_substatus?
        errors.add(:substatus, "This kind of status (#{status.name}) cannot have a valid substatus")
      end
    end
end
