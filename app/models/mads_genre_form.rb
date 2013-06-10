class MadsGenreForm < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsGenreFormDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority]
  
end
