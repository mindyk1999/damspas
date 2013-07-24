require 'net/http'
require 'json'

class GetDataController < ApplicationController
  include Blacklight::Catalog
  include Dams::ControllerHelper
  def get_linked_data 	
  	#http://localhost:3000/get_data/get_data/get_data?q=dog&fl=suggestall
	uri = URI('http://fast.oclc.org/fastSuggest/select')
    if(!params[:q].nil? && params[:q] != '' && !params[:fl].nil? && params[:fl] != '')		
		#res = Net::HTTP.post_form(uri, 'q' => 'suggestall :cats', 'fl' => 'suggestall', 'wt' => 'json')
		res = Net::HTTP.post_form(uri, 'q' => "#{params[:fl]} :#{params[:q]}", 'fl' => params[:fl], 'wt' => 'json')
		json = JSON.parse(res.body)
		if(json.fetch("response").fetch("numFound") > 0 && json.fetch("response").fetch("numFound") < 1000)
			res = Net::HTTP.post_form(uri, 'q' => "#{params[:fl]} :#{params[:q]}", 'fl' => params[:fl], 'wt' => 'json', 'rows' => json.fetch("response").fetch("numFound"), 'sort' => 'usage desc')
			json = JSON.parse(res.body)		
		elsif(json.fetch("response").fetch("numFound") > 0 && json.fetch("response").fetch("numFound") > 1000)
			res = Net::HTTP.post_form(uri, 'q' => "#{params[:fl]} :#{params[:q]}", 'fl' => params[:fl], 'wt' => 'json', 'rows' => 1000, 'sort' => 'usage desc')
			json = JSON.parse(res.body)							
		end
		@jdoc = json.fetch("response").fetch("docs")
		puts json
		render :layout => false
	else
		res = Net::HTTP.post_form(uri, 'q' => 'suggestall :*', 'fl' => 'suggestall', 'wt' => 'json', 'rows' => 1000)	
		json = JSON.parse(res.body)
		@jdoc = json.fetch("response").fetch("docs")
		render :layout => false
	end
  end

  def get_name 	
  	#http://localhost:3000/get_data/get_name/get_name?q=PersonalName&formType=dams_object
  	if(!params[:q].nil? && params[:q] != '' && params[:q] == 'CorporateName')
		@names = get_objects('MadsCorporateName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'PersonalName')
		@names = get_objects('MadsPersonalName','name_tesim')			
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'ConferenceName')
		@names = get_objects('MadsConferenceName','name_tesim')		
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'FamilyName')
		@names = get_objects('FamilyName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Name')
		@names = get_objects('MadsName','name_tesim')							
	else
		@names = get_objects('MadsName','name_tesim')
	end
	@formType = params[:formType]

	render :layout => false
  end
 
  def get_subject	
  	#http://localhost:3000/get_data/get_subject/get_subject?q=Topic&formType=dams_object&fieldName=simpleSubjectURI&label=Subject
  	if(!params[:q].nil? && params[:q] != '' && params[:q] == 'Topic')
		@subjects = get_objects('MadsTopic','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'BuiltWorkPlace')
		@subjects = get_objects('DamsBuiltWorkPlace','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'CulturalContext')
		@subjects = get_objects('DamsCulturalContext','name_tesim')		
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Function')
		@subjects = get_objects('DamsFunction','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'GenreForm')
		@subjects = get_objects('MadsGenreForm','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Geographic')
		@subjects = get_objects('MadsGeographic','name_tesim')	
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Iconography')
		@subjects = get_objects('DamsIconography','name_tesim')		
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'ScientificName')
		@subjects = get_objects('DamsScientificName','name_tesim')	
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Technique')
		@subjects = get_objects('DamsTechnique','name_tesim')	
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Temporal')
		@subjects = get_objects('MadsTemporal','name_tesim')
	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'StylePeriod')
		@subjects = get_objects('MadsStylePeriod','name_tesim')		
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'CorporateName')
		@subjects = get_objects('MadsCorporateName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'PersonalName')
		@subjects = get_objects('MadsPersonalName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'ConferenceName')
		@subjects = get_objects('MadsConferenceName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'FamilyName')
		@subjects = get_objects('MadsFamilyName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Name')
		@subjects = get_objects('MadsName','name_tesim')
  	elsif(!params[:q].nil? && params[:q] != '' && params[:q] == 'Occupation')
		@subjects = get_objects('MadsOccupation','name_tesim')																													
	else
		@subjects = get_objects('MadsTopic','name_tesim')
	end
	@formType = params[:formType]
	@fieldName = params[:fieldName]
	@label = params[:label]
	render :layout => false
  end    
  def show
	redirect_to :action => 'get_linked_data'
  end
end