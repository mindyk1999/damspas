class MadsTopicDatastream < MadsDatastream
  map_predicates do |map|
    map.name(:in => MADS, :to => 'authoritativeLabel')
    map.authority(:in => DAMS, :to => 'authority')
    map.externalAuthorityNode(:in => MADS, :to => 'hasExactExternalAuthority')
    map.elementList(:in => MADS, :to => 'elementList', :class_name => "ElementList")
  end
  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
  def default_write_point_for_values
    [:elementList, :topicElement, :elementValue]
  end
  def elementListValue
  	eList = elementList.first    
	eList[0] ?	eList[0].elementValue.first : []	
  end
  def elementListValue=(val)
    if elementList[0] == nil
      elementList.build
      elementList.first.topicElement.build
    end
	elementList.first.topicElement.first.elementValue = val 
  end       
  def serialize
    graph.insert([rdf_subject, RDF.type, MADS.Topic]) if new?
    super
  end
  accepts_nested_attributes_for :elementList
end
