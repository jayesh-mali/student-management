class StudentsController < ApplicationController

    before_action :set_student, only: [:show,:update,:destroy]

    def index
        @students = Student.where(created_by_id:current_user.id)
        render json: @students, status: :ok, include: ['semester']
    end


    def show
        authorize @student
        render json: @student, status: :ok, include: ['semester']
    end

    def create
        student = Student.create_student(create_params,current_user.id)
        if student.errors.blank?
            render :json => {message: "Student has been created successfully."}, status: :created
        else
            render :json => {error: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        authorize @student
        @student.update(update_params)
        if @student.errors.blank?
            render :json => {message: "Student has been updated successfully."}, status: :ok
        else
            render :json => {error: @student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        authorize @student
        if @student.destroy
            render :json => {message: "Student has been deleted successfully."}, status: :ok
        else
            render :json => {error: "Unable to delete this student"}, status: :unprocessable_entity
        end
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def create_params
        params.permit(student: [:name, :age, :dob, :description], semester: [:name])
    end

    def update_params
        params.permit(student: [:name, :age, :dob, :description])
    end
end
