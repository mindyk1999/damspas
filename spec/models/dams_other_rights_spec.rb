# -*- encoding: utf-8 -*-
require 'spec_helper'
require 'rdf'

describe DamsOtherRights do
  subject do
    DamsOtherRights.new pid: "bb05050505"
  end
  it "should create a xml" do
    subject.basis = "fair use"
    subject.note = "Educationally important works unavailable due to unknown copyright holders"
    subject.uri = "http://library.ucsd.edu/lisn/policy/4123412341/"
    subject.permissionType = "display"
    subject.permissionBeginDate = "2012-01-01"
    subject.permissionEndDate = "2012-12-31"
    subject.name = "#{Rails.configuration.id_namespace}bbXXXXXXX1"
    subject.role = "#{Rails.configuration.id_namespace}bbXXXXXXX2"


    xml =<<END
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dams="http://library.ucsd.edu/ontology/dams#">
  <dams:OtherRights rdf:about="#{Rails.configuration.id_namespace}bb05050505">
    <dams:otherRightsBasis>fair use</dams:otherRightsBasis>
    <dams:otherRightsNote>Educationally important works unavailable due to unknown copyright holders</dams:otherRightsNote>
    <dams:otherRightsURI>http://library.ucsd.edu/lisn/policy/4123412341/</dams:otherRightsURI>
    <dams:permission>
      <dams:Permission>
        <dams:type>display</dams:type>
        <dams:beginDate>2012-01-01</dams:beginDate>
        <dams:endDate>2012-12-31</dams:endDate>
      </dams:Permission>
    </dams:permission>
    <dams:relationship>
      <dams:Relationship>
       <dams:name rdf:resource="#{Rails.configuration.id_namespace}bbXXXXXXX1"/>
       <dams:role rdf:resource="#{Rails.configuration.id_namespace}bbXXXXXXX2"/>
      </dams:Relationship>
    </dams:relationship>
  </dams:OtherRights>
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to xml

  end
end
