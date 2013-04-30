class XVocabulariesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def show
    #@x_vocabulary = XVocabulary.find(params[:id])
  end

  def new

  end

  def edit

  end

  def create
    @x_vocabulary.attributes = params[:x_vocabulary]
    if @x_vocabulary.save
        redirect_to @x_vocabulary, notice: "Vocabulary has been saved"
    else
      flash[:alert] = "Unable to save vocabulary"
      render :new
    end
  end

  def update
    @x_vocabulary.attributes = params[:x_vocabulary]
    if @x_vocabulary.save
        redirect_to @x_vocabulary, notice: "Successfully updated vocabulary"
    else
      flash[:alert] = "Unable to save vocabulary"
      render :edit
    end
  end

  def index
    @x_vocabularies = XVocabulary.find(:all)
  end


end
