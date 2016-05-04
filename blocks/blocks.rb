require 'test/unit'
require_relative 'with'
require 'test/unit/ui/console/testrunner'
require 'pry'

class TestWith < Test::Unit::TestCase
  class Resource
    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def test_disposed_of_resources
    r = Resource.new
    with(r) {}
    assert r.disposed?
  end

  def test_disposes_of_resources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception) {
      with(r) {
        raise Exception
      }
    }
    assert r.disposed?
  end
end

Test::Unit::UI::Console::TestRunner.run(TestWith)
