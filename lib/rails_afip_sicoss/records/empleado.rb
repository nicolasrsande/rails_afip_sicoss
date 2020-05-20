module RailsAfipSicoss

  class Empleado < Fixy::Record
    include Fixy::Formatter::Numeric
    include Fixy::Formatter::NumericFloatL
    include Fixy::Formatter::Alphanumeric

    set_record_length 499

    # Fields Declaration:
    # -----------------------------------------------------------
    #       name          size      Range             Format
    # ------------------------------------------------------------
    field :cuil, 11, '1-11', :numeric
    field :apellido_nombre, 30, '12-41', :alphanumeric #TODO: ACOTAR
    field :conyugue, 1, '42-42', :alphanumeric
    field :cantidad_hijos, 2, '43-44', :numeric
    field :codigo_situacion, 2, '45-46', :numeric
    field :codigo_condicion, 2, '47-48', :numeric
    field :codigo_actividad, 3, '49-51', :numeric
    field :codigo_zona, 2, '52-53', :numeric
    field :porcentaje_aporte_adicional_ss, 5, '54-58', :numeric_float_l
    field :modalidad_contratacion, 3, '59-61', :numeric
    field :codigo_obra_social, 6, '62-67', :numeric
    field :cantidad_adherentes, 2, '68-69', :numeric
    field :remuneracion_total, 12, '70-81', :numeric_float_l
    field :remuneracion_1, 12, '82-93', :numeric_float_l
    field :asignaciones_familiares_pagadas, 9, '94-102', :numeric_float_l
    field :importe_aporte_voluntario, 9, '103-111', :numeric_float_l
    field :importe_adicional_os, 9, '112-120', :numeric_float_l
    field :importe_exedente_aportes_ss, 9, '121-129', :numeric_float_l
    field :importe_exedente_aportes_os, 9, '130-138', :numeric_float_l
    field :provincia_localidad, 50, '139-188', :alphanumeric #TODO: ACOTAR
    field :remuneracion_2, 12, '189-200', :numeric_float_l
    field :remuneracion_3, 12, '201-212', :numeric_float_l
    field :remuneracion_4, 12, '213-224', :numeric_float_l
    field :codigo_siniestrado, 2, '225-226', :numeric
    field :corresponde_reduccion, 1, '227-227', :alphanumeric
    field :capital_recomposicion_lrt, 9, '228-236', :numeric_float_l
    field :tipo_empresa, 1, '237-237', :numeric
    field :aporte_adicional_obra_social, 9, '238-246', :numeric_float_l
    field :regimen, 1, '247-247', :numeric
    field :situacion_revista_1, 2, '248-249', :numeric
    field :dia_revista_1, 2, '250-251', :numeric
    field :situacion_revista_2, 2, '252-253', :numeric
    field :dia_revista_2, 2,'254-255', :numeric
    field :situacion_revista_3, 2, '256-257', :numeric
    field :dia_revista_3, 2, '258-259', :numeric
    field :sueldo_adicionales, 12, '260-271', :numeric_float_l
    field :sac, 12, '272-283', :numeric_float_l
    field :horas_extra, 12, '284-295', :numeric_float_l
    field :zona_desfavorable, 12, '296-307', :numeric_float_l
    field :vacaciones, 12, '308-319', :numeric_float_l
    field :dias_trabajdos, 9, '320-328', :numeric_float_l
    field :remuneracion_5, 12, '329-340', :numeric_float_l
    field :trabajador_convencionado, 1, '341-341', :numeric
    field :remuneracion_6, 12, '342-353', :numeric_float_l
    field :tipo_operacion, 1, '354-354', :numeric
    field :adicionales, 12, '355-366', :numeric_float_l
    field :premios, 12, '367-378', :numeric_float_l
    field :remuneracion_8, 12, '379-390', :numeric_float_l
    field :remuneracion_7, 12, '391-402', :numeric_float_l
    field :cantidad_horas_extra, 3, '403-405', :numeric
    field :no_remunerativo, 12, '406-417', :numeric_float_l
    field :maternidad, 12, '418-429', :numeric_float_l
    field :rectificacion_remuneracion, 9, '430-438', :numeric_float_l
    field :remuneracion_9, 12, '439-450', :numeric_float_l
    field :contribucion_tarea_diferencial, 9, '451-459', :numeric_float_l
    field :horas_trabajadas, 3, '460-462', :numeric
    field :scvo, 1, '463-463', :alphanumeric
    field :detraccion_ley27430, 12, '464-475', :numeric_float_l
    field :incremento_salarial, 12, '476-487', :numeric_float_l
    field :remuneracion_11, 12, '488-499', :numeric_float_l

    def initialize(employee_settlement)
      ## Datos de empleado ##
      @tipo_empresa = employee_settlement[:tipo_empresa] || 1
      @regimen = employee_settlement[:regimen] || 1
      @cuil = employee_settlement[:cuil]
      @apellido_nombre = employee_settlement[:apellido_nombre]
      @conyugue = employee_settlement[:conyugue] || 'F'
      @cantidad_hijos = employee_settlement[:cant_hijos] || 0
      @codigo_situacion = employee_settlement[:codigo_situacion] || 1
      @codigo_condicion = employee_settlement[:codigo_condicion] || 1
      @codigo_actividad = employee_settlement[:codigo_actividad] || 49
      @codigo_zona = employee_settlement[:codigo_zona] || 76
      @porcentaje_aporte_adicional_ss = employee_settlement[:porcentaje_aporte_adicional_ss] || 0
      @modalidad_contratacion = employee_settlement[:modalidad_contratacion] || 8
      @codigo_obra_social = employee_settlement[:codigo_obra_social]
      @cantidad_adherentes = employee_settlement[:cantidad_adherentes] || 0
      @provincia_localidad = employee_settlement[:provincia_localidad] || 'Bueos Aires - CABA'
      @trabajador_convencionado = employee_settlement[:trabajador_convencionado] || 'F'
      @scvo = employee_settlement[:scvo] || 'T'
      @codigo_siniestrado = employee_settlement[:codigo_siniestrado] || 0
      @tipo_operacion = employee_settlement[:tipo_operacion] || 0

      ## Datos Complementarios para Calculo de Rem. ##
      @situacion_revista_1 = employee_settlement[:revista_1] || 1
      @dia_revista_1 = employee_settlement[:dia_revista_1] || 1
      @situacion_revista_2 = employee_settlement[:revista_2] || 1
      @dia_revista_2 = employee_settlement[:dia_revista_2] || 0
      @situacion_revista_3 = employee_settlement[:revista_3] || 1
      @dia_revista_3 = employee_settlement[:dia_revista_3] || 0
      #
      @cantidad_horas_extra = employee_settlement[:cantidad_horas_extra] || 0 # Cantidad horas extra
      @dias_trabajdos = employee_settlement[:dias_trabajados] || 30 # Dias trabajados
      @horas_trabajadas = employee_settlement[:horas_trabajadas] || 0 # Horas Trabajadas
      #
      @sueldo_adicionales = employee_settlement[:sueldo_adicionales] # Sueldo Bruto Basico
      @sac = employee_settlement[:sac] || 0 # Aguinaldo
      @adicionales = employee_settlement[:adicionales] || 0 # Adicional Sueldo Basico
      @premios = employee_settlement[:premios] || 0 # Premios
      @vacaciones = employee_settlement[:vacaciones] || 0 # Vacaciones
      @no_remunerativo = employee_settlement[:no_remunerativo] || 0 # No Remunerativo
      @incremento_salarial = employee_settlement[:incremento_salarial] || 0 # Incremento Salarial Solidario
      @horas_extra = employee_settlement || 0 # Importe horas extra
      @maternidad = employee_settlement[:maternidad] || 0 # Solo se informa si la situacion de revista lo permite
      @zona_desfavorable = employee_settlement[:zona_desfavorable] || 0 # Plus por zona desfavorable
      ## Calculo de remuneraciones y detracciones
      @remuneracion_total = rem_total # Total de todas las remuneraciones
      @remuneracion_1 = rem_default # Aportes Previsionales y Seg. Sepelio UATRE
      @remuneracion_2 = rem_default # Contribuciones Previsionales y PAMI
      @remuneracion_3 = rem_default # Contribuciones de Fondo Nacional de Empleo, Asig. Familiares y RENATRE
      @remuneracion_4 = rem_default # Aportes de Obra Social y ANSSAL
      @remuneracion_5 = rem_default # Aportes PAMI
      @remuneracion_6 = employee_settlement[:remuneracion_6] || 0 # Aporte Diferencial
      @remuneracion_7 = employee_settlement[:remuneracion_7] || 0 # Aporte personal Regímenes especiales
      @remuneracion_8 = rem_default # Contribuciones de Obra Social y ANSSAL
      @remuneracion_9 = rem_default # Ley de Riesgos de Trabajo
      @detraccion_ley27430 = employee_settlement[:detraccion_ley27430] || detraccion_auto #Importe a detraer - Modifica Rem. 10
      @remuneracion_11 = employee_settlement[:remuneracion_11] || @incremento_salarial # Contribuciones Dcto 14/20 PAMI, Fondo Nacional de Empleo y Asig. Familiares (Incremento Solidario)

      ## Otros Adicionales
      @asignaciones_familiares_pagadas = employee_settlement[:asignaciones_familiares_pagadas] || 0
      @importe_aporte_voluntario = employee_settlement[:importe_aporte_voluntario] || 0
      @importe_adicional_os = employee_settlement[:importe_adicional_os] || 0
      @importe_exedente_aportes_ss = employee_settlement[:importe_exedente_aportes_ss] || 0
      @importe_exedente_aportes_os = employee_settlement[:importe_adicional_os] || 0
      @corresponde_reduccion = employee_settlement[:corresponde_reduccion] || 'F'
      @capital_recomposicion_lrt = employee_settlement[:capital_recomposicion_lrt] || 0
      @aporte_adicional_obra_social = employee_settlement[:aporte_adicional_obra_social] || 0
      @rectificacion_remuneracion = employee_settlement[:rectificacion_remuneracion] || 0
      @contribucion_tarea_diferencial = employee_settlement[:contribucion_tarea_diferencial] || 0

      # Define Attr Readers for all class variables
      define_attr_readers
    end

    # Calcula la remuneracion imponible a aportes y contribuciones
    def rem_default
      @sueldo_adicionales + @incremento_salarial + @vacaciones + @sac + @adicionales + @premios + @horas_extra + @maternidad
    end

    # Calcula la remuneracion total percibida por el empleado en el perido
    def rem_total
      rem_default + @no_remunerativo
    end

    # Define la detraccion Ley a realizar segun si es el peridoo de aguinaldo
    def detraccion_auto # Todo: Permitir el cambio de las variables de detraccion Ley.
      if @sac > 0
        10505.52
      else
        7003.68
      end
    end

    ## Define all class variables as attr_reader
    def define_attr_readers
      # get the eigenclass of the current object
      klass = class << self; self; end

      symbols = instance_variables.map { |s|
        # remove the @ at the start of the symbol
        s.to_s[1..-1].to_sym
      }

      # augment the eigenclass
      klass.class_eval do
        symbols.each do |s|
          attr_reader s
        end
      end
    end
  end
end