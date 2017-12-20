require 'rails_helper'

RSpec.describe "entries/show", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :title => "Title",
      :tag => "Tag",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Role/)
  end
end
