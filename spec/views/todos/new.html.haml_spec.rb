require 'rails_helper'

RSpec.describe "todos/new", type: :view do
  before(:each) do
    assign(:todo, Todo.new(
      :details => "MyText"
    ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do

      assert_select "textarea#todo_details[name=?]", "todo[details]"
    end
  end
end
