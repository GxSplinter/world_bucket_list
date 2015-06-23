require 'rails_helper'

RSpec.describe "todos/edit", type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :details => "MyText"
    ))
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do

      assert_select "textarea#todo_details[name=?]", "todo[details]"
    end
  end
end
