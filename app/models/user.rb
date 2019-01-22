class User < ApplicationRecord
  include Clearance::User

  has_many :artist_works
  has_many :promotions, through: :artist_works

  belongs_to :title, optional: true

	enum role: ["artist","operator","admin"]
	mount_uploader :avatar, AvatarUploader

	# Verifies that email field is not blank and that it prevents duplicates#
	validates_confirmation_of :password
	validates :email, uniqueness: true
	validates :first_name, :last_name, :email, presence: true
	validates :phone_number, :allow_blank => true, length: { minimum: 10, maximum: 20, message: 'Please provide area code' }, on: :update
	before_update :facebook_format, :instagram_format, :linkedin_format

  def fullname
		[first_name, last_name].join(' ')
	end

	# title to create relation for booking appointment
	def self.artist
  	User.where(role: [:operator,:artist])
  end


  	def facebook_format
  		if !facebook.nil?
  		errors.add(:facebook, "Wrong format") unless facebook.downcase.start_with?('https://', 'http://') ||  facebook == ""
  		end
	end
  def instagram_format
  	if  !instagram.nil?
  		errors.add(:instagram, "Wrong format") unless instagram.downcase.start_with?('https://', 'http://')  || instagram == ""
		end
	end
	def linkedin_format
		if !linkedin.nil?	
  		errors.add(:linkedin, "Wrong format") unless linkedin.downcase.start_with?('https://', 'http://') ||  linkedin == "" 
  		end	
	end
  	##### admin panel custom label ######
	def custom_label_method
    "#{self.email}"
  end
end
