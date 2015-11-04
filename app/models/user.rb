class User < ActiveRecord::Base
	validates :fname, presence: true
	validates :lname, presence: true
	validates :email, presence: true, uniqueness: { message:
		"Your email is not unique!"
	}
	validates :password, presence: true, length: {minimum: 5}
	validates :birth_day, presence: true, inclusion: { in: 1..31 }
	validates :birth_month, presence: true, inclusion: { in:1..12 }
	validates :balance, numericality: { greater_than_or_equal_to: 0}
	validate :email_format_should_contain_at_sign
	before_save :format_phone_number

	def email_format_should_contain_at_sign
		if email.match(/@/).nil?
			errors.add( :email_format, "'#{email}' does not contain an @ sign")
		end
	end
	
	def format_phone_number
		cleanup = self.phone.gsub(" ","").gsub(".","").gsub("-","")
		self.phone = cleanup
	end

	has_many :cards, through: :user_cards

end
