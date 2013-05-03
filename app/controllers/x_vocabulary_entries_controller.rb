class XVocabularyEntriesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def show
    vid = @x_vocabulary_entry.vocabulary.first.to_s.gsub(/.*\//,"")
    @x_vocabulary_entry.x_vocabulary = XVocabulary.find( vid )
  end

  def new
  end

  def edit
    vid = @x_vocabulary_entry.vocabulary.first.to_s.gsub(/.*\//,"")
    @x_vocabulary_entry.x_vocabulary_id = vid
  end
  def save
  end

  def create
    obj = params[:x_vocabulary_entry]
    vid = obj.delete('vocabulary')
    @x_vocabulary_entry.attributes = obj
    @x_vocabulary_entry.vocabulary = "#{Rails.configuration.id_namespace}#{vid}"
    if @x_vocabulary_entry.save
        redirect_to @x_vocabulary_entry, notice: "Vocabulary Entry has been saved"
    else
      flash[:alert] = "Unable to save vocabulary entry"
      render :new
    end
  end

  def update
    obj = params[:x_vocabulary_entry]
    vid = obj.delete('vocabulary')
    @x_vocabulary_entry.attributes = obj
    @x_vocabulary_entry.vocabulary = "#{Rails.configuration.id_namespace}#{vid}"
    if @x_vocabulary_entry.save
        redirect_to @x_vocabulary_entry, notice: "Successfully updated vocabulary entry"
    else
      flash[:alert] = "Unable to save vocabulary entry"
      render :edit
    end
  end

  def index
    @x_vocabulary_entries = XVocabularyEntry.all
  end

end
