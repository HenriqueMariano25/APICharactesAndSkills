	module V1
		class CharactersController < ApplicationController
      def index
        characters = Character.all
        render json: {
          status: 'SUCCESS',
          message:'Artigos carregados',
          data:characters
        },status: :ok
      end

      def show
        character = find_character_id(params[:id])
        render json: {
          data:character
        }
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
		end
	end
