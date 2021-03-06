require 'active_support/concern'

module Dams
  module DamsStatute
    extend ActiveSupport::Concern
    include ModelHelper
    included do
      rdf_type DAMS.Statute
      map_predicates do |map|
	    map.citation(:in => DAMS, :to => 'statuteCitation')
	    map.jurisdiction(:in => DAMS, :to => 'statuteJurisdiction')
	    map.note(:in => DAMS, :to => 'statuteNote')
	    map.restriction_node(:in => DAMS, :to=>'restriction', :class_name => 'DamsRestriction')
	    map.permission_node(:in => DAMS, :to=>'permission', :class_name => 'DamsPermission')
      end
   	  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
      accepts_nested_attributes_for :restriction_node, :permission_node
      
      def serialize
        check_type( graph, rdf_subject, DAMS.Statute )
        super
      end

      def to_solr (solr_doc={})
        Solrizer.insert_field(solr_doc, 'citation', citation)
        Solrizer.insert_field(solr_doc, 'jurisdiction', jurisdiction)
        Solrizer.insert_field(solr_doc, 'note', note)
	    Solrizer.insert_field(solr_doc, "permissionType", permissionType)
	    Solrizer.insert_field(solr_doc, "permissionBeginDate", permissionBeginDate)
	    Solrizer.insert_field(solr_doc, "permissionEndDate", permissionEndDate)
	    Solrizer.insert_field(solr_doc, "restrictionType", restrictionType)
	    Solrizer.insert_field(solr_doc, "restrictionBeginDate", restrictionBeginDate)
	    Solrizer.insert_field(solr_doc, "restrictionEndDate", restrictionEndDate)                                
	    # hack to make sure something is indexed for rights metadata
	    ['edit_access_group_ssim','read_access_group_ssim','discover_access_group_ssim'].each {|f|
	      solr_doc[f] = 'dams-curator' unless solr_doc[f]
	    }
	    return solr_doc
      end
    end
  end
end
