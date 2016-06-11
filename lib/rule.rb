module Supermarket
  class Rule
    private

    attr_reader :base_price, :calculator_proc

    public

    def initialize(base_price, calculator_proc=nil)
      @base_price = base_price
      @calculator_proc = calculator_proc # todo: do this with inheritance and concrete rules?
    end

    def total(count)
      if has_special_calculator?
        calculator_proc.call(base_price, count)
      else
        base_price
      end
    end

    private

    def has_special_calculator?
      not calculator_proc.nil?
    end
  end
end
