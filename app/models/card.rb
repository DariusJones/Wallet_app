class Card < ActiveRecord::Base
	validates :number, presence: true, uniqueness: true, length: {minimum: 15, maximum: 16}
	validates :exp_year, numericality: {greater_than_or_equal_to: Time.now.year}
	validates :exp_month, inclusion: {in: 1..12}

	before_save :get_credit_card_type
	def get_credit_card_type
		if number.starts_with?("4")
			self.card_type = "visa"
		elsif number.starts_with?("55")
			self.card_type = "mastercard"
		elsif number.starts_with?("34") || number.starts_with?("37")
			self.card_type = "american_express"
		else
			self.card_type = "Special Card"
		end
	end			
				



	has_many :users, through: :cards
end
