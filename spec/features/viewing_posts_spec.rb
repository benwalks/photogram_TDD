require 'spec_helper'

features 'viewing individual posts' do
  scenario 'can click and view a single post from the index' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
