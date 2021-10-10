class Api::V1::LanguagesController < ApplicationController
    acts_as_token_authentication_handler_for Admin, only: [:create, :delete]
    def index
        languages = Language.all
        render json: languages, status: :ok
    end

    def show
        language = Language.find(params[:id])
        render json: language, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        language = Language.new(language_params)
        language.save!
        render json: language, status: :created
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        language = Language.find(params[:id])
        language.destroy!
        render json: language, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    private

    def language_params
        params.require(:language).permit(
            :name,
            :teacher_id,
            documentations: []
        )
    end
end
