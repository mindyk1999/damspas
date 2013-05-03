class XVocabularyEntryDatastream < ActiveFedora::RdfxmlRDFDatastream
  map_predicates do |map|
    map.code(:in => DAMS)
    map.value(:in => RDF)
    map.authority(:in => DAMS)
    map.authURI(:in => DAMS, :to => 'authorityURI' )
    map.valURI(:in => DAMS, :to => 'valueURI' )
    map.vocabulary(:in => DAMS)
  end

  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}

  def authorityURI=(val)
    @authURI = RDF::Resource.new(val)
  end
  def authorityURI
    if @authURI != nil
      @authURI
    else
      authURI
    end
  end

  def valueURI=(val)
    if(!val.nil?)
        @valURI = RDF::Resource.new(val)
    else
        @valURI = RDF::Resource.new("http://id.loc.gov/vocabulary/iso639-1/#{code.first}")
    end
  end
  def valueURI
    if @valURI != nil
      @valURI
    else
      valURI
    end
  end

  def serialize
    graph.insert([rdf_subject, RDF.type, DAMS.VocabularyEntry]) if new?
    if @valURI != nil
      graph.insert([rdf_subject, DAMS.valueURI, @valURI]) if new?
    end
    if @authURI != nil
      graph.insert([rdf_subject, DAMS.authorityURI, @authURI]) if new?
    end
    super
  end

  def to_solr (solr_doc = {})
    solr_doc[ActiveFedora::SolrService.solr_name("code", type: :text)] = code
    solr_doc[ActiveFedora::SolrService.solr_name("value", type: :text)] = value
    solr_doc[ActiveFedora::SolrService.solr_name("valueURI", type: :text)] = valueURI
    solr_doc[ActiveFedora::SolrService.solr_name("authority", type: :text)] = authority
    solr_doc[ActiveFedora::SolrService.solr_name("authorityURI", type: :text)] = authorityURI
    
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
