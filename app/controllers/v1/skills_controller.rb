module V1
	class SkillsController < ApplicationController

    def index
      @skills = Skill.where(character_id: params[:character_id])
    end

		def create
			skill = Skill.new(skill_params)
			if skill.save
				render json: {
					status: "SUCESSO",
					message: "Saved skill",
					data: skill
				}, status: :ok
			else
				render json: {
					status: "ERROR",
					messagem: "Skill not saved",
					data: skill.errors
				}, status: :unprocessable_entity
			end
    end

		def update
			skill = Skill.find(params[:id])
			if skill.update(skill_params)
				render json:{
					menssagem: "Skill atualizada com sucesso"
				}
			else
				render json: {
					menssagem: "Erro ao atualizar skill"
				}
			end
		end

		def destroy
			skill = Skill.find(params[:id])
			if skill.destroy
				render json: {
	        message: "Skill delete"
	      }
			else
				render json: {
	        message: "Erro ao deletar skill"
	      }
			end
		end



		private

		def skill_params
			params.require(:skill).permit(:character_id,:name,:ability,:proficient)
		end
  end
end
