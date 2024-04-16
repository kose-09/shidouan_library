class Public::PostsController < ApplicationController
  def index
  end 
  
  def show
  end 
  
  def new
  end 
  
  def create
  end 
  
  def edit
  end 
  
  def update
  end 
  
  def destroy
  end 
  
  def pdf
  end 
  
  def search
  end 
  
  def search_result
  end 
  
  private

  def post_params
    params.require(:post).permit(:title, :shidouan_pdf, :caption)
  end
end
