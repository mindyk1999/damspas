# -*- encoding: utf-8 -*-
require 'spec_helper'

describe MadsTopic do
  describe "a Topic model" do
	  subject do
	    MadsTopic.new pid: "zzXXXXXXX1"
	  end
	  it "should create a xml" do    
	    subject.name = "Baseball"
	    subject.authority = "lcsh"
	    subject.externalAuthority = "http://id.loc.gov/n9999999999"
	    #subject.elementList.build   
		#subject.elementList.first.topicElement.build
		#subject.elementList.first.topicElement.first.elementValue = "History"	
		subject.elementListValue = "History"
		list1_id = subject.elementList[0].topicElement[0].rdf_subject.id
	
	    xml ='<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:ns0="http://www.loc.gov/mads/rdf/v1#" xmlns:ns1="http://library.ucsd.edu/ontology/dams#">
	     <ns0:Topic rdf:about="http://library.ucsd.edu/ark:/20775/zzXXXXXXX1">
	       <ns1:authority>lcsh</ns1:authority>
	       <ns0:authoritativeLabel>Baseball</ns0:authoritativeLabel>
	       <ns0:elementList>
	         <rdf:Description>
	           <ns0:TopicElement rdf:nodeID="'+list1_id+'"/>
	         </rdf:Description>
	       </ns0:elementList>
	       <ns0:hasExactExternalAuthority rdf:resource="http://id.loc.gov/n9999999999"/>
	     </ns0:Topic>
	     <rdf:Description rdf:nodeID="'+list1_id+'">
	       <ns0:elementValue>History</ns0:elementValue>
	     </rdf:Description>
		 </rdf:RDF>'
	    subject.damsMetadata.content.should be_equivalent_to xml
	
	  end
  	end
    describe "a Topic model using rdf_nested_attributes" do
	  subject do
	    MadsTopic.new pid: "zzXXXXXXX2"
	  end
	  it "should create a xml" do    
        params = {
		  topic: {
		    name: "Baseball",
		    authority: "lcsh",
		    externalAuthority: "http://id.loc.gov/n9999999999",
		    elementList_attributes: {		     
		      topicElement_attributes: 
		        {elementValue: "History"}
		    }
		  }
		}
        subject.attributes = params[:topic]

	    list1_id = "test"
	    
	    xml ='<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:ns0="http://www.loc.gov/mads/rdf/v1#" xmlns:ns1="http://library.ucsd.edu/ontology/dams#">
	     <ns0:Topic rdf:about="http://library.ucsd.edu/ark:/20775/zzXXXXXXX2">
	       <ns1:authority>lcsh</ns1:authority>
	       <ns0:authoritativeLabel>Baseball</ns0:authoritativeLabel>
	       <ns0:elementList>
	         <rdf:Description>
	           <ns0:TopicElement rdf:nodeID="'+list1_id+'"/>
	         </rdf:Description>
	       </ns0:elementList>
	       <ns0:hasExactExternalAuthority rdf:resource="http://id.loc.gov/n9999999999"/>
	     </ns0:Topic>
	     <rdf:Description rdf:nodeID="'+list1_id+'">
	       <ns0:elementValue>History</ns0:elementValue>
	     </rdf:Description>
		 </rdf:RDF>'
	    subject.damsMetadata.content.should be_equivalent_to xml
	
	  end
  	end  
end
