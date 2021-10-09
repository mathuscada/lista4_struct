class Api::V1::TeachersController < ApplicationController
    acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
    def index
        teachers = Teacher.all
        render json: teachers, status: :ok
    end

    def show
        teacher = Teacher.find(params[:id])
        render json: teacher, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        teacher = Teacher.new(teacher_params)
        teacher.save!
        render json: teacher, status: :created
    rescue StandardError
        head(:unprocessable_entity)
    end

    def update
        teacher = Teacher.find(params[:id])
        teacher.update!(teacher_params)
        render json: teacher, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        teacher = Teacher.find(params[:id])
        teacher.destroy!
        render json: teacher, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def my_students
        teacher = Teacher.find(params[:id])
        students = teacher.students
        render json: students, status: :ok
    rescue StandardError
        head(:not_found)
    end

    private

    def teacher_params
        params.require(:teacher).permit(
            :name,
            :email,
            :birth_date
        )
    end
end
