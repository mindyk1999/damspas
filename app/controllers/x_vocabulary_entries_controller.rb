class XVocabularyEntriesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def load_vocab
    @x_vocabulary_entry.outbound_relationships.each do |rel|
      if rel.predicate == 'info:fedora/fedora-system:def/relations-external#dams:vocabulary'
        vocid = rel.object.to_s.gsub('info:fedora/','').gsub('/','')
        @x_vocabulary_entry.x_vocabulary = XVocabulary.find( vocid )
      end
    end
  end
  def show
    load_vocab
  end

  def new
  end

  def edit
    load_vocab
  end
  def save
  end

  def create
    @x_vocabulary_entry.attributes = params[:x_vocabulary_entry]
    if @x_vocabulary_entry.save
        redirect_to @x_vocabulary_entry, notice: "Vocabulary Entry has been saved"
    else
      flash[:alert] = "Unable to save vocabulary entry"
      render :new
    end
  end

  def update
    @x_vocabulary_entry.attributes = params[:x_vocabulary_entry]
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
