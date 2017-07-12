class ResumesController < ApplicationController
  # HEADER = { "Accept" => "application/json", "X-User-Email" => "sami@gmail.com", "Authorization" => "Token token=purple_hippo" }
  def index

    @students = Student.all
    render :index
  end

  def show
    @student = Student.find_by(id: params[:id])
    render :show
  end
end
