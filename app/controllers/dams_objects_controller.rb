class DamsObjectsController < ApplicationController
  load_and_authorize_resource
  
  def show

  end

  def new
  
  end
  
  def edit
  
  end
  
  def create
  	@dams_object.attributes = params[:dams_object]
  	if @dams_object.save
  		redirect_to catalog_index_path, notice: "Object has been saved"
    else
      flash[:alert] = "Unable to save object"
      render :new
    end
  end
end
