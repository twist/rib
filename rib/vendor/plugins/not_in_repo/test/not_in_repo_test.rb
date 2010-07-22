require 'test_helper'

class NotInRepoTest < ActiveSupport::TestCase

        def test_initializing

              NotInRepo.new("blub")  
        end
end
