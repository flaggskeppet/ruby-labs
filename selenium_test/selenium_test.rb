#require 'selenium-webdriver'

profile = Selenium::WebDriver::Firefox::ProfilesIni.new['default']
capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
@driver = Selenium::WebDriver.for :remote, :url => "http://localhost:8080", :desired_capabilities => capabilities


#@driver = Selenium::WebDriver.for :firefox