class MadsOccupation < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsOccupationDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority]
  
end
