class DamsResourceDatastream < ActiveFedora::RdfxmlRDFDatastream

  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}

  def serialize
    super
  end

  class Note
    include ActiveFedora::RdfObject
    rdf_type DAMS.Note
    map_predicates do |map|
      map.value(:in=> RDF)
      map.displayLabel(:in=>DAMS)
      map.type(:in=>DAMS)
    end
    def external?
      rdf_subject.to_s.include? Rails.configuration.id_namespace
    end
    def load
      uri = rdf_subject.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        DamsNote.find(md[1])
      end
    end
  end

  class RelatedResource
    include ActiveFedora::RdfObject
    rdf_type DAMS.RelatedResource
    map_predicates do |map|
      map.type(:in=> DAMS)
      map.description(:in=> DAMS)
      map.uri(:in=> DAMS)
    end
  end

  class Title
    include ActiveFedora::RdfObject
    rdf_type DAMS.Title
    map_predicates do |map|
      map.value(:in=> RDF)
      map.subtitle(:in=> DAMS)
      map.type(:in=> DAMS)
    end
  end

  def title
    title_node.first ? title_node.first.value : []
  end
  def title=(val)
    self.title_node = []
    title_node.build.value = val
  end

  def subtitle
    self.title_node.first ? self.title_node.first.subtitle : []
  end
  def subtitle=(val)
    if self.title_node == nil
      self.title_node = []
    end
    self.title_node.build.subtitle = val
  end

  def titleValue
    title_node[0] ? title_node[0].value : []
  end
  def titleValue=(val)
    title_node.build if title_node[0] == nil
    title_node[0].value = val
  end
  
  def titleType
    title_node[0] ? title_node[0].type : []
  end
  def titleType=(val)
    title_node.build if title_node[0] == nil
    title_node[0].type = val
  end
    
  class Date
    include ActiveFedora::RdfObject
    rdf_type DAMS.Date
    map_predicates do |map|
      map.value(:in=> RDF)
      map.beginDate(:in=>DAMS)
      map.endDate(:in=>DAMS)
    end
  end
  def date
    odate.first ? odate.first.value : []
  end
  def date=(val)
    self.odate = []
    odate.build.value = val
  end
  
#  def beginDate
#    odate.first ? odate.first.beginDate : []
#  end
#  def beginDate=(val)
#    self.odate = []
#    odate.build.beginDate = val
#  end
#  def endDate
#    odate.first ? odate.first.endDate : []
#  end
#  def endDate=(val)
#    self.odate = []
#    odate.build.endDate = val
#  end

  def beginDate
    odate[0] ? odate[0].beginDate : []
  end
  def beginDate=(val)
    odate.build if odate[0] == nil
    odate[0].beginDate = val
  end

  def endDate
    odate[0] ? odate[0].endDate : []
  end
  def endDate=(val)
    odate.build if odate[0] == nil
    odate[0].endDate = val
  end
  
  class Subject
    include ActiveFedora::RdfObject
    rdf_type MADS.ComplexSubject
    map_predicates do |map|
      map.authoritativeLabel(:in=> MADS)
    end

    def external?
      rdf_subject.to_s.include? Rails.configuration.id_namespace
    end
    def load
      uri = rdf_subject.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        MadsComplexSubject.find(md[1])
      end
    end
  end

  def subject
    #subject_node.map{|s| s.authoritativeLabel.first}
    subject_node.map do |sn|
    	subject_value = sn.external? ? sn.load.name.first : sn.authoritativeLabel.first
    end
  end
  def subject=(val)
    self.subject_node = []
    val.each do |s|
      subject_node.build.authoritativeLabel = s
    end
  end

  class Relationship
    include ActiveFedora::RdfObject
    rdf_type DAMS.Relationship
    map_predicates do |map|
      map.name(:in=> DAMS)
      map.personalName(:in=> DAMS)
      map.corporateName(:in=> DAMS)
      map.role(:in=> DAMS)
    end

    def load
      if name.first.to_s.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(name.first.to_s)
        MadsPersonalName.find(md[1])
      elsif personalName.first.to_s.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(personalName.first.to_s)
        MadsPersonalName.find(md[1])
      elsif corporateName.first.to_s.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(corporateName.first.to_s)
        MadsCorporateName.find(md[1])
      end
    end
    
    def loadRole
      uri = role.first.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        DamsRole.find(md[1])
      end
    end    
  end

  class ScopeContentNote
    include ActiveFedora::RdfObject
    rdf_type DAMS.ScopeContentNote
    map_predicates do |map|
      map.value(:in=> RDF)
      map.displayLabel(:in=>DAMS)
      map.type(:in=>DAMS)
    end

    def external?
      rdf_subject.to_s.include? Rails.configuration.id_namespace
    end
    def load
      uri = rdf_subject.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        DamsScopeContentNote.find(md[1])
      end
    end
  end

  class PreferredCitationNote
    include ActiveFedora::RdfObject
    rdf_type DAMS.PreferredCitationNote
    map_predicates do |map|
      map.value(:in=> RDF)
      map.displayLabel(:in=>DAMS)
      map.type(:in=>DAMS)
    end

    def external?
      rdf_subject.to_s.include? Rails.configuration.id_namespace
    end
    def load
      uri = rdf_subject.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        DamsPreferredCitationNote.find(md[1])
      end
    end
  end

  class CustodialResponsibilityNote
    include ActiveFedora::RdfObject
    rdf_type DAMS.CustodialResponsibilityNote
    map_predicates do |map|
      map.value(:in=> RDF)
      map.displayLabel(:in=>DAMS)
      map.type(:in=>DAMS)
    end

    def external?
      rdf_subject.to_s.include? Rails.configuration.id_namespace
    end
    def load
      uri = rdf_subject.to_s
      if uri.start_with?(Rails.configuration.id_namespace)
        md = /\/(\w*)$/.match(uri)
        DamsCustodialResponsibilityNote.find(md[1])
      end
    end
  end


  def load_languages
    load_languages(language)
  end
  def load_languages(language)
    languages = []
    language.values.each do |lang|
      lang_uri = lang.to_s
      lang_pid = lang_uri.gsub(/.*\//,'')
      if lang_pid != nil && lang_pid != ""
        languages << DamsLanguage.find(lang_pid)
      end
    end
    languages
  end
  def load_events
    load_events(event)
  end
  def load_events(event)
    events = []
    event.values.each do |e|
      event_uri = e.to_s
      event_pid = event_uri.gsub(/.*\//,'')
      if event_pid != nil && event_pid != ""
        begin
           events << DamsDAMSEvent.find(event_pid)
        rescue Exception => e
          puts e.to_s
          e.backtrace.each do |line|
            puts line
          end
        end              
      end
    end
    events
  end  

  def load_iconographies
    load_iconographies(iconography)
  end
  def load_iconographies(iconography)
    loadObjects iconography,DamsIconography
  end

  def load_scientificNames
    load_scientificNames(scientificName)
  end
  def load_scientificNames(scientificName)
	loadObjects scientificName,DamsScientificName
  end

  def load_techniques
    load_techniques(technique)
  end
  def load_techniques(technique)
	loadObjects technique,DamsTechnique
  end

  def load_builtWorkPlaces
    load_builtWorkPlaces(builtWorkPlace)
  end
  def load_builtWorkPlaces(builtWorkPlace)
	loadObjects builtWorkPlace,DamsBuiltWorkPlace
  end

  def load_geographics
    load_geographics(geographic)
  end
  def load_geographics(geographic)
	loadObjects geographic,MadsGeographic
  end

  def load_temporals
    load_temporals( temporal )
  end
  def load_temporals( temporal )
	loadObjects temporal,MadsTemporal
  end

  def load_culturalContexts
    load_culturalContexts(culturalContext)
  end
  def load_culturalContexts(culturalContext)
	loadObjects culturalContext,DamsCulturalContext
  end

  def load_stylePeriods
    load_stylePeriods(stylePeriod)
  end
  def load_stylePeriods(stylePeriod)
	loadObjects stylePeriod,DamsStylePeriod
  end

  def load_topics
    load_topics(topic)
  end
  def load_topics(topic)
	loadObjects topic,MadsTopic
  end

  def load_functions
    load_functions(function)
  end
  def load_functions(function)
	loadObjects function,DamsFunction
  end

  def load_genreForms
    load_genreForms(genreForm)
  end
  def load_genreForms(genreForm)
	loadObjects genreForm,MadsGenreForm
  end

  def load_occupations
    load_occupations(occupation)
  end
  def load_occupations(occupation)
	loadObjects occupation,MadsOccupation
  end

  def load_personalNames
    load_personalNames(personalName)
  end
  def load_personalNames(personalName)
	loadObjects personalName,MadsPersonalName
  end

  def load_familyNames
    load_familyNames(familyName)
  end
  def load_familyNames(familyName)
	loadObjects familyName,MadsFamilyName
  end

  def load_names
    load_names(name)
  end
  def load_names(name)
	loadObjects name,MadsName
  end

  def load_conferenceNames
    load_conferenceNames(conferenceName)
  end
  def load_conferenceNames(conferenceName)
	loadObjects conferenceName,MadsConferenceName
  end

  def load_corporateNames
    load_corporateNames(corporateName)
  end
  def load_corporateNames(corporateName)
	loadObjects corporateName,MadsCorporateName
  end

  def load_complexSubjects
    loadComplexSubjects(complexSubject)
  end
  def load_complexSubjects(complexSubject)
	loadObjects complexSubject,MadsComplexSubject
  end

  # helper method for recursing over component hierarchy
  def find_children(p)
    kids = @parents[p]
    if kids != nil && kids.length > 0

      # replace children with nested hashes recursively
      for i in 0 .. kids.length
        cid = kids[i]
        if @parents[cid] != nil && @parents[cid].length > 0
          grandkids = find_children(cid)
          kids[i] = {cid => grandkids}
        end
      end
    end
    kids
  end

  def loadObjects (object,className)
    objects = []
    object.values.each do |name|
      name_uri = name.to_s
      name_pid = name_uri.gsub(/.*\//,'')
      if name_pid != nil && name_pid != ""
        objects << className.find(name_pid)
      end
    end
  	return objects
  end

  def insertFields (solr_doc, fieldName, objects)
    facetable = Solrizer::Descriptor.new(:string, :indexed, :multivalued)
    if objects != nil
      n = 0
      objects.each do |obj|
          n += 1
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_id", obj.pid)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_name", obj.name)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_authority", obj.authority)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_valueURI", obj.valueURI.first.to_s)
		  list = obj.elementList.first
		  i = 0
		  if list != nil		
			while i < list.size  do	
			  if (list[i].class == MadsDatastream::List::NameElement)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_name", list[i].elementValue.first)
			  elsif (list[i].class == MadsDatastream::List::FamilyNameElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_familyName", list[i].elementValue.first)
			  elsif (list[i].class == MadsDatastream::List::DateNameElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_dateName", list[i].elementValue.first)
			  elsif (list[i].class == MadsDatastream::List::TermsOfAddressNameElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_termsOfAddress", list[i].elementValue.first)	
			  elsif (list[i].class == MadsDatastream::List::GivenNameElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_givenName", list[i].elementValue.first)	
			  elsif (list[i].class == MadsDatastream::List::GenreFormElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_genreForm", list[i].elementValue.first)		
			  elsif (list[i].class == DamsDatastream::List::FunctionElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_function", list[i].elementValue.first)	
			  elsif (list[i].class == DamsDatastream::List::StylePeriodElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_stylePeriod", list[i].elementValue.first)	
			  elsif (list[i].class == DamsDatastream::List::CulturalContextElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_culturalContext", list[i].elementValue.first)			
			  elsif (list[i].class == MadsDatastream::List::TemporalElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_temporal", list[i].elementValue.first)						  	
			  elsif (list[i].class == MadsDatastream::List::GeographicElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_geographic", list[i].elementValue.first)	
			  elsif (list[i].class == DamsDatastream::List::BuiltWorkPlaceElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_builtWorkPlace", list[i].elementValue.first)			
			  elsif (list[i].class == MadsDatastream::List::OccupationElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_occupation", list[i].elementValue.first)				  	
			  elsif (list[i].class == DamsDatastream::List::TechniqueElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_technique", list[i].elementValue.first)	
			  elsif (list[i].class == DamsDatastream::List::ScientificNameElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_scientificName", list[i].elementValue.first)			
			  elsif (list[i].class == DamsDatastream::List::IconographyElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_iconography", list[i].elementValue.first)	
			  elsif (list[i].class == MadsDatastream::List::TopicElement)	
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_topic", list[i].elementValue.first)
			  	Solrizer.insert_field(solr_doc, "subject_topic", list[i].elementValue.first, facetable)
			  end																															
			  i +=1
			end
		  end
      end
    end
  end

  def insertComplexSubjectFields (solr_doc, fieldName, objects)
    if objects != nil
      n = 0
      objects.each do |obj|
          n += 1
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_id", obj.pid)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_name", obj.name)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_authority", obj.authority)
          Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_valueURI", obj.valueURI.first.to_s)
		  list = obj.componentList.first
		  i = 0
		  if list != nil		
			while i < list.size  do		
			  if (list[i].class == MadsComplexSubjectDatastream::ComponentList::Topic)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_topic", list[i].name.first)				  	
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::GenreForm)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_genreForm", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Iconography)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_iconography", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::ScientificName)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_scientificName", list[i].name.first)					  	
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Technique)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_technique", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::BuiltWorkPlace)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_builtWorkPlace", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::PersonalName)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_personalName", list[i].name.first)					  	
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Geographic)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_geographic", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Temporal)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_temporal", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::CulturalContext)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_culturalContext", list[i].name.first)					  	
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::StylePeriod)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_stylePeriod", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::ConferenceName)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_conferenceName", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Function)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_function", list[i].name.first)						  	
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::CorporateName)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_corporateName", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::Occupation)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_occupation", list[i].name.first)		
			  elsif (list[i].class == MadsComplexSubjectDatastream::ComponentList::FamilyName)
			  	Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_#{i}_familyName", list[i].name.first)				  			  				  				  				  				  			  	
			  end																														
			  i +=1
			end
		  end
      end
    end
  end

  def insertNoteFields (solr_doc, fieldName, objects)
    n = 0
    objects.map do |no|
      n += 1
      if (no.external?)
 		Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_id", no.load.pid)
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_type", no.load.type)
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_value", no.load.value)
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_displayLabel", no.load.displayLabel)
      else
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_type", no.type)
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_value", no.value)
        Solrizer.insert_field(solr_doc, "#{fieldName}_#{n}_displayLabel", no.displayLabel)      	
      end
    end

  end

  def to_solr (solr_doc = {})
    # field types
    storedInt = Solrizer::Descriptor.new(:integer, :indexed, :stored)
    singleString = Solrizer::Descriptor.new(:string, :indexed, :stored)
    storedIntMulti = Solrizer::Descriptor.new(:integer, :indexed, :stored, :multivalued)
    facetable = Solrizer::Descriptor.new(:string, :indexed, :multivalued)

    subject_node.map do |sn|
      subject_value = sn.external? ? sn.load.name : sn.authoritativeLabel
      Solrizer.insert_field(solr_doc, 'subject', subject_value)
      Solrizer.insert_field(solr_doc, 'subject_topic', subject_value,facetable)
    end
    Solrizer.insert_field(solr_doc, 'title', title)
    n = 0
    title_node.map do |t|
      n += 1
      Solrizer.insert_field(solr_doc, "title_#{n}_type", t.type)
      Solrizer.insert_field(solr_doc, "title_#{n}_subtitle", t.subtitle)
      Solrizer.insert_field(solr_doc, "title_#{n}_value", t.value)
    end

    n = 0
    odate.map do |date|
      n += 1
      Solrizer.insert_field(solr_doc, "date_#{n}_beginDate", date.beginDate)
      Solrizer.insert_field(solr_doc, "date_#{n}_endDate", date.endDate)
      Solrizer.insert_field(solr_doc, "date_#{n}_value", date.value)
    end

    #Solrizer.insert_field(solr_doc, 'date', date)

    names = []
    relationship.map do |relationship|
      rel = relationship.load
      if ( rel != nil )
        #Solrizer.insert_field(solr_doc, 'name', relationship.load.name )
        begin
          n = rel.name.first.to_s
          if not names.include?( n )
            names << n
          end
        rescue Exception => e
          puts e.to_s
          e.backtrace.each do |line|
            puts line
          end
        end
      end
      relRole = relationship.loadRole
      if ( rel != nil )
        Solrizer.insert_field(solr_doc, 'role', relationship.loadRole.value )
        Solrizer.insert_field(solr_doc, 'role_code', relationship.loadRole.code )
        Solrizer.insert_field(solr_doc, 'role_valueURI', relationship.loadRole.valueURI.first.to_s )
      end      
    end
    names.sort.each do |n|
      Solrizer.insert_field(solr_doc, 'name', n )
    end

    langs = load_languages language
    if langs != nil
      n = 0
      langs.each do |lang|
        n += 1
        Solrizer.insert_field(solr_doc, "language_#{n}_id", lang.pid)
        Solrizer.insert_field(solr_doc, "language_#{n}_code", lang.code)
        Solrizer.insert_field(solr_doc, "language_#{n}_value", lang.value)
        Solrizer.insert_field(solr_doc, "language_#{n}_valueURI", lang.valueURI.first.to_s)
      end
    end

    events = load_events event
    if events != nil
      n = 0
      events.each do |e|
        n += 1
        Solrizer.insert_field(solr_doc, "event_#{n}_id", e.pid)
        Solrizer.insert_field(solr_doc, "event_#{n}_type", e.type)
        Solrizer.insert_field(solr_doc, "event_#{n}_eventDate", e.eventDate)
        Solrizer.insert_field(solr_doc, "event_#{n}_outcome", e.outcome)
        e.relationship.map do |relationship|
	      rel = relationship.load
	      if (rel != nil)
	         Solrizer.insert_field(solr_doc, "event_#{n}_name", rel.name)
	      end 
	      relRole = relationship.loadRole
	      if (relRole != nil)
	         Solrizer.insert_field(solr_doc, "event_#{n}_role", relRole.value)
	      end  
	    end    
      end
    end

    n = 0
    relatedResource.map do |resource|
      n += 1
      Solrizer.insert_field(solr_doc, "relatedResource_#{n}_type", resource.type)
      Solrizer.insert_field(solr_doc, "relatedResource_#{n}_uri", resource.uri)
      Solrizer.insert_field(solr_doc, "relatedResource_#{n}_description", resource.description)
    end

    insertNoteFields solr_doc, 'scopeContentNote',scopeContentNote
    insertNoteFields solr_doc, 'preferredCitationNote',preferredCitationNote
    insertNoteFields solr_doc, 'custodialResponsibilityNote',custodialResponsibilityNote
    insertNoteFields solr_doc, 'note',note

    insertFields solr_doc, 'iconography', load_iconographies(iconography)
    insertFields solr_doc, 'scientificName', load_scientificNames(scientificName)
    insertFields solr_doc, 'technique', load_techniques(technique)
    insertFields solr_doc, 'occupation', load_occupations(occupation)
    insertFields solr_doc, 'builtWorkPlace', load_builtWorkPlaces(builtWorkPlace)
    insertFields solr_doc, 'geographic', load_geographics(geographic)
    insertFields solr_doc, 'temporal', load_temporals(temporal)
    insertFields solr_doc, 'culturalContext', load_culturalContexts(culturalContext)
    insertFields solr_doc, 'stylePeriod', load_stylePeriods(stylePeriod)
    insertFields solr_doc, 'topic', load_topics(topic)
    insertFields solr_doc, 'function', load_functions(function)
    insertFields solr_doc, 'genreForm', load_genreForms(genreForm)

    insertFields solr_doc, 'personalName', load_personalNames(personalName)
    insertFields solr_doc, 'familyName', load_familyNames(familyName)
    insertFields solr_doc, 'name', load_names(name)
    insertFields solr_doc, 'conferenceName', load_conferenceNames(conferenceName)
    insertFields solr_doc, 'corporateName', load_corporateNames(corporateName)
    insertComplexSubjectFields solr_doc, 'complexSubject', load_complexSubjects(complexSubject)

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

