FY_START_MONTH = 4

module ActsAsFiscal
  module Core
    def self.included(base)
      base.extend ClassMethods

      def financial_year
        self.month < FY_START_MONTH ? self.year - 1 : self.year
      end

      def beginning_of_financial_year
        self.change(year: self.financial_year, month: FY_START_MONTH, day: 1)
      end
      alias :beginning_of_financial_q1 :beginning_of_financial_year

      def end_of_financial_year
        (self.beginning_of_financial_year + 1.year - 1.month).end_of_month
      end

      def financial_quarter
        "Q#{( months_between / 3 ).floor + 1} #{ self.financial_year}"
      end
    end

    module ClassMethods
      def fy_start_month
        FY_START_MONTH
      end

      def financial_year_start(year = Date.today.year)
        self.new(year, self.fy_start_month, 1)
      end
    end

    private

    def months_between
      soy = self.beginning_of_financial_year
      (self.month - soy.month) + 12 * (self.year - soy.year)
    end
  end
end