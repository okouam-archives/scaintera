module Faker
  class Policy < Base
      class << self
        def status
          %w(active blocked).sample(1)[0]
        end
        def category
          %w(group_complete group_limited senior_group_complete senior_group_limited).sample(1)[0]
        end
      end
  end
  class InsuranceProduct
    class << self
      def cover
        ["House Insurance", "3rd Party Insurance", "Work Insurance", "Retirement Pension"].sample(1)[0]
      end
    end
  end
  class Person < Base
    class << self
      def relationship
        ['Daughter', 'Son', 'Cousin', 'Brother-in-law', 'Sister-in-law', 'Uncle', 'Aunt', 'Nephew', 'Niece'].sample(1)[0]
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