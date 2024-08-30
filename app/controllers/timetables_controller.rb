class TimetablesController < ApplicationController
  before_action :authenticate_user!

  def new
    @timetable = current_user.timetables.new
    @timetable.timetable_type = params[:type]
    @timetable.meals.build.ingredients.build
  end

  def create
    @timetable = current_user.timetables.new(timetable_params)
    if @timetable.save
      redirect_to @timetable, notice: "Timetable was successfully created."
    else
      render :new
    end
  end

  private

  def timetable_params
    params.require(:timetable).permit(
      :title, :timetable_type, :start_date, :end_date,
      meals_attributes: [:id, :name, :recipe, :_destroy,
        ingredients_attributes: [:id, :name, :quantity, :_destroy]]
    )
  end
end
