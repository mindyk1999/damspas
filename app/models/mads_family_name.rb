class MadsFamilyName < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsFamilyNameDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :scheme, :externalAuthority]
  
end
