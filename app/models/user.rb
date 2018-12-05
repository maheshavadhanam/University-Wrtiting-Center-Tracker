class User < ApplicationRecord
	has_many :tasks , :dependent=> :destroy, :autosave => true
	before_save :encrypt_password, :send_email
	EMAIL_REGEX = /\A.+@.+\Z/i
	validates :email, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create

	def self.is_admin(id)
		User.find(id).admin
	end

	def encrypt_password
	  if password.present?
	    self.salt = BCrypt::Engine.generate_salt
	    self.password= BCrypt::Engine.hash_secret(password, salt)
	  end
	end

	def send_email
		self.confirm_code = BCrypt::Engine.hash_secret(self.email,self.salt)
		ConfMailer.send_conf_email(self).deliver_now
	end

	def set_confirm
		self.update_column(:confirm_code, nil)
		self.update_column(:confirm, true)
	end

	def get_reset_code
		code = BCrypt::Engine.hash_secret("#{self.email}#{Time.now.to_s}",self.salt)
		self.update_column(:confirm_code, code)
		return code
	end

	def set_password(pass)
		self.update_column(:password , BCrypt::Engine.hash_secret(pass,self.salt))
		self.update_column(:confirm_code, nil)
	end

	def self.authenticate(email="", login_password="")
	  user = User.find_by(email: email)
		if user
			match = (user.password == BCrypt::Engine.hash_secret(login_password, user.salt))
		end
	  if user && match
	    return user
		end
	    return false
	end
end
