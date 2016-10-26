require 'test_helper'

class CustomerControllerTest < ActionController::TestCase

  test "should get index" do
# stub create_squareup_customer
@controller.stubs(:get_squareup_customers).returns([
    {
      "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
      "created_at": "2016-03-23T20:21:54.859Z",
      "updated_at": "2016-03-23T20:21:55Z",
      "given_name": "Amelia",
      "family_name": "Earhart",
      "email_address": "Amelia.Earhart@example.com",
      "address": {
        "address_line_1": "500 Electric Ave",
        "address_line_2": "Suite 600",
        "locality": "New York",
        "administrative_district_level_1": "NY",
        "postal_code": "10003",
        "country": "US"
        },
        "phone_number": "1-212-555-4240",
        "reference_id": "YOUR_REFERENCE_ID",
        "note": "a customer"
      }
    ])
    get :index
    assert_response :success
  end

end
