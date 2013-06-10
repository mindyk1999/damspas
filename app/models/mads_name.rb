class MadsName < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsNameDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority]
  
end
