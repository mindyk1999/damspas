module DamsHelper



## RelatedResource#############################################################
def relatedResourceType
    relatedResource[0] ? relatedResource[0].type: []
  end
  def relatedResourceType=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      relatedResource.build if relatedResource[0] == nil
      relatedResource[0].type = val
    end
  end

def relatedResourceDescription
    relatedResource[0] ? relatedResource[0].description: []
  end
  def relatedResourceDescription=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      relatedResource.build if relatedResource[0] == nil
      relatedResource[0].description = val
    end
  end

def relatedResourceUri
    relatedResource[0] ? relatedResource[0].uri: []
  end
  def relatedResourceUri=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      relatedResource.build if relatedResource[0] == nil
      relatedResource[0].uri = val
    end
  end


 ## scopeContentNote ######################################################################
 
  def scopeContentNoteType
    scopeContentNote[0] ? scopeContentNote[0].type : []
  end
  def scopeContentNoteType=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      scopeContentNote.build if scopeContentNote[0] == nil
      scopeContentNote[0].type = val
    end
  end   
  
 def scopeContentNoteDisplayLabel
    scopeContentNote[0] ? scopeContentNote[0].displayLabel : []
  end
  def scopeContentNoteDisplayLabel=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      scopeContentNote.build if scopeContentNote[0] == nil
      scopeContentNote[0].displayLabel = val
    end
  end   

  def scopeContentNoteValue
    scopeContentNote[0] ? scopeContentNote[0].value : []
  end
  def scopeContentNoteValue=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      scopeContentNote.build if scopeContentNote[0] == nil
      scopeContentNote[0].value = val
    end
  end   

 
 ## Note ######################################################################
 def noteValue
    note[0] ? note[0].value : []
  end
  def noteValue=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      note.build if note[0] == nil
      note[0].value = val
    end
  end

  def noteType
    note[0] ? note[0].type : []
  end
  def noteType=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      note.build if note[0] == nil
      note[0].type = val
    end
  end

  def noteDisplayLabel
    note[0] ? note[0].displayLabel : []
  end
  def noteDisplayLabel=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      note.build if note[0] == nil
      note[0].displayLabel = val
    end
  end

 ## custodialResponsibilityNote ######################################################################
 
  def responsibilityNoteType
    custodialResponsibilityNote[0] ? custodialResponsibilityNote[0].type : []
  end
  def responsibilityNoteType=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      custodialResponsibilityNote.build if custodialResponsibilityNote[0] == nil
      custodialResponsibilityNote[0].type = val
    end
  end   
  
 def responsibilityNoteDisplayLabel
    custodialResponsibilityNote[0] ? custodialResponsibilityNote[0].displayLabel : []
  end
  def responsibilityNoteDisplayLabel=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      custodialResponsibilityNote.build if custodialResponsibilityNote[0] == nil
      custodialResponsibilityNote[0].displayLabel = val
    end
  end   

  def responsibilityNoteValue
    custodialResponsibilityNote[0] ? custodialResponsibilityNote[0].value : []
  end
  def responsibilityNoteValue=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      custodialResponsibilityNote.build if custodialResponsibilityNote[0] == nil
      custodialResponsibilityNote[0].value = val
    end
  end   

 ## preferredCitationNote ######################################################################
 
  def citationNoteType
    preferredCitationNote[0] ? preferredCitationNote[0].type : []
  end
  def citationNoteType=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      preferredCitationNote.build if preferredCitationNote[0] == nil
      preferredCitationNote[0].type = val
    end
  end   
  
 def citationNoteDisplayLabel
    preferredCitationNote[0] ? preferredCitationNote[0].displayLabel : []
  end
  def citationNoteDisplayLabel=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      preferredCitationNote.build if preferredCitationNote[0] == nil
      preferredCitationNote[0].displayLabel = val
    end
  end   

  def citationNoteValue
    preferredCitationNote[0] ? preferredCitationNote[0].value : []
  end
  def citationNoteValue=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      preferredCitationNote.build if preferredCitationNote[0] == nil
      preferredCitationNote[0].value = val
    end
  end
    
  ## Title ######################################################################
  def subtitle
    title[0] ? title[0].subtitle : []
  end
  def subtitle=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	title.build if title[0] == nil
    	title[0].subtitle = val
    end
  end

  def titleValue
    title.first.value if title.first
  end
  def titleValue=(s)
    title.build if title.first.nil?
    if(!s.nil? && s.length > 0)
      title.first.value = s
    end
  end
  def subtitle
    title.first.subtitle if title.first
  end
  def subtitle=(s)
    title.build if title.first.nil?
    title.first.subtitle = s
  end
  def titlePartName
    title.first != nil ? title.first.partName : nil
  end
  def titlePartName=(s)
    title.build if title.first.nil?
    title.first.partName = s
  end
  def titlePartNumber
    title.first != nil ? title.first.partNumber : nil
  end
  def titlePartNumber=(s)
    title.build if title.first.nil?
    title.first.partNumber = s
  end  

   def titleNonSort
    title.first != nil ? title.first.nonSort : nil
  end
  def titleNonSort=(s)
    title.build if title.first.nil?
    title.first.nonSort = s
  end

  def titleVariant
    title.first != nil ? title.first.variant : nil
  end
  def titleVariant=(s)
    title.build if title.first.nil?
    title.first.variant = s
  end
  
  def titleTranslationVariant
    title.first != nil ? title.first.translationVariant : nil
  end
  def titleTranslationVariant=(s)
    title.build if title.first.nil?
    title.first.translationVariant = s
  end 
  
  def titleAbbreviationVariant
    title.first != nil ? title.first.abbreviationVariant : nil
  end
  def titleAbbreviationVariant=(s)
    title.build if title.first.nil?
    title.first.abbreviationVariant = s
  end 
  
  def titleAcronymVariant
    title.first != nil ? title.first.acronymVariant : nil
  end
  def titleAcronymVariant=(s)
    title.build if title.first.nil?
    title.first.acronymVariant = s
  end 

  def titleExpansionVariant
    title.first != nil ? title.first.expansionVariant : nil
  end
  def titleExpansionVariant=(s)
    title.build if title.first.nil?
    title.first.expansionVariant = s
  end 
                 
  ## Subject ######################################################################
  #complex subject
  def subjectValue
    subject[0] ? subject[0].name : []
  end
  def subjectValue=(val)
    i = 0
	val.each do |v| 
		if(!v.nil? && v.length > 0)
		    subject.build if subject[i] == nil
		    subject[i].name = v
		end
		i+=1
	end
  end
  
  #simple subject
  def subjectType
    @subType
  end
  def subjectType=(val)
    @subType = Array.new
    i = 0
	val.each do |v| 
	    if(!v.nil? && v.length > 0)
	    	@subType << v 	
	    end
		i+=1
	end
  end
   
  #simple subject 
  def subjectTypeValue
    #topic[0] ? topic[0].name : []
    if(!@subType.nil? && (@subType.include? 'Topic'))
	    topic[0] ? topic[0].name : []
	elsif(!@subType.nil? && (@subType.include? 'BuiltWorkPlace'))
	    builtWorkPlace[0] ? builtWorkPlace[0].name : []		
	elsif(!@subType.nil? && (@subType.include? 'CulturalContext'))
	    culturalContext[0] ? culturalContext[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'Function'))
	    function[0] ? function[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'GenreForm'))
	    genreForm[0] ? genreForm[0].name : []		
	elsif(!@subType.nil? && (@subType.include? 'Geographic'))
	    geographic[0] ? geographic[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'Iconography'))
	    iconography[0] ? iconography[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'ScientificName'))
	    scientificName[0] ? scientificName[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'StylePeriod'))
	    stylePeriod[0] ? stylePeriod[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'Technique'))
	    technique[0] ? technique[0].name : []	
	elsif(!@subType.nil? && (@subType.include? 'Temporal'))
	    temporal[0] ? temporal[0].name : []	  	    	  	 	    	  	       	    	        	    	    	    
    end
  end
  def subjectTypeValue=(val)
    i = 0
    topicIndex = 0
    workplaceIndex = 0
    culturalContextIndex = 0
    functionIndex = 0
    genreFormIndex = 0
    geographicIndex = 0
    iconographyIndex = 0
    scientificNameIndex = 0
    stylePeriodIndex = 0
    techniqueIndex = 0
    temporalIndex = 0
    occupationIndex = 0
    
	val.each do |v| 
		if(!v.nil? && v.length > 0)
			if(!@subType[i].nil? && (@subType[i].include? 'Topic'))
			    topic.build if topic[topicIndex] == nil
			    topic[topicIndex].name = v
			    topicIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'BuiltWorkPlace'))
			    builtWorkPlace.build if builtWorkPlace[workplaceIndex] == nil
			    builtWorkPlace[workplaceIndex].name = v	
			    workplaceIndex+=1	
			elsif(!@subType[i].nil? && (@subType[i].include? 'CulturalContext'))
			    culturalContext.build if culturalContext[culturalContextIndex] == nil
			    culturalContext[culturalContextIndex].name = v
			    culturalContextIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'Function'))
			    function.build if function[functionIndex] == nil
			    function[functionIndex].name = v	
			    functionIndex+=1	
			elsif(!@subType[i].nil? && (@subType[i].include? 'GenreForm'))
			    genreForm.build if genreForm[genreFormIndex] == nil
			    genreForm[genreFormIndex].name = v
			    genreFormIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'Geographic'))
			    geographic.build if geographic[geographicIndex] == nil
			    geographic[geographicIndex].name = v	
			    geographicIndex+=1	
			elsif(!@subType[i].nil? && (@subType[i].include? 'Iconography'))
			    iconography.build if iconography[iconographyIndex] == nil
			    iconography[iconographyIndex].name = v
			    iconographyIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'ScientificName'))
			    scientificName.build if scientificName[scientificNameIndex] == nil
			    scientificName[scientificNameIndex].name = v	
			    scientificNameIndex+=1	
			elsif(!@subType[i].nil? && (@subType[i].include? 'Technique'))
			    technique.build if technique[techniqueIndex] == nil
			    technique[techniqueIndex].name = v
			    techniqueIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'Temporal'))
			    temporal.build if temporal[temporalIndex] == nil
			    temporal[temporalIndex].name = v	
			    temporalIndex+=1
			elsif(!@subType[i].nil? && (@subType[i].include? 'StylePeriod'))
			    stylePeriod.build if stylePeriod[stylePeriodIndex] == nil
			    stylePeriod[stylePeriodIndex].name = v	
			    stylePeriodIndex+=1				    
			elsif(!@subType[i].nil? && (@subType[i].include? 'Occupation'))
			    occupation.build if occupation[occupationIndex] == nil
			    occupation[occupationIndex].name = v	
			    occupationIndex+=1				    			    			    			    			    		    			    			    			    	    
		    end			    				    			    			    			    			    		    			    			    			    	    	    
		end
		i+=1
	end
  end

  def simpleSubjectURI
    if @simpleSubURI != nil
      @simpleSubURI
    end
  end 
  def simpleSubjectURI=(val)
	@simpleSubURI = Array.new
	val.each do |v|
		uri = v
		if(!v.include? Rails.configuration.id_namespace)
			uri = "#{Rails.configuration.id_namespace}#{v}"
		end
	    if(!v.nil? && v.length > 0)
	    	@simpleSubURI << RDF::Resource.new(uri) 	
	    end
	end
  end


  ## complex subject  ###############################################################
    
  def subjectURI=(val)
	@subURI = Array.new
	@array_subject = Array.new
	val.each do |v|
		uri = v
		if(!v.include? Rails.configuration.id_namespace)
			uri = "#{Rails.configuration.id_namespace}#{v}"
		end
	    if(!v.nil? && v.length > 0)
	    	@subURI << RDF::Resource.new(uri) 	
	    	@array_subject << RDF::Resource.new(uri) 
	    end
	end
		
	if(@subURI.size == 0)
		@subURI = nil
		@array_subject = nil
	end
  end
  
  def subjectURI
    if @subURI != nil
      @subURI
    end
  end  

  ## Name ###########################################################################
  def nameType
    @namesType
  end
  def nameType=(val)
    @namesType = Array.new
    i = 0
	val.each do |v| 
	    if(!v.nil? && v.length > 0)
	    	 @namesType << v 	
	    end
		i+=1
	end
  end  
  
  def nameTypeValue
    if(!@nameTypeArray.nil? && (@nameTypeArray.include? 'PersonalName'))
	    personalName[0] ? personalName[0].name : []
	elsif(!@nameTypeArray.nil? && (@nameTypeArray.include? 'CorporateName'))
	    corporateName[0] ? corporateName[0].name : []
	elsif(!@nameTypeArray.nil? && (@nameTypeArray.include? 'FamilyName'))
	    familyName[0] ? familyName[0].name : []
	elsif(!@nameTypeArray.nil? && (@nameTypeArray.include? 'ConferenceName'))
	    conferenceName[0] ? conferenceName[0].name : []	  
	elsif(!@nameTypeArray.nil? && (@nameTypeArray.include? 'Name'))
	    name[0] ? name[0].name : []	  	    	    	  	    	  	 	    	  	       	    	        	    	    	    
    end
  end
  def nameTypeValue=(val)
    i = 0  
    corporateNameIndex = 0
    personalNameIndex = 0
    familyNameIndex = 0
    conferenceNameIndex = 0
    nameIndex = 0
    
	val.each do |v| 
		if(!v.nil? && v.length > 0)
			if(!@nameTypeArray[i].nil? && (@nameTypeArray[i].include? 'PersonalName'))
			    personalName.build if personalName[personalNameIndex] == nil
			    personalName[personalNameIndex].name = v	
			    personalNameIndex+=1				    
			elsif(!@nameTypeArray[i].nil? && (@nameTypeArray[i].include? 'CorporateName'))
			    corporateName.build if corporateName[corporateNameIndex] == nil
			    corporateName[corporateNameIndex].name = v	
			    corporateNameIndex+=1	
			elsif(!@nameTypeArray[i].nil? && (@nameTypeArray[i].include? 'ConferenceName'))
			    conferenceName.build if conferenceName[conferenceNameIndex] == nil
			    conferenceName[conferenceNameIndex].name = v	
			    conferenceNameIndex+=1	
			elsif(!@nameTypeArray[i].nil? && (@nameTypeArray[i].include? 'FamilyName'))
			    familyName.build if familyName[familyNameIndex] == nil
			    familyName[familyNameIndex].name = v	
			    familyNameIndex+=1	
			elsif(!@nameTypeArray[i].nil? && (@nameTypeArray[i].include? 'Name'))
			    name.build if name[nameIndex] == nil
			    name[nameIndex].name = v	
			    nameIndex+=1			    			    			    			    			    		    			    			    			    	    
		    end			    				    			    			    			    			    		    			    			    			    	    	    
		end
		i+=1
	end
  end

  def nameURI
    if @name_URI != nil
      @name_URI
    end
  end 
  def nameURI=(val)
    if val.class == Array
    	val = val.first
    end
	 if(!val.nil? && val.first.length > 0)
	    @name_URI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")   	
	  end
  end

  #Creator
  def creatorURI
    if @creatorURI != nil
      @creatorURI
    end
  end 
  def creatorURI=(val)
  @creatorURI = Array.new
  val.each do |v|
    uri = v
    if(!v.include? Rails.configuration.id_namespace)
      uri = "#{Rails.configuration.id_namespace}#{v}"
    end
      if(!v.nil? && v.length > 0)
        @creatorURI << RDF::Resource.new(uri)   
      end
  end
  end
  
    
  ## Language ######################################################################  
  def languageURI
    if @langURI != nil
      @langURI
    end
  end 
  def languageURI=(val)
    if val.class == Array
    	#	val = val.first
		@langURI = Array.new
		val.each do |v|
			uri = v
			if(!v.include? Rails.configuration.id_namespace)
				uri = "#{Rails.configuration.id_namespace}#{v}"
			end
		    if(!v.nil? && v.length > 0)
		    	@langURI << RDF::Resource.new(uri) 	
		    end
		end  	
	end
	if(@langURI.size == 1)
		@langURI = @langURI.first
	end
  end
 
  ## Unit ######################################################################
  def unitURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@unitURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def unitURI
    if @unitURI != nil
      @unitURI
    #else
    #  unitURI.first
    end
  end     

  ## Collection ######################################################################

  def assembledCollectionURI=(val)
  if val.class == Array
      # val = val.first
    @assembledCollURI = Array.new
    val.each do |v|
      uri = v
      if(!v.include? Rails.configuration.id_namespace)
        uri = "#{Rails.configuration.id_namespace}#{v}"
      end
        if(!v.nil? && v.length > 0)
          @assembledCollURI << RDF::Resource.new(uri)  
        end
    end   
  end
  if(@assembledCollURI.size == 1)
    @assembledCollURI = @assembledCollURI.first
  end
  end
  
  def assembledCollectionURI
    if @assembledCollURI != nil
      @assembledCollURI
    end
  end  

  # def assembledCollectionURI=(val)
  #   if val.class == Array
  #   	val = val.first
  #   end
  #   if(!val.nil? && val.length > 0)
  #   	@assembledCollURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
  #   end
  # end
  # def assembledCollectionURI
  #   if @assembledCollURI != nil
  #     @assembledCollURI
  #   #else
  #   #  asembledCollectionURI.first
  #   end
  # end 


  def hasProvenanceCollectionURI=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      @hasProvenanceCollectionURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end


  def provenanceCollectionURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@provenanceCollURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def provenanceCollectionURI
    if @provenanceCollURI != nil
      @provenanceCollURI
   # else
   #   provenanceCollectionURI.first
    end
  end     

  def damsObjectURI=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      @damsObjURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def damsObjectURI
    if @damsObjURI != nil
      @damsObjURI
   
    end
  end     
  
 def provenanceCollectionPartURI=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      @provenanceCollPartURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def provenanceCollectionPartURI
    if @provenanceCollPartURI != nil
      @provenanceCollPartURI
    
    end
  end     

  def provenanceHasCollPartURI=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      @provenanceHasPartURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def provenanceHasCollPartURI
    if @provenanceHasPartURI != nil
      @provenanceHasPartURI
    
    end
  end     

  ## Date ######################################################################
  def beginDate
    date[0] ? date[0].beginDate : []
  end
  def beginDate=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      date.build if date[0] == nil
      date[0].beginDate = val
    end
  end


  def endDate
    date[0] ? date[0].endDate : []
  end
  def endDate=(val)
    if val.class == Array
    	val = val.first
    end  
    if(!val.nil? && val.length > 0)
    	date.build if date[0] == nil
    	date[0].endDate = val
    end
  end
  def dateValue
    date[0] ? date[0].value : []
  end
  def dateValue=(val)
    if val.class == Array
    	val = val.first
    end  
    if(!val.nil? && val.length > 0)
    	date.build if date[0] == nil
    	date[0].value = val
    end
  end
  
  def dateType
    date[0] ? date[0].type : []
  end
  def dateType=(val)
    if val.class == Array
      val = val.first
    end  
    if(!val.nil? && val.length > 0)
      date.build if date[0] == nil
      date[0].type = val
    end
  end

  def dateEncoding
    date[0] ? date[0].encoding : []
  end
  def dateEncoding=(val)
    if val.class == Array
      val = val.first
    end  
    if(!val.nil? && val.length > 0)
      date.build if date[0] == nil
      date[0].encoding = val
    end
  end
  
  
  def permissionBeginDate
    permission_node[0] ? permission_node[0].beginDate : []
  end
  def permissionBeginDate=(val)
    if permission_node[0] == nil
      permission_node.build
    end
    permission_node[0].beginDate = val
  end
  def permissionEndDate
    permission_node[0] ? permission_node[0].endDate : []
  end
  def permissionEndDate=(val)
    if permission_node[0] == nil
      permission_node.build
    end
    permission_node[0].endDate = val
  end
  def permissionType
    permission_node[0] ? permission_node[0].type : []
  end
  def permissionType=(val)
    if permission_node[0] == nil
      permission_node.build
    end
    permission_node[0].type = val
  end

  def restrictionBeginDate
    restriction_node[0] ? restriction_node[0].beginDate : []
  end
  def restrictionBeginDate=(val)
    if restriction_node[0] == nil
      restriction_node.build
    end
    restriction_node[0].beginDate = val
  end
  def restrictionEndDate
    restriction_node[0] ? restriction_node[0].endDate : []
  end
  def restrictionEndDate=(val)
    if restriction_node[0] == nil
      restriction_node.build
    end
    restriction_node[0].endDate = val
  end
  def restrictionType
    restriction_node[0] ? restriction_node[0].type : []
  end
  def restrictionType=(val)
    if restriction_node[0] == nil
      restriction_node.build
    end
    restriction_node[0].type = val
  end  

  ## ElementListValue for MADS classes ######################################################################
  def getElementValue(type)
    elem = find_element type
    if elem != nil
      elem.elementValue.first
    else
      []
    end
  end
  
  def setElementValue(type,val)
    if val.class == Array
        val = val.first
    end

    if elementList[0] == nil
      elementList.build
    end

    existing_elem = find_element type

    #need to use eList.size to know where to insert/update the value
    if(existing_elem != nil )
      # set value of existing element
      existing_elem.elementValue = val
    else
      # create a new element of the correct type
      if type.include? "TopicElement"
        elem = MadsDatastream::List::TopicElement.new(elementList.first.graph)
      elsif type.include? "BuiltWorkPlaceElement"
        elem = DamsDatastream::List::BuiltWorkPlaceElement.new(elementList.first.graph)
	  elsif type.include? "CulturalContextElement"
        elem = DamsDatastream::List::CulturalContextElement.new(elementList.first.graph)
      elsif type.include? "FunctionElement"
        elem = DamsDatastream::List::FunctionElement.new(elementList.first.graph)
	  elsif type.include? "GenreFormElement"
        elem = MadsDatastream::List::GenreFormElement.new(elementList.first.graph)              
      elsif type.include? "GeographicElement"
        elem = MadsDatastream::List::GeographicElement.new(elementList.first.graph)
	  elsif type.include? "IconographyElement"
        elem = DamsDatastream::List::IconographyElement.new(elementList.first.graph)
      elsif type.include? "StylePeriodElement"
        elem = DamsDatastream::List::StylePeriodElement.new(elementList.first.graph)
	  elsif type.include? "ScientificNameElement"
        elem = MadsDatastream::List::ScientificNameElement.new(elementList.first.graph)
      elsif type.include? "TechniqueElement"
        elem = DamsDatastream::List::TechniqueElement.new(elementList.first.graph)
	  elsif type.include? "TemporalElement"
        elem = MadsDatastream::List::TemporalElement.new(elementList.first.graph)     
	  elsif type.include? "OccupationElement"
        elem = MadsDatastream::List::OccupationElement.new(elementList.first.graph)               
      elsif type.include? "DateNameElement"
        elem = Dams::MadsNameElements::MadsDateNameElement.new(elementList.first.graph)
      elsif type.include? "FamilyNameElement"
        elem = Dams::MadsNameElements::MadsFamilyNameElement.new(elementList.first.graph)
      elsif type.include? "FullNameElement"
        elem = Dams::MadsNameElements::MadsFullNameElement.new(elementList.first.graph)
      elsif type.include? "GivenNameElement"
        elem = Dams::MadsNameElements::MadsGivenNameElement.new(elementList.first.graph)
      elsif type.include? "TermsOfAddressNameElement"
        elem = Dams::MadsNameElements::MadsTermsOfAddressNameElement.new(elementList.first.graph)
	  elsif type.include? "NameElement"
        elem = Dams::MadsNameElements::MadsNameElement.new(elementList.first.graph)                                                  
      end
      elem.elementValue = val

      # add new element to the end of the list
      if elementList.first.nil?
        elementList.first.value = elem
      else
        elementList.first[elementList.first.size] = elem
      end
    end 
  end
  
  def find_element( type )
    chain = elementList.first
    elem = nil
    while  elem == nil && chain != nil do
      if chain.first.class.name.include? type
        elem = chain.first
      else
        chain = chain.tail
      end
    end
    elem
  end 
  
  ##  MADS Name classes ######################################################################
 
  def nameValue
    getElementValue "NameElement"
  end
  
  def nameValue=(s)
    setElementValue( "NameElement", s )
  end
   
  def fullNameValue
    getElementValue "FullNameElement"
  end
  
  def fullNameValue=(s)
    setElementValue( "FullNameElement", s )
  end  
  
  def familyNameValue
    getElementValue "FamilyNameElement"
  end
  
  def familyNameValue=(s)
    setElementValue( "FamilyNameElement", s )
  end    
  
  def givenNameValue
    getElementValue "GivenNameElement"
  end
  
  def givenNameValue=(s)
    setElementValue( "GivenNameElement", s )
  end    
  
  def dateNameValue
    getElementValue "DateNameElement"
  end
  
  def dateNameValue=(s)
    setElementValue( "DateNameElement", s )
  end 
 
  def termOfAddressValue
    getElementValue "TermsOfAddressNameElement"
  end
  
  def termOfAddressValue=(s)
    setElementValue( "TermsOfAddressNameElement", s )
  end 
    
  def nameLabel
    fullName = fullNameValue
    familyName = familyNameValue
    givenName = givenNameValue
    dateName = dateNameValue
    termOfAddress = termOfAddressValue
    nameElement = nameValue
    
    # make sure we have values not arrays
    fullName = fullName.first if fullName.class == Array
    familyName = familyName.first if familyName.class == Array
    givenName = givenName.first if givenName.class == Array
    dateName = dateName.first if dateName.class == Array
    termOfAddress = termOfAddress.first if termOfAddress.class == Array
    
    if(fullName != nil && fullName.length > 0)
    	label = fullName
    	label += ", " + dateName if dateName    
    	label += " " + termOfAddress if termOfAddress 
	elsif(nameElement != nil && nameElement.length > 0)
    	label = nameElement
    	label += ", " + dateName if dateName    
    	label += " " + termOfAddress if termOfAddress     	
    else    
	    label = familyName if familyName
	    label += " " + givenName if givenName
	    label += " " + dateName if dateName
	    label += " " + termOfAddress if termOfAddress 
    end
    label
  end    
  
  ##  Relationship ###################################################################### 
  
  def relationshipRoleURI
    relationship[0] ? relationship[0].role : []
  end 
  def relationshipRoleURI=(val)
    if val.class == Array
    	val = val.first
    end
	if(!val.nil? && val.first.length > 0)
	    @roleURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")   	
	#end
	    if relationship[0] == nil
	      relationship.build
	    end
	    relationship[0].role = @roleURI
    end	  
  end   
  
  def relationshipNameURI
    if( !@nameType.nil? && (@nameType.include? 'CorporateName')) 
    	relationship[0] ? relationship[0].corporateName : []
    elsif( !@nameType.nil? && (@nameType.include? 'PersonalName')) 
        relationship[0] ? relationship[0].personalName : []
    elsif( !@nameType.nil? && (@nameType.include? 'Name')) 
        relationship[0] ? relationship[0].name : []  
    elsif( !@nameType.nil? && (@nameType.include? 'ConferenceName')) 
        relationship[0] ? relationship[0].conferenceName : []
    elsif( !@nameType.nil? && (@nameType.include? 'FamilyName')) 
        relationship[0] ? relationship[0].familyName : []                         
    else
    	relationship[0] ? relationship[0] : []
    end
    
  end 
  def relationshipNameURI=(val)
    if val.class == Array
    	val = val.first
    end
	if(!val.nil? && val.first.length > 0)
	    @nameURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")   	
	#end
	    if relationship[0] == nil
	      relationship.build
	    end
	    #relationship[0].corporateName = val	
	    if( !@nameType.nil? && (@nameType.include? 'CorporateName')) 
	    	relationship[0].corporateName = @nameURI 
	    elsif( !@nameType.nil? && (@nameType.include? 'PersonalName')) 
	    	relationship[0].personalName = @nameURI
	    elsif( !@nameType.nil? && (@nameType.include? 'ConferenceName')) 
	    	relationship[0].conferenceName = @nameURI
	    elsif( !@nameType.nil? && (@nameType.include? 'FamilyName')) 
	    	relationship[0].familyName = @nameURI	    		    	     
	    elsif( !@nameType.nil? && (@nameType.include? 'Name')) 
	    	relationship[0].name = @nameURI       		
	    #else
	    #	relationship[0].name = @nameURI    	
	    end
    end
  end    

  def relationshipNameValue
    if( !@nameType.nil? && (@nameType.include? 'CorporateName')) 
    	relationship[0] ? relationship[0].corporateName : []
    elsif( !@nameType.nil? && (@nameType.include? 'PersonalName')) 
        relationship[0] ? relationship[0].personalName : []
    elsif( !@nameType.nil? && (@nameType.include? 'ConferenceName')) 
        relationship[0] ? relationship[0].conferenceName : []
    elsif( !@nameType.nil? && (@nameType.include? 'FamilyName')) 
        relationship[0] ? relationship[0].familyName : []                
    elsif( !@nameType.nil? && (@nameType.include? 'Name')) 
        relationship[0] ? relationship[0].name : []        
    else
    	relationship[0] ? relationship[0].name : []  
    end
  end 
  def relationshipNameValue=(val)
    if val.class == Array
    	val = val.first
    end
	if(!val.nil? && val.first.length > 0)

	    if relationship[0] == nil
	      relationship.build
	    end

	    if( !@nameType.nil? && (@nameType.include? 'CorporateName')) 
	    	@obj = MadsCorporateName.find(name: val)
	    	if (@obj.class == Array && @obj.length > 0)
	    		@obj = @obj.first
	    	elsif (@obj.class == Array && @obj.length == 0)
	    		@obj = MadsCorporateName.create(name: val)
			end	    	
	    	relationship[0].corporateName = RDF::Resource.new("#{Rails.configuration.id_namespace}#{@obj.id}") 
	    elsif( !@nameType.nil? && (@nameType.include? 'PersonalName')) 
	    	@obj = MadsPersonalName.find(name: val)
	    	if (@obj.class == Array && @obj.length > 0)
	    		@obj = @obj.first
	    	elsif (@obj.class == Array && @obj.length == 0)
	    		@obj = MadsPersonalName.create(name: val)
			end
	    	relationship[0].personalName = RDF::Resource.new("#{Rails.configuration.id_namespace}#{@obj.id}")
	    elsif( !@nameType.nil? && (@nameType.include? 'ConferenceName')) 
	    	@obj = MadsConferenceName.find(name: val)
	    	if (@obj.class == Array && @obj.length > 0)
	    		@obj = @obj.first
	    	elsif (@obj.class == Array && @obj.length == 0)
	    		@obj = MadsConferenceName.create(name: val)
			end
	    	relationship[0].conferenceName = RDF::Resource.new("#{Rails.configuration.id_namespace}#{@obj.id}")
	    elsif( !@nameType.nil? && (@nameType.include? 'FamilyName')) 
	    	@obj = MadsFamilyName.find(name: val)
	    	if (@obj.class == Array && @obj.length > 0)
	    		@obj = @obj.first
	    	elsif (@obj.class == Array && @obj.length == 0)
	    		@obj = MadsFamilyName.create(name: val)
			end
	    	relationship[0].familyName = RDF::Resource.new("#{Rails.configuration.id_namespace}#{@obj.id}")	    		    	   
	    elsif( !@nameType.nil? && (@nameType.include? 'Name')) 
	    	@obj = MadsName.find(name: val)
	    	if (@obj.class == Array && @obj.length > 0)
	    		@obj = @obj.first
	    	elsif (@obj.class == Array && @obj.length == 0)
	    		@obj = MadsName.create(name: val)
			end
	    	relationship[0].name = RDF::Resource.new("#{Rails.configuration.id_namespace}#{@obj.id}") 	    			
	    end
    end
  end    
  
  def relationshipNameType
    @nameType
  end
  def relationshipNameType=(val)
    @nameType = Array.new
    i = 0
	val.each do |v| 
	    if(!v.nil? && v.length > 0)
	    	@nameType << v 	
	    end
		i+=1
	end
  end
  
  ## Cartographics ######################################################################
  def cartographicPoint
    cartographics[0] ? cartographics[0].point : []
  end
  def cartographicPoint=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].point = val
    end
  end

  def cartographicLine
    cartographics[0] ? cartographics[0].line : []
  end
  def cartographicLine=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].line = val
    end
  end  
  
  def cartographicPolygon
    cartographics[0] ? cartographics[0].polygon : []
  end
  def cartographicPolygon=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].polygon = val
    end
  end  
  
  def cartographicProjection
    cartographics[0] ? cartographics[0].projection : []
  end
  def cartographicProjection=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].projection = val
    end
  end 
  
  def cartographicRefSystem
    cartographics[0] ? cartographics[0].referenceSystem : []
  end
  def cartographicRefSystem=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].referenceSystem = val
    end
  end
  
  def cartographicScale
    cartographics[0] ? cartographics[0].scale : []
  end
  def cartographicScale=(val)
    if val.class == Array
      val = val.first
    end
    if(!val.nil? && val.length > 0)
      cartographics.build if cartographics[0] == nil
      cartographics[0].scale = val
    end
  end      
  
  ## Rights
   ######################################################################
  def copyrightURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@rightURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def copyrightURI
    if @rightURI != nil
      @rightURI
    end
  end      

  def statuteURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@statURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def statuteURI
    if @statURI != nil
      @statURI
    end
  end 
  
  def otherRightsURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@otherCopyRightURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def otherRightsURI
    if @otherCopyRightURI != nil
      @otherCopyRightURI
    end
  end 
  
  def licenseURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@licenURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def licenseURI
    if @licenURI != nil
      @licenURI
    end
  end 
  
  def rightsHolderURI=(val)
    if val.class == Array
    	val = val.first
    end
    if(!val.nil? && val.length > 0)
    	@holderURI = RDF::Resource.new("#{Rails.configuration.id_namespace}#{val}")
    end
  end
  def rightsHolderURI
    if @holderURI != nil
      @holderURI
    end
  end 
        
end
