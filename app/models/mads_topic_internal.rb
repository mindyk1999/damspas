class MadsTopicInternal
    include ActiveFedora::RdfObject
    include DamsHelper
    rdf_type MADS.Topic
  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
  map_predicates do |map|
    map.name(:in => MADS, :to => 'authoritativeLabel')
    map.authority(:in => DAMS, :to => 'authority')
    map.externalAuthorityNode(:in => MADS, :to => 'hasExactExternalAuthority')
    map.elementList(:in => MADS, :to => 'elementList', :class_name => "ElementList")
  end 
  def default_write_point_for_values
    [:elementList]
  end  
  def pid
      rdf_subject.to_s.gsub(/.*\//,'')
  end
  accepts_nested_attributes_for :elementList
end
