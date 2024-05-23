class Admin::SubjectCategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @subject_category =SubjectCategory.new
    @subject_categories = SubjectCategory.all
  end

  def create
    @subject_category = SubjectCategory.new(subject_category_params)
    if @subject_category.save
      redirect_to admin_subject_categories_path 
    else
      @subject_categories = SubjectCategory.all
      render :index
    end
  end

  def edit
    @subject_category = SubjectCategory.find(params[:id])
  end

  def update
    @subject_category = SubjectCategory.find(params[:id])
    if @subject_category.update(subject_category_params)
      redirect_to admin_subject_categories_path
    else 
      render :edit
    end 
  end
  
  def destroy
    subject_category = SubjectCategory.find(params[:id])
    subject_category.destroy
    redirect_to admin_subject_categories_path 
  end 

  private

  def subject_category_params
    params.require(:subject_category).permit(:name)
  end
end
