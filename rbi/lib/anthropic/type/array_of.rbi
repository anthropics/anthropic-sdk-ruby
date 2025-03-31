# typed: strong

module Anthropic
  module Type
    # @api private
    #
    # Array of items of a given type.
    class ArrayOf
      include Anthropic::Type::Converter

      abstract!
      final!

      sig(:final) do
        params(
          type_info: T.any(
            Anthropic::Util::AnyHash,
            T.proc.returns(Anthropic::Type::Converter::Input),
            Anthropic::Type::Converter::Input
          ),
          spec: Anthropic::Util::AnyHash
        )
          .returns(T.attached_class)
      end
      def self.[](type_info, spec = {})
      end

      sig(:final) { params(other: T.anything).returns(T::Boolean) }
      def ===(other)
      end

      sig(:final) { params(other: T.anything).returns(T::Boolean) }
      def ==(other)
      end

      # @api private
      sig(:final) do
        override
          .params(value: T.any(
            T::Enumerable[T.anything],
            T.anything
          ),
                  state: Anthropic::Type::Converter::State)
          .returns(T.any(T::Array[T.anything], T.anything))
      end
      def coerce(value, state:)
      end

      # @api private
      sig(:final) do
        override
          .params(value: T.any(T::Enumerable[T.anything], T.anything))
          .returns(T.any(T::Array[T.anything], T.anything))
      end
      def dump(value)
      end

      # @api private
      sig(:final) { returns(T.anything) }
      protected def item_type
      end

      # @api private
      sig(:final) { returns(T::Boolean) }
      protected def nilable?
      end

      # @api private
      sig(:final) do
        params(
          type_info: T.any(
            Anthropic::Util::AnyHash,
            T.proc.returns(Anthropic::Type::Converter::Input),
            Anthropic::Type::Converter::Input
          ),
          spec: Anthropic::Util::AnyHash
        )
          .void
      end
      def initialize(type_info, spec = {})
      end
    end
  end
end
