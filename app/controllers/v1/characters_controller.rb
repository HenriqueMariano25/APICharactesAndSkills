module V1
	class CharactersController < ApplicationController
	  def index
			@characters = Character.all
    end

      def show
        character = find_character_id(params[:id])
        render json: [{
          data:character
        }]
      end

			def create
				character = Character.new(character_params)
				if character.save
					render json: {
						status: "SUCESSO",
						message: "Saved character",
						data: character
					}, status: :ok
				else
					render json: {
						status: "ERROR",
						messagem: "Character not saved",
						data: character.errors
					}, status: :unprocessable_entity
				end
			end

      def destroy
        character = find_character_id(params[:id])
        character.destroy
        render json: {
          message: "Character delete"
        }
      end

      private

      def find_character_id(id)
        Character.find(id)
      end

			def character_params
				params.permit(:name,:strength,:dexterity,:constitution,:intelligence,
											:wisdom,:charisma)
			end
		end
	end
