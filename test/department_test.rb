require 'minitest/autorun'
require 'minitest/pride'
require './lib/employee'
require './lib/department'

class DepartmentTest < Minitest::Test

  def setup
    @customer_service = Department.new("Customer Service")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  def test_it_exists
    assert_instance_of Department, @customer_service
  end

  def test_it_initializes
    assert_equal "Customer Service", @customer_service.name
  end

  def test_it_starts_with_no_employees
    assert_equal [], @customer_service.employees
  end

  def test_it_can_add_employees
     @customer_service.hire(@bobbi)
     @customer_service.hire(@aaron)
     assert_equal 2, @customer_service.employees.size
     assert_equal true, @customer_service.employees.include?(@bobbi)
     assert_equal true, @customer_service.employees.include?(@aaron)
  end

  def test_it_starts_with_no_expenses
    assert_equal 0, @customer_service.expenses
  end

  def test_it_adds_expenses
    @customer_service.expense(100)
    @customer_service.expense(25)
    assert_equal 125, @customer_service.expenses
  end
end
