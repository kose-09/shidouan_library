class Admin::SubjectCategoriesController < ApplicationController
  def index
    @subject_category =SubjectCategory.new
    @subject_categories = SubjectCategory.all
  end

  def create
    @subject_category = SubjectCategory.new(subject_category_params)
    if @subject_category.save
      redirect_to subject_categories_path
    else
      @subject_categories = SubjectCategory.all
      render :index
    end
  end

  def edit
  end

  def update
  end

  private

  def subject_category_params
    params.require(:subject_category).permit(:subject)
  end
end
