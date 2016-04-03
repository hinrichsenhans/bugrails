class Bug < ActiveRecord::Base
  before_create :add_created_dt
  validate :version_found_valid,
    :version_integrated_valid_or_nil

  belongs_to :developer, :class_name => "User"
  belongs_to :submitter, :class_name => "User"
  belongs_to :tester, :class_name => "User"

  belongs_to :product


  #cannot has_one through has_many
  #https://groups.google.com/forum/#!topic/rubyonrails-talk/TBB7kU5I2so
  def version_found
    self.product ? self.product.versions[id: version_found_id] : nil
  end
  has_one :version_integrated, :class_name => "Version"
  has_one :component
  has_one :milestone

  validates_associated :developer
  validates_presence_of :developer
  validates :developer_id, presence: true

  validates_associated :submitter
  validates_presence_of :submitter
  validates :submitter_id, presence: true

  validates_associated :tester
  validates_presence_of :tester
  validates :tester_id, presence: true

  # validates_associated :version_found
  # validates_presence_of :version_found
  # validates :version_found_id, presence: true
  # validates_associated :version_integrated
  # validates :version_integrated_id, presence: true

  # validates_associated :milestone
  # validates :milestone_id, presence: true

  # validates_associated :component
  # validates_presence_of :component
  # validates :component_id, presence: true

  private
    def add_created_dt
      puts "\n\n\ncallback\n\n\n"
      self.submitted_dt = DateTime.current()
    end

    def version_found_valid
      p self
      p self.product
      if self.product.nil?
        errors.add(:product, "is not valid")
      end
      if version_found_id.nil?
        errors.add(:version_found_id, "is nil")
      end
      if self.product.versions.find_by(id: version_found_id).nil?
        errors.add(:version_found_id, "is not associated with the product")
      end
    end

    def version_integrated_valid_or_nil
      if self.product.nil?
        errors.add(:product, "is not valid")
      end
      if version_found_id.nil?
        errors.add(:version_integrated_id, "is nil")
      end
      if self.product.versions.find_by(id: version_found_id).nil?
        errors.add(:version_integrated_id, "is not associated with the product")
      end
    end

    def validatate_subobject_to_product(object, okToBeNil)

    end
end
