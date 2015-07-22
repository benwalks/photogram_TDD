require 'rails_helper'

feature 'Can see a list of posts on the index' do
  scenario 'the index lists all jobs' do
    job_one = create(:post, caption: "This is post one")
    job_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee']")
  end
end
