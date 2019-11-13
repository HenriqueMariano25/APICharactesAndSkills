#Para poder criar ou dar um update , na hora de mandar uma url no POSTMAN colocar character[name] por exemplo

module V1
	class CharactersController < ApplicationController
	  def index
			@characters = Character.str_gt(params['str_gt']).str_lt(params['str_lt'])
														 .dex_gt(params['dex_gt']).dex_lt(params['dex_lt'])
														 .con_gt(params['con_gt']).con_lt(params['con_lt'])
														 .int_gt(params['int_gt']).int_lt(params['int_lt'])
														 .wis_gt(params['wis_gt']).wis_lt(params['wis_lt'])
														 .str_gt(params['str_gt']).str_lt(params['str_lt'])
														 .cha_gt(params['cha_gt']).cha_lt(params['cha_lt'])
														 .character_name(params['character_name'])
														 .includes(:skill)
    end

    def show
      character = find_character_id(params[:id])
      render json: [{
        data:character
      }]
    end

		def create
			p "Teste #{params}"
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

		def update
			character = find_character_id(params[:id])
			character.update(character_params)
		end

    private

    def find_character_id(id)
      Character.find(id)
    end

		def character_params
			params.require(:character).permit(:name,:strength,:dexterity,:constitution,:intelligence,:wisdom,:charisma)
		end

	end
end
