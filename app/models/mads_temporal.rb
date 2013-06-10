class MadsTemporal < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsTemporalDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :authority, :externalAuthority, :elementListValue]
  
end
