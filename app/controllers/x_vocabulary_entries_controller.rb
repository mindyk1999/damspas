class XVocabularyEntriesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def load_vocab
logger.warn("x_vocabulary_entry_controller.load_vocab");
    @x_vocabulary_entry.outbound_relationships.each do |rel|
      if rel.predicate == 'info:fedora/fedora-system:def/relations-external#dams:vocabulary'
        vocid = rel.object.to_s.gsub('info:fedora/','').gsub('/','')
        logger.warn("vocid: #{vocid}")
        @x_vocabulary_entry.x_vocabulary = XVocabulary.find( vocid )
      end
    end
  end
  def show
logger.warn("x_vocabulary_entry_controller.show");
    #@x_vocabulary_entry = XVocabularyEntry.find(params[:id])
    load_vocab
  end

  def new
logger.warn("x_vocabulary_entry_controller.new");
  end

  def edit
logger.warn("x_vocabulary_entry_controller.edit");
    load_vocab
  end
  def save
logger.warn("x_vocabulary_entry_controller.save");
  end

  def create
logger.warn("x_vocabulary_entry_controller.create1");
    #@x_vocabulary_entry = XVocabularyEntry.new
logger.warn("x_vocabulary_entry_controller.create2");
    @x_vocabulary_entry.attributes = params[:x_vocabulary_entry]
logger.warn("x_vocabulary_entry_controller.create3");
    if @x_vocabulary_entry.save
logger.warn("x_vocabulary_entry_controller.create4");
        redirect_to @x_vocabulary_entry, notice: "Vocabulary Entry has been saved"
logger.warn("x_vocabulary_entry_controller.create5");
    else
logger.warn("x_vocabulary_entry_controller.create6");
      flash[:alert] = "Unable to save vocabulary entry"
logger.warn("x_vocabulary_entry_controller.create7");
      render :new
logger.warn("x_vocabulary_entry_controller.create8");
    end
logger.warn("x_vocabulary_entry_controller.create9");
  end

  def update
logger.warn("x_vocabulary_entry_controller.update");
    #@x_vocabulary_entry = XVocabularyEntry.new
    @x_vocabulary_entry.attributes = params[:x_vocabulary_entry]
#XXX load vocab link here
    if @x_vocabulary_entry.save
        redirect_to @x_vocabulary_entry, notice: "Successfully updated vocabulary entry"
    else
      flash[:alert] = "Unable to save vocabulary entry"
      render :edit
    end
  end

  def index
logger.warn("x_vocabulary_entry_controller.index");
    @x_vocabulary_entries = XVocabularyEntry.all
  end

end
