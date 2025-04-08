# typed: strong

module Anthropic
  module Internal
    module Type
      # @api private
      #
      # Array of items of a given type.
      class ArrayOf
        include Anthropic::Internal::Type::Converter

        abstract!
        final!

        Elem = type_member(:out)

        sig(:final) do
          params(
            type_info: T.any(
              Anthropic::Internal::AnyHash,
              T.proc.returns(Anthropic::Internal::Type::Converter::Input),
              Anthropic::Internal::Type::Converter::Input
            ),
            spec: Anthropic::Internal::AnyHash
          )
            .returns(T.attached_class)
        end
        def self.[](type_info, spec = {}); end

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def ===(other); end

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def ==(other); end

        # @api private
        sig(:final) do
          override
            .params(
              value: T.any(T::Array[T.anything], T.anything),
              state: Anthropic::Internal::Type::Converter::CoerceState
            )
            .returns(T.any(T::Array[T.anything], T.anything))
        end
        def coerce(value, state:); end

        # @api private
        sig(:final) do
          override
            .params(
              value: T.any(T::Array[T.anything], T.anything),
              state: Anthropic::Internal::Type::Converter::DumpState
            )
            .returns(T.any(T::Array[T.anything], T.anything))
        end
        def dump(value, state:); end

        # @api private
        sig(:final) { returns(Elem) }
        protected def item_type; end

        # @api private
        sig(:final) { returns(T::Boolean) }
        protected def nilable?; end

        # @api private
        sig(:final) do
          params(
            type_info: T.any(
              Anthropic::Internal::AnyHash,
              T.proc.returns(Anthropic::Internal::Type::Converter::Input),
              Anthropic::Internal::Type::Converter::Input
            ),
            spec: Anthropic::Internal::AnyHash
          )
            .void
        end
        def initialize(type_info, spec = {}); end
      end
    end
  end
end
