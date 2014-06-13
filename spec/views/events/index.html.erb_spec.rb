require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :requester_id => 1,
        :responder_id => 2,
        :latitude => 1.5,
        :longitude => 1.5,
        :active => false
      ),
      Event.create!(
        :requester_id => 1,
        :responder_id => 2,
        :latitude => 1.5,
        :longitude => 1.5,
        :active => false
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 4
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
