# -*- encoding: utf-8 -*-
require 'spec_helper'

describe MadsOccupation do
  subject do
    MadsOccupation.new pid: "zzXXXXXXX1"
  end
  it "should create a xml" do    
    subject.name = "Pharmacist"
    subject.authority = "tgm"
    subject.externalAuthority = "http://id.loc.gov/n9999999999"
    xml =<<END
<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:mads="http://www.loc.gov/mads/rdf/v1#"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:dams="http://library.ucsd.edu/ontology/dams#">
  <mads:Occupation rdf:about="http://library.ucsd.edu/ark:/20775/zzXXXXXXX1">
    <mads:authoritativeLabel>Pharmacist</mads:authoritativeLabel>
    <dams:authority>tgm</dams:authority>
    <mads:hasExactExternalAuthority rdf:resource="http://id.loc.gov/n9999999999"/>
  </mads:Occupation>
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to xml

  end
end
