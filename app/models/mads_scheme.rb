class MADSScheme < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MADSSchemeDatastream
  delegate_to 'damsMetadata', [ :code, :name ]
end
