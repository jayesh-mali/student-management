class SemestersController < ApplicationController
    before_action :set_semester, only: [:show,:update,:destroy]

    def index
        @semesters = Semester.where(created_by_id:current_user.id)
        render json: @semesters, status: :ok
    end

    def show
        authorize @semester
        render json: @semester, status: :ok
    end

    def create
        semester = Semester.create_semester(create_params,current_user.id)
        if semester.errors.blank?
            render :json => {message: "Semester has been created successfully."}, status: :ok
        else
            render :json => {error: semester.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        authorize @semester
        @semester.update(update_params[:semester])
        if @semester.errors.blank?
            render :json => {message: "Semester has been updated successfully."}, status: :ok
        else
            render :json => {error: @semester.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        authorize @semester
        if @semester.destroy
            render :json => {message: "Semester has been deleted successfully."}, status: :ok
        else
            render :json => {error: "Unable to delete this semester"}, status: :unprocessable_entity
        end
    end

    private

    def set_semester
        @semester = Semester.find(params[:id])
    end

    def create_params
        params.permit(semester: [:name, :credits, :start_date, :end_date])
    end

    def update_params
        params.permit(semester: [:name, :credits, :start_date, :end_date])
    end
end
