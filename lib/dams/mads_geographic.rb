require 'active_support/concern'

module Dams
  module MadsGeographic
    extend ActiveSupport::Concern
    include Dams::MadsSimpleType
    included do
      rdf_type MADS.Geographic
      map_predicates do |map|
        map.elem_list(:in => MADS, :to => 'elementList', :class_name=>'MadsGeographicElementList')
      end
      def elementList
        elem_list.first || elem_list.build
      end
      accepts_nested_attributes_for :geographicElement, :scheme
      def serialize
        check_type( graph, rdf_subject, MADS.Geographic )
        super
      end
      delegate :geographicElement_attributes=, to: :elementList
      alias_method :geographicElement, :elementList
      def geographicElement_with_update_name= (attributes)
        self.geographicElement_without_update_name= attributes
        if elementList && elementList.first && elementList.first.elementValue.present?
          self.name = elementList.first.elementValue
        end
      end
      alias_method :geographicElement_without_update_name=, :geographicElement_attributes=
      alias_method :geographicElement_attributes=, :geographicElement_with_update_name=
      def to_solr (solr_doc={})
        Solrizer.insert_field(solr_doc, 'geographic', name)
        if elementList.first
          Solrizer.insert_field(solr_doc, "geographic_element", elementList.first.elementValue.to_s)
        end
	    # hack to make sure something is indexed for rights metadata
	    ['edit_access_group_ssim','read_access_group_ssim','discover_access_group_ssim'].each {|f|
	      solr_doc[f] = 'dams-curator' unless solr_doc[f]
	    }
        solr_base solr_doc
      end
      class MadsGeographicElementList
        include ActiveFedora::RdfList
        map_predicates do |map|
          map.geographicElement(:in=> MADS, :to =>"GeographicElement", :class_name => "MadsGeographicElement")
        end
        accepts_nested_attributes_for :geographicElement
      end
	  class MadsGeographicElement
	    include Dams::MadsElement
	    rdf_type MADS.GeographicElement
	  end      
    end
  end
end
