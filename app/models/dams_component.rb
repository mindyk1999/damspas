class DamsComponent < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => DamsComponentDatastream 
  delegate_to "damsMetadata", [:title, :titleValue, :subtitle, :typeOfResource, :date, :beginDate, :endDate, :subject, :component, :file, :relatedResource ]
end
