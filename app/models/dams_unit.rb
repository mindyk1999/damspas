class DamsUnit < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => DamsUnitDatastream
  delegate_to "damsMetadata", [:group,:name,:description,:uri,:code]
  
  #lowercase the code
  #before_save { self.code = self.code.to_s.downcase! }
  
  # all unit properties are currently required
  validates :name, presence: true
  validates :description, presence: true
  validates :uri, presence: true
  validates :code, presence: true
  
  # rights metadata
  has_metadata 'rightsMetadata', :type => Hydra::Datastream::RightsMetadata
  include Hydra::ModelMixins::RightsMetadata

end
