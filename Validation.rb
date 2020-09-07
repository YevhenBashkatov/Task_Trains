module Validation
  def self.include(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(attribute_name, validation_type, option = true)
        validates_hash[attribute_name] = {
            validation_type => {
                option: option,
                error_message: validation_errors(validation_type, attribute_name)
            }
        }

    end

    def validation_type
      [:presence, :format ,:type]
    end

    def validates_hash
      @validates_hash ||= {}
    end

    def validation_errors(validation_type, attribute_name)
      case validation_type
      when :presence
        "#{attribute_name} can`t be nil or ''"
      when :format
        "#{attribute_name} has invalid format"
      when :type
        "#{attribute_name} has invalid type"
      end
    end
  end

  module InstanceMethods

    def presence_validation(attribute_name, option = true)
      raise validation_errors(:presence,attribute_name) if attribute_name.nil?
    end

    def format_validation(attribute_name, option)
      raise validation_errors(:format,attribute_name) if attribute_name !~ option
    end
    def type_validation(attribute_name, option)
      raise validation_errors(:type,attribute_name) if attribute_name.class.is_a? option

    end
  end

end

class A
  include Validation





end


