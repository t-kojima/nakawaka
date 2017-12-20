require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :title => "MyString",
      :tag => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "input[name=?]", "entry[title]"

      assert_select "input[name=?]", "entry[tag]"

      assert_select "input[name=?]", "entry[role]"
    end
  end
end
