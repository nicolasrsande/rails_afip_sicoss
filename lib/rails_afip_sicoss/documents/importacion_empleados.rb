module RailsAfipSicoss

  class ImportacionEmpleados < Fixy::Document

    ## Usage
    #
    def initialize(settlements_period)
      @settlements_periods = settlements_period
    end

    def build
      @settlements_periods.each do |employee_settlement|
        append_record Empleado.new(employee_settlement)
      end
    end

  end
end