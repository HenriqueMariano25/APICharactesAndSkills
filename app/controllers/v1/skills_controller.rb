module V1
	class SkillsController < ApplicationController
    def index
      @skills = Skill.where(character_id: params[:character_id])
      p "oi #{params}"
    end
    def show

    end
  end
end
