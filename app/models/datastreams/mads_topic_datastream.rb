class MadsTopicDatastream < MadsDatastream
  map_predicates do |map|
    map.name(:in => MADS, :to => 'authoritativeLabel')
    map.sameAsNode(:in => OWL, :to => 'sameAs')
    map.authority(:in => DAMS, :to => 'authority')
    map.valURI(:in => DAMS, :to => 'valueURI')
    #map.elementList(:in => MADS, :to => 'elementList', :class_name=>'List')
    map.elementList(:in => MADS, :to => 'elementList', :class_name => "ElementList")
  end
  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
  def default_write_point_for_values
    [:elementList, :topicElement]
  end
  def serialize
    graph.insert([rdf_subject, RDF.type, MADS.Topic]) if new?
    super
  end
  accepts_nested_attributes_for :elementList
end
