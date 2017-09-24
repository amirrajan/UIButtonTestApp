describe "Application 'TestRM538'" do
  tests Controller

  it "should not raise an exception when tap a button" do
    tap('test', :times => 1, :touches => 1)
    wait(0.2) {}

    1.should == 1
  end
end
