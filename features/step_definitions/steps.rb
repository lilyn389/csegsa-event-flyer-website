require 'rubygems'
require 'selenium-webdriver'
require "watir"
driver = Selenium::WebDriver.for :phantomjs
browser = Watir::Browser.new :phantomjs
homepage_url = "https://bloodcurdling-ghost-51982.herokuapp.com/flyers"


Given("I am on the {string} page") do |page_name|
  target_url = ""
  
  case page_name
    when "home"
      target_url = homepage_url
    when "Archive"
      target_url = homepage_url + "/archive"
  end
  
  driver.get target_url
end

When("I follow {string}") do |link_text|
  follow_link = driver.find_element(:link, link_text)
  follow_link.click
end

Then("I should be on the {string} page") do |target_page_name|
  target_url = ""
  
  case target_page_name
    when "home"
      target_url = homepage_url
    when "Create New Flyer"
      target_url = homepage_url + "/new"
    when "Archive"
      target_url = homepage_url + "/archive"
    when "Details about Christmas Kickoff"
      target_url = homepage_url + "/1"
    when "Details about archived Christmas Kickoff"
      target_url = homepage_url + "/1/archive_show"
    when "Details about archived Weekend Kickoff"
      target_url = homepage_url + "/3/archive_show"
  end
  
  expect(driver.current_url).to eq(target_url)
end

When("I fill in {string} with {string}") do |field_label, input_data|
  target_id = ""
  
  case field_label
    when "Title"
      target_id = "flyer_title"
    when "Location"
      target_id = "flyer_location"
    when "Year"
      target_id = "flyer_event_date_1i"
    when "Month"
      target_id = "flyer_event_date_2i"
    when "Day"
      target_id = "flyer_event_date_3i"
  end
  
  field = driver.find_element :id => target_id
  field.send_keys input_data
end

When("I submit") do
  form = driver.find_element(:tag_name, "input")
  form.submit
end


Then("I should see {string}") do |find_str|
  expect(driver.page_source).to include(find_str)
end

Then("I should not see {string}") do |find_str|
  expect(driver.page_source).not_to include(find_str)
end

Then("I click {string}") do |button_name|
  browser.goto(driver.current_url)
  browser.execute_script("window.confirm = function(){return true;}");
  browser.button(value: button_name).click
  driver.get(browser.url)
end

When("I accept") do
  driver.browser.switch_to.alert.accept
end
