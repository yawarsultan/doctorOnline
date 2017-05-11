class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable
         
  has_one :stream
  has_many :posts
  has_many :presriptions
  has_many :histories
  has_many :appointments

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
        validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
   ROLES = %w[super_admin patient doctor]


  ROLES.each do |r|
    define_method(r+"?") do
      role == r
    end
  end

   def check_admin_user?
    if super_admin? or doctor? 
      true
    else
      false
    end
  end

  def role_enum
    ROLES.map { |role| [role.titlecase, role] } + [["None", " "]]
  end

  def upcoming_appointments
    appointments.order(appointment_time: :desc).select { |a| a.appointment_time > (DateTime.now) }
  end


  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
