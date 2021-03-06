class DamsUnitsController < ApplicationController

  layout "homepage"

  include Blacklight::Catalog
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:index, :show]

  ##############################################################################
  # solr actions ###############################################################
  ##############################################################################
  def show
    parm={ :q => "unit_code_tesim:#{params[:id]} AND type_tesim:DamsUnit" }
    @document = get_single_doc_via_search(1,parm)
logger.warn "solr: #{@document.inspect}"
    @current_unit = @document['unit_name_tesim']
    @carousel_resp, @carousel = get_search_results( :q => "title_tesim:carousel AND unit_code_tesim:#{params[:id]}", :qt=>"standard")
  end
  
  def index
    # hydra index
    #@dams_units = DamsUnit.all( :order=>"system_create_dtsi asc" )

    # solr index
    @response, @document = get_search_results(:q => 'has_model_ssim:"info:fedora/afmodel:DamsUnit"' )
    @carousel_resp, @carousel = get_search_results( :q => "title_tesim:carousel")
  end

  ##############################################################################
  # hydra actions ##############################################################
  ##############################################################################
  def view
    @dams_unit = DamsUnit.find(params[:id])
  end

  def new

  end

  def edit
    #@dams_unit = DamsUnit.find(params[:id])
  end

  def create
    @dams_unit.attributes = params[:dams_unit]
    if @dams_unit.save
        redirect_to view_dams_unit_path @dams_unit, notice: "Unit has been saved"
    else
      flash[:alert] = "Unable to save unit"
      render :new
    end
  end

  def update
    @dams_unit.attributes = params[:dams_unit]
    if @dams_unit.save
        redirect_to view_dams_unit_path @dams_unit, notice: "Successfully updated unit"
    else
      flash[:alert] = "Unable to save unit"
      render :edit
    end
  end

end
