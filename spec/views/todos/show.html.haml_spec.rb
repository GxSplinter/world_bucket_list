require 'rails_helper'

RSpec.describe "todos/show", type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
