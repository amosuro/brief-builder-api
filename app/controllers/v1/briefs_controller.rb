module V1
  class BriefsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    # GET /v1/briefs
    # Get all the briefs
    def index
      @briefs = Brief.includes(:user).order(created_at: :desc).all
      render json: @briefs, each_serializer: BriefsSerializer
    end

    def show
      @brief = Brief.find(params[:id])
      render json: @brief, serializer: BriefSerializer
    end

    # POST /v1/briefs
    # Add a new brief
    def create
      @brief = Brief.new(brief_params)

      if @brief.save
        render json: @brief, serializer: BriefSerializer
      else
        render json: { error: t('brief_create_error') }, status: :unprocessable_entity
      end
    end

    private

    def brief_params
      params.require(:brief).permit(:title).merge(user: current_user)
    end

  end
end
