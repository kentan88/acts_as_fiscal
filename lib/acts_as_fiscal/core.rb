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
      alias :end_of_financial_q4 :end_of_financial_year

      def end_of_financial_q1
        self.end_of_financial_year - 9.months
      end

      def beginning_of_financial_q2
        self.beginning_of_financial_year + 3.months
      end

      def end_of_financial_q2
        self.end_of_financial_year - 6.months
      end

      def beginning_of_financial_q3
        self.beginning_of_financial_year + 6.months
      end

      def end_of_financial_q3
        self.end_of_financial_year - 3.months
      end

      def beginning_of_financial_q4
        self.beginning_of_financial_year + 9.months
      end
      alias :end_of_financial_q4 :end_of_financial_year

      def financial_quarter
        "Q#{( months_between / 3 ).floor + 1} #{ self.financial_year}"
      end

      def financial_months
        (1..12).map{ |m| ((m - 1 + FY_START_MONTH) % 12.1).ceil }
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