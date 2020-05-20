require "fixy"
require "rails_afip_sicoss/version"
require "rails_afip_sicoss/documents/importacion_empleados"
require "rails_afip_sicoss/records/empleado"
require "rails_afip_sicoss/fixy/formatter/numeric"
require "rails_afip_sicoss/fixy/formatter/numeric_float_l"

module RailsAfipSicoss
  class Error < StandardError; end
end
