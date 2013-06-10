class MadsGeographic < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsGeographicDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority]
  
end
