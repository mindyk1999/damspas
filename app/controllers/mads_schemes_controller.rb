class MADSSchemesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def show
    @madsscheme = MADSScheme.find(params[:id])
  end

  def new

  end

  def edit

  end

  def create
    @madsscheme.attributes = params[:mads_scheme]
    if @mads_scheme.save
        redirect_to @mads_scheme, notice: "MADSScheme has been saved"
    else
      flash[:alert] = "Unable to save MADSScheme"
      render :new
    end
  end

  def update
    @madsscheme.attributes = params[:madsscheme]
    if @madsscheme.save
        redirect_to @madsscheme, notice: "Successfully updated MADSScheme"
    else
      flash[:alert] = "Unable to save MADSScheme"
      render :edit
    end
  end

  def index
    @madsschemes = MADSScheme.all
  end

end
