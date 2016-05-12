class User < ActiveRecord::Base
  attr_accessor :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  # validates :password, length: { in: 6..30}

  has_many :developer_assigned_bugs, :class_name => 'Bug', :foreign_key => 'developer_id'
  has_many :submitted_bugs, :class_name => 'Bug', :foreign_key => 'submitter_id'
  
  has_many :comments

  has_secure_password

  
  #heavily influenced by the RoR tutorial - trying not to reinvent the wheel for secure login/pw reset/activate
  #I am trying a few things over in the routes file, FWIW
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    BCrypt::Password.create(string, cost: BCrypt::Engine.cost)
  end

  def authenticated(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def validate_email?
    User.validators_on(:email).each do |validator|
      if(validator.kind == :uniqueness)
        next
      end
      validator.validate_each(self, :email, self.email)
    end
    if !self.errors.messages.empty?
      puts "errors: "
      puts self.errors.messages.inspect
      return false
    end
    return true
  end

  def update_reset_token
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(self.reset_token))
    update_attribute(:reset_requested_at, Time.zone.now)
  end

  private

    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      puts self.activation_token
      self.activation_digest = User.digest(activation_token)
    end    

end
