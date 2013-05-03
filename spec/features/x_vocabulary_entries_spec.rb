require "spec_helper"

#feature "Visit wants to look at copyright options" do
#
#  scenario "retrieve a copyright record" do
#    sign_in_developer
#    DamsCopyright.create! pid: "bb45454545", status: "under copyright--1st party", jurisdiction: "us", purposeNote: "foo", note: "bar", beginDate: "2012-12-31"
#
#    # visit list page and make sure object is there
#    visit dams_copyrights_path
#    expect(page).to have_content("under copyright--1st party")
#
#  end
#
#end

feature "Create and edit vocabulary entries" do
  scenario "create and edit a vocab entry" do
    # login
    sign_in_developer

    # create sample objects
    @v1 = XVocabulary.create! pid: "xx61616161", description: "First Vocab"
    @v2 = XVocabulary.create! pid: "xx62626262", description: "Second Vocab"

    # view index
    visit x_vocabulary_entries_path
    expect(page).to have_selector("h1", :text => "DAMS Vocabulary Entries");
    click_link "Create Vocabulary Entry"

    # new record form
    fill_in( "Code", :with => "a" )
    fill_in( "Value", :with => "Alpha" )
    fill_in( "Value URI", :with => "http://foo.com/#a" )
    select("First Vocab", :from => "Vocabulary" );
    click_button "Save"

    # initial show page
    #visit x_vocabulary_entry_path @e0
    expect(page).to have_selector("h1", :text => "Alpha");
    expect(page).to have_content("code: a");
    expect(page).to have_content("valueURI: http://foo.com/#a");
    expect(page).to have_content("vocabulary: First Vocab");
    click_link "Edit"

    # edit form
    select( "Second Vocab", :from => "Vocabulary" )
    click_button "Save"

    # updated show page
    expect(page).to have_content("vocabulary: Second Vocab");
    expect(page).to have_no_content("xx61616161")
  end
end

def sign_in_developer
  visit new_user_session_path
  fill_in "Name", :with => "name"
  fill_in "Email", :with => "email@email.com"
  click_on "Sign In"
end
