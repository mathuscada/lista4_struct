class Api::V1::StudentsController < ApplicationController
    acts_as_token_authentication_handler_for Admin, only: [:create, :update, :delete]
    def index
        students = Student.all
        render json: students, status: :ok
    end

    def show
        student = Student.find(params[:id])
        render json: student, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        student = Student.new(student_params)
        student.save!
        render json: student, status: :created
    rescue StandardError
        head(:unprocessable_entity)
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        student = Student.find(params[:id])
        student.destroy!
        render json: student, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    private

    def student_params
        params.require(:student).permit(
            :name,
            :matricula,
            :email,
            :birth_date,
            :teacher_id
        )
    end
end
