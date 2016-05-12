class User < ActiveRecord::Base
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  # validates :password, length: { in: 6..30}

  has_many :developer_assigned_bugs, :class_name => 'Bug', :foreign_key => 'developer_id'
  has_many :submitted_bugs, :class_name => 'Bug', :foreign_key => 'submitter_id'
  
  has_many :comments

  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private



    def downcase_email
      self.email = email.downcase
    end

    #digest methods are from the RoR Tutorial
    def User.digest(string)
      BCrypt::Password.create(string, cost: BCrypt::Engine.cost)
    end

    def create_activation_digest
      self.activation_token = User.new_token
      puts self.activation_token
      self.activation_digest = User.digest(activation_token)
    end    

end
