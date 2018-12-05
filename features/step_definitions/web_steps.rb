#
#  This file conatins the web steps to pass senarios for user stories
#
#
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given("the following tasks:") do |task_table|
  user = User.first
  task_table.hashes.each do |task|
    user.tasks.create!(task)
  end
end

When("I am on {string} users page") do |string|
  visit path_to(string)
end

And("I fill in {string} with {string}") do |string,string2|
  fill_in(string, :with => string2)
end

And("I press {string}") do |string|
  click_on (string)
end

Then("I should see {string} message") do |string|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then("I should be on {string} page") do |string|
  GivenGivencurrent_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(string)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given("I am logged in as {string}") do |string|
    user = User.find("email=",string)
end

When("I am on the dashboard") do
  visit '/users'
end

Then("I should see all my tasks") do
  user = User.first
    if page.respond_to? :should
      page.should have_no_content(user.tasks.first.title)
    else
      assert page.has_no_content?(user.tasks.first.title)
    end
end
