class MadsDatastream < ActiveFedora::RdfxmlRDFDatastream
  
  def sameAs=(val)
    @sameAs = RDF::Resource.new(val)
  end
  def sameAs
    if @sameAs != nil
      @sameAs
    else
      sameAsNode
    end
  end
 
  def valueURI=(val)
    @valURI = RDF::Resource.new(val)
  end
  def valueURI
    if @valURI != nil
      @valURI
    else
      valURI
    end
  end
         
  class List 
    include ActiveFedora::RdfList
    class FullNameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.FullNameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end
    class FamilyNameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.FamilyNameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end
    class GivenNameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.GivenNameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end
    class DateNameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.DateNameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end     
    class NameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.NameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end        
    class TermsOfAddressNameElement
      include ActiveFedora::RdfObject
      rdf_type MADS.TermsOfAddressNameElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end       
    class GenreFormElement
      include ActiveFedora::RdfObject
      rdf_type MADS.GenreFormElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end   
    class GeographicElement
      include ActiveFedora::RdfObject
      rdf_type MADS.GeographicElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end       
    class OccupationElement
      include ActiveFedora::RdfObject
      rdf_type MADS.OccupationElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end       
    class TemporalElement
      include ActiveFedora::RdfObject
      rdf_type MADS.TemporalElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end          
    class TopicElement
      include ActiveFedora::RdfObject
      rdf_type MADS.TopicElement
      map_predicates do |map|   
        map.elementValue(:in=> MADS)
      end
    end     
  end
    
 rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}

  def serialize
    if(!@sameAs.nil?)
    	graph.insert([rdf_subject, OWL.sameAs, @sameAs]) if new?
    end
    if(!@valURI.nil?)
    	graph.insert([rdf_subject, DAMS.valueURI, @valURI]) if new?
    end
    super
  end
  
  def to_solr (solr_doc = {})
    Solrizer.insert_field(solr_doc, 'name', name)
	Solrizer.insert_field(solr_doc, 'sameAs', sameAsNode.first.to_s)
	Solrizer.insert_field(solr_doc, 'authority', authority)
 	Solrizer.insert_field(solr_doc, "valueURI", valURI.first.to_s)
	list = elementList.first
	i = 0
	if list != nil
		while i < list.size  do
		  if (list[i].class == MadsDatastream::List::FullNameElement)
			Solrizer.insert_field(solr_doc, 'full_name_element', list[i].elementValue.first)
	 	  elsif (list[i].class == MadsDatastream::List::FamilyNameElement)
			Solrizer.insert_field(solr_doc, 'family_name_element', list[i].elementValue.first)		
		  elsif (list[i].class == MadsDatastream::List::GivenNameElement)
			Solrizer.insert_field(solr_doc, 'given_name_element', list[i].elementValue.first)				
		  elsif (list[i].class == MadsDatastream::List::DateNameElement)
			Solrizer.insert_field(solr_doc, 'date_name_element', list[i].elementValue.first)	
		  elsif (list[i].class == MadsDatastream::List::NameElement)
			Solrizer.insert_field(solr_doc, 'name_element', list[i].elementValue.first)	
  		  elsif (list[i].class == MadsDatastream::List::TermsOfAddressNameElement)
			Solrizer.insert_field(solr_doc, 'terms_of_address_name_element', list[i].elementValue.first)		
 		  elsif (list[i].class == MadsDatastream::List::GenreFormElement)
			Solrizer.insert_field(solr_doc, 'genre_form_element', list[i].elementValue.first)	
		  elsif (list[i].class == MadsDatastream::List::GeographicElement)
			Solrizer.insert_field(solr_doc, 'geographic_element', list[i].elementValue.first)		
		  elsif (list[i].class == MadsDatastream::List::OccupationElement)
			Solrizer.insert_field(solr_doc, 'occupation_element', list[i].elementValue.first)		
		  elsif (list[i].class == MadsDatastream::List::TemporalElement)
			Solrizer.insert_field(solr_doc, 'temporal_element', list[i].elementValue.first)		
		  elsif (list[i].class == MadsDatastream::List::TopicElement)
			Solrizer.insert_field(solr_doc, 'topic_element', list[i].elementValue.first)															
		  end		  
		  i +=1
		end   
	end 
			
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

