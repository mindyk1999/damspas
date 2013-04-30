class XVocabularyEntry < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => XVocabularyEntryDatastream 
  delegate_to "damsMetadata", [:code, :value, :valueURI, :authority, :authorityURI,:rdf_subject]
  belongs_to :x_vocabulary, :property => 'dams:vocabulary', :class_name => 'XVocabulary'
end
