class Admin::UnitCategoriesController < ApplicationController
  def index
    @unit_categories = UnitCategory.all
    @unit_category = UnitCategory.new
  end

  def create
    @unit_category = UnitCategory.new(subject_category_params)
    if @unit_category.save
      redirect_to unit_categories_path
    else
      @unit_categories = UnitCategory.all
      render :index
    end
  end

  def edit
  end

  def update
  end

  private

  def unit_category_params
    params.require(:unit_category).permit(:unit)
  end

  private

  def subject_category_params
    params.require(:unit_category).permit(:unit, :subject_category_id)
  end
end
