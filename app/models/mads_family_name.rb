class MadsFamilyName < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsFamilyNameDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority]
  
end
