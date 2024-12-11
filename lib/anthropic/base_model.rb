# frozen_string_literal: true

module Anthropic
  # @!visibility private
  #
  module Converter
    # Based on `value`, returns a value that conforms to `type`, to the extent possible:
    # - If the given `value` conforms to `type` already, the given `value`.
    # - If it's possible and safe to convert the given `value` to `type`, such a converted value.
    # - Otherwise, the given `value` unaltered.
    #
    # @param target_type [Class, Anthropic::Converter]
    # @param value [Object]
    #
    # @raise [ArgumentError]
    # @return [Object]
    def self.convert(target_type, value)
      # If `target_type.is_a?(Converter)`, `target_type` is an instance of a class that mixes
      # in `Converter`, indicating that the type should define `#convert` on this
      # instance. This is used for Enums and ArrayOfs, which are parameterized.
      # If `target_type.include?(Converter)`, `target_type` is a class that mixes in `Converter`
      # which we use to signal that the class should define `.convert`. This is
      # used where the class itself fully specifies the target_type, like model classes.
      # We don't monkey-patch Ruby-native types, so those need to be handled
      # directly.
      if target_type.is_a?(Converter) || target_type.include?(Converter)
        target_type.convert(value)
      elsif target_type <= NilClass
        nil
      elsif target_type <= Float
        value.is_a?(Numeric) ? value.to_f : value
      elsif [Date, Time].any? { |cls| target_type <= cls }
        target_type.parse(value)
      elsif target_type == Object || [Hash, String, Integer].any? { |cls| target_type <= cls }
        value
      else
        raise ArgumentError.new("Unexpected conversion target type #{target_type}")
      end
    end
  end

  # @!visibility private
  #
  # When we don't know what to expect for the value.
  class Unknown
    include Anthropic::Converter

    # @param value [Object]
    #
    # @return [Object]
    def self.convert(value)
      value
    end
  end

  # @!visibility private
  #
  # Ruby has no Boolean class; this is something for models to refer to.
  class BooleanModel
    include Anthropic::Converter

    # @param value [Boolean, Object]
    #
    # @return [Boolean, Object]
    def self.convert(value)
      value
    end
  end

  # @!visibility private
  #
  # A value from among a specified list of options. OpenAPI enum values map to
  # Ruby values in the SDK as follows:
  # boolean => true|false
  # integer => Integer
  # float => Float
  # string => Symbol
  # We can therefore convert string values to Symbols, but can't convert other
  # values safely.
  class Enum
    include Anthropic::Converter

    # @param value [Symbol, String, Object]
    #
    # @return [Symbol, Object]
    def self.convert(value)
      case value
      in String
        value.to_sym
      else
        value
      end
    end

    # @return [Array<Symbol>] All of the valid Symbol values for this enum.
    def self.values
      @values ||= constants.map { |c| const_get(c) }
    end
  end

  # @!visibility private
  #
  # Array of items of a given type.
  class ArrayOf
    include Anthropic::Converter

    # @param items_type_info [Proc, Object, nil]
    # @param enum [Proc, nil]
    def initialize(items_type_info = nil, enum: nil)
      @items_type_fn = enum || (items_type_info.is_a?(Proc) ? items_type_info : -> { items_type_info })
    end

    # @param value [Enumerable, Object]
    #
    # @return [Array<Object>]
    def convert(value)
      items_type = @items_type_fn.call
      case value
      in Enumerable
        value.map { |item| Converter.convert(items_type, item) }.to_a
      else
        value
      end
    end
  end

  # @!visibility private
  #
  class BaseModel
    include Anthropic::Converter

    # @!visibility private
    #
    # Assumes superclass fields are totally defined before fields are accessed / defined on subclasses.
    #
    # @return [Hash{Symbol => Hash{Symbol => Object}}]
    def self.fields
      @fields ||= (superclass == BaseModel ? {} : superclass.fields.dup)
    end

    # @!visibility private
    #
    # @param name_sym [Symbol]
    # @param api_name [Symbol, nil]
    # @param type_info [Proc, Object]
    # @param mode [Symbol]
    #
    # @return [void]
    private_class_method def self.add_field(name_sym, api_name:, type_info:, mode:)
      type_fn = type_info.is_a?(Proc) ? type_info : -> { type_info }
      key = api_name || name_sym
      fields[name_sym] = {type_fn: type_fn, mode: mode, key: key}

      define_method("#{name_sym}=") { |val| @data[key] = val }

      define_method(name_sym) do
        field_type = type_fn.call
        Anthropic::Converter.convert(field_type, @data[key])
      rescue StandardError
        name = self.class.name.split("::").last
        raise Anthropic::ConversionError.new(
          "Failed to parse #{name}.#{name_sym} as #{field_type.inspect}. " \
          "To get the unparsed API response, use #{name}[:#{key}]."
        )
      end
    end

    # @!visibility private
    #
    # NB `required` is just a signal to the reader. We don't do runtime validation anyway.
    private_class_method def self.required(name_sym, type_info = nil, mode = :rw, api_name: nil, enum: nil)
      add_field(name_sym, api_name: api_name, type_info: enum || type_info, mode: mode)
    end

    # @!visibility private
    #
    # NB `optional` is just a signal to the reader. We don't do runtime validation anyway.
    private_class_method def self.optional(name_sym, type_info = nil, mode = :rw, api_name: nil, enum: nil)
      add_field(name_sym, api_name: api_name, type_info: enum || type_info, mode: mode)
    end

    # @!visibility private
    #
    # @param data [Hash{Symbol => Object}]
    # @return [BaseModel]
    def self.convert(data)
      new(data)
    end

    # Create a new instance of a model.
    # @param data [Hash{Symbol => Object}] Raw data to initialize the model with.
    def initialize(data = {})
      unless data.respond_to?(:to_h)
        raise ArgumentError.new("Expected a Hash, got #{data.inspect}")
      end

      @data = {}
      data.to_h.each do |field_name, value|
        next if value.nil?
        name = field_name.to_sym
        next if self.class.fields.dig(name, :mode) == :w

        @data[name] = value
      end
    end

    # Returns a Hash of the data underlying this object.
    # Keys are Symbols and values are the raw values from the response.
    # The return value indicates which values were ever set on the object -
    # i.e. there will be a key in this hash if they ever were, even if the
    # set value was nil.
    # This method is not recursive.
    # The returned value is shared by the object, so it should not be mutated.
    #
    # @return [Hash{Symbol => Object}] Data for this object.
    def to_h = @data

    alias_method :to_hash, :to_h

    # Returns the raw value associated with the given key, if found. Otherwise, nil is returned.
    # It is valid to lookup keys that are not in the API spec, for example to access
    # undocumented features.
    # This method does not parse response data into higher-level types.
    # Lookup by anything other than a Symbol is an ArgumentError.
    #
    # @param key [Symbol] Key to look up by.
    #
    # @return [Object, nil] The raw value at the given key.
    def [](key)
      unless key.instance_of?(Symbol)
        raise ArgumentError.new("Expected symbol key for lookup, got #{key.inspect}")
      end
      @data[key]
    end

    # @param keys [Array<Symbol>, nil]
    #
    # @return [Hash{Symbol => Object}]
    def deconstruct_keys(keys)
      (keys || self.class.fields.keys).filter_map do |k|
        unless self.class.fields.key?(k)
          next
        end

        [k, method(k).call]
      end
      .to_h
    end

    # @return [String]
    def inspect
      "#<#{self.class.name}:0x#{object_id.to_s(16)} #{deconstruct_keys(nil).map do |k, v|
        "#{k}=#{v.inspect}"
      end.join(' ')}>"
    end

    # @return [String]
    def to_s = @data.to_s
  end
end
