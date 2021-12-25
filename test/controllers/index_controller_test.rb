require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get root_url
    assert_response :success
  end

  test 'should make output with selenium' do
    driver = Selenium::WebDriver.for :firefox
    begin
      driver.get 'http://127.0.0.1:3000/'
      driver.find_element(id: 'n-val').send_keys '10', :return
      Selenium::WebDriver::Wait.new(timeout: 10).until { assert driver.find_element(id: 'result').text.include? '11 13, 17 19' }
      assert driver.find_element(id: 'result')
    ensure
      driver.quit
    end
  end

  test 'should no result in output with selenium' do
    driver = Selenium::WebDriver.for :firefox
    begin
      driver.get 'http://127.0.0.1:3000/'
      driver.find_element(id: 'n-val').send_keys '2', :return
      Selenium::WebDriver::Wait.new(timeout: 10).until { assert driver.find_element(id: 'result').text.include? 'Нет пар-близнецов' }
      assert driver.find_element(id: 'result')
    ensure
      driver.quit
    end
  end
end
