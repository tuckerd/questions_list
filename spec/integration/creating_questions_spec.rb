require "spec_helper"

feature "Creating Questions" do
  before do
    visit '/'
    click_link 'New Question'
  end 

  scenario "can create a new question" do
    fill_in 'Priority', with: 'Low'
    fill_in 'Domain', with: 'Sublime Text 2'
    fill_in 'Question', with: "How do you make the tab stops be dependant on file type?"
    click_button 'Create Question'
    page.should have_content('Question has been added.')
  end

  scenario "cannot create a question without the question filled in" do
    fill_in 'Priority', with: 'Low'
    fill_in 'Domain', with: 'Sublime Text 2'
    click_button 'Create Question'
    page.should have_content("Question can't be blank")
  end

  scenario "Priorty must be Low Medium or High" do
    fill_in 'Domain', with: 'Sublime Text 2'
    fill_in 'Question', with: "How do you make the tab stops be dependant on file type?"
    click_button 'Create Question'
    page.should have_content('Priority must be Low, Medium, or High')
  end
end
