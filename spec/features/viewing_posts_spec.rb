require 'spec_helper'

describe 'viewing individual posts' do
  it 'can click and view a post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
