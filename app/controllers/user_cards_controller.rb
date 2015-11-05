class UserCardsController < ApplicationController
	def create
		puts "UserCardsController.create() #{params}"		
		# user_id = params[:user_id]
		# card_id = params[:card_id] 
		result = UserCard.create(
			user_id: params[:user_id], 
			card_id: params[:card_id]
			)
		redirect_to user_cards_path
	end

	def index
	@user_cards = UserCard.all

	end
end
