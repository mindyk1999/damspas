class XVocabulary < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => XVocabularyDatastream 
  delegate_to "damsMetadata", [:description,:rdf_subject]
  has_many :x_vocabulary_entries, :property => :vocabularyEntry, :inverse_of => :x_vocabulary
end