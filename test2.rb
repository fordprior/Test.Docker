require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
end

def setup
  url = 'http://selenium.hub.docker/wd/hub'
  capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
  Capybara.app_host = "http://#{ENV['APP_HOST']}"
  Capybara.run_server = false

  Capybara.register_driver :remote_browser do |app|
    Capybara::Selenium::Driver.new(
      app,
      :browser => :remote,
      url: url,
      desired_capabilities: capabilities
    )
  end

  Capybara.default_driver = :remote_browser
  Capybara.javascript_driver = :remote_browser
end

describe 'This is an example' do
  it 'and it works' do
    setup
    visit '/'
    expect(page.title).to eq 'Home'
  end
end