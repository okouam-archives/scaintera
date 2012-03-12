module Faker
  class Policy < Base
      class << self
        def status
          %w(active blocked).sample(1)[0]
        end
        def plan
          %w(young_active young_semi_active senior_active senior_semi_active).sample(1)[0]
        end
      end
  end
  class Product
    class << self
      def category
        %w(maladie vie auto habitation voyage protection_revenue funeraire).sample(1)[0]
      end
    end
  end
  class Person < Base
    class << self
      def nationality
        ['Ivorian', 'British', 'French', 'American', 'Russian', 'Japanese', 'Dutch'].sample(1)[0]
      end
      def dob
        DateTime.now << ((Random.rand(300) * 12) + (12 * 20))
      end
      def gender
        %w(male female).sample(1)[0]
      end
    end
  end
  class Logic < Base
    class << self
      def boolean
        [true, false].sample(1)[0]
      end
    end
  end
  class Name < Base
    def names(min, max)
      num = Random.rand(max) + min
      num.times.map{Faker::Name.first_name}.join(" ")
    end
  end
end