class Ability 
  include Hydra::Ability
  def custom_permissions
  	if current_user.new_record?  #Anonymous user
  		can [:read], DamsObject
  		can [:read], DamsUnit
  		can [:read], DamsCopyright
  		can [:read], DamsLicense
  		can [:read], DamsStatute
  		can [:read], DamsRole
  		can [:read], DamsLanguage
  		can [:read], DamsVocabulary
  		can [:read], DamsAssembledCollection
  		can [:read], DamsProvenanceCollection
  		can [:read], DamsProvenanceCollectionPart
  		can [:read], DamsVocabularyEntry
  		can [:read], DamsSourceCapture
  		can [:read], DamsCartographic
  		can [:read], MadsPersonalName
  		can [:read], SolrDocument
  		can [:read], MadsComplexSubject
  		can [:read], MadsTopic
  		can [:read], MadsTemporal
  		can [:read], XVocabulary
  		can [:read], XVocabularyEntry
  	else  #login user
    	can [:read, :create, :update, :view], DamsObject
    	can [:read, :create, :update, :view], DamsUnit
    	can [:read, :create, :update], DamsCopyright
    	can [:read, :create, :update], DamsLicense
    	can [:read, :create, :update], DamsStatute
    	can [:read, :create, :update], DamsRole
    	can [:read, :create, :update], DamsLanguage
    	can [:read, :create, :update], DamsVocabulary
  		can [:read, :create, :update], DamsAssembledCollection
  		can [:read, :create, :update], DamsProvenanceCollection
  		can [:read, :create, :update], DamsProvenanceCollectionPart
  		can [:read, :create, :update], DamsVocabularyEntry
  		can [:read, :create, :update], DamsSourceCapture
  		can [:read, :create, :update], DamsCartographic
  		can [:read, :create, :update, :view], MadsPersonalName
  		can [:read, :create, :update], SolrDocument
  		can [:read, :create, :update, :view], MadsComplexSubject
  		can [:read, :create, :update, :view], MadsTopic
  		can [:read, :create, :update, :view], MadsTemporal
    	can [:read, :create, :update], XVocabulary
  		can [:read, :create, :update], XVocabularyEntry
    end
  end
end
