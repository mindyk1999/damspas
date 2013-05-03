class XVocabularyEntry < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => XVocabularyEntryDatastream 
  delegate_to "damsMetadata", [:code, :value, :valueURI, :authority, :authorityURI,:rdf_subject]
  belongs_to :x_vocabulary, :property => 'dams:vocabulary', :inverse_of => :vocabulary
  def vocabulary
    damsMetadata.vocabulary
  end
  def vocabulary=(uri)
    damsMetadata.vocabulary = RDF::Resource.new(uri)
  end
end
