class MADSSchemeDatastream < ActiveFedora::RdfxmlRDFDatastream
  #include ActiveFedora::RdfObject
  #rdf_type MADS.MADSScheme
  map_predicates do |map|
    map.code( in: MADS )
    map.name( in: RDF::RDFS, to: "label" )
  end
  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
  def serialize
    graph.insert([rdf_subject, RDF.type, MADS.MADSScheme]) if new?
    super
  end
end
