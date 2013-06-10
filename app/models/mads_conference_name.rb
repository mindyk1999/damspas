class MadsConferenceName < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsConferenceNameDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :type, :externalAuthority]
  
end
