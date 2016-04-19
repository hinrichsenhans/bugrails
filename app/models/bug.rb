class Bug < ActiveRecord::Base
  #callbacks
  before_create :add_created_dt

  #associations
  belongs_to :developer, :class_name => "User"
  belongs_to :submitter, :class_name => "User"
  belongs_to :tester, :class_name => "User"

  belongs_to :product

  belongs_to :component
  belongs_to :version_found, :class_name => "Version"
  belongs_to :version_integrated, :class_name => "Version"
  belongs_to :milestone

  #validations
  validates_presence_of   :developer
  validates_presence_of   :submitter
  validates_presence_of   :tester

  validates_presence_of :version_found      #cannot be blank
  validates_associated  :version_integrated #can be blank

  validates_associated :milestone

  validates_presence_of :component

  private

  # active record will create the time stamps for you on ever model. If you let
  # it be there when you generate the model. Unless you need something different
  # I would encourage you to use that field.
    def add_created_dt
      self.submitted_dt = DateTime.current()
    end

end
