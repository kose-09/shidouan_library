class Admin::UnitCategoriesController < ApplicationController
  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def unit_category_params
    params.require(:unit_category).permit(:unit)
  end
end
