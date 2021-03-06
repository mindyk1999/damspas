class DamsCartographicsDatastream < ActiveFedora::RdfxmlRDFDatastream
  map_predicates do |map|
    map.point(:in=>DAMS)
    map.line(:in=>DAMS)
    map.polygon(:in=>DAMS)
    map.projection(:in=>DAMS)
    map.referenceSystem(:in=>DAMS)
    map.scale(:in=>DAMS)
  end

  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}

  def serialize
    graph.insert([rdf_subject, RDF.type, DAMS.Cartographics]) if new?
    super
  end

  def to_solr (solr_doc = {})
    Solrizer.insert_field(solr_doc, "cartographics_point", point)
    Solrizer.insert_field(solr_doc, "cartographics_line", line)
    Solrizer.insert_field(solr_doc, "cartographics_polygon", polygon)
    Solrizer.insert_field(solr_doc, "cartographics_projection", projection)
    Solrizer.insert_field(solr_doc, "cartographics_referenceSystem", referenceSystem)
    Solrizer.insert_field(solr_doc, "cartographics_scale", scale)

    # hack to strip "+00:00" from end of dates, because that makes solr barf
    ['system_create_dtsi','system_modified_dtsi'].each { |f|
      if solr_doc[f].kind_of?(Array)
        solr_doc[f][0] = solr_doc[f][0].gsub('+00:00','Z')
      elsif solr_doc[f] != nil
        solr_doc[f] = solr_doc[f].gsub('+00:00','Z')
      end
    }
    return solr_doc
  end
end
