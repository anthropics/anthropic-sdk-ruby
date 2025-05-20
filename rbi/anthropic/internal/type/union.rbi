# typed: strong

module Anthropic
  module Internal
    module Type
      # @api private
      module Union
        include Anthropic::Internal::Type::Converter
        include Anthropic::Internal::Util::SorbetRuntimeSupport

        # @api private
        #
        # All of the specified variant info for this union.
        sig do
          returns(
            T::Array[
              [
                T.nilable(Symbol),
                T.proc.returns(Anthropic::Internal::Type::Converter::Input)
              ]
            ]
          )
        end
        private def known_variants
        end

        # @api private
        sig { returns(T::Array[[T.nilable(Symbol), T.anything]]) }
        protected def derefed_variants
        end

        # All of the specified variants for this union.
        sig { overridable.returns(T::Array[T.anything]) }
        def variants
        end

        # @api private
        sig { params(property: Symbol).void }
        private def discriminator(property)
        end

        # @api private
        sig do
          params(
            key:
              T.any(
                Symbol,
                Anthropic::Internal::AnyHash,
                T.proc.returns(T.anything),
                T.anything
              ),
            spec:
              T.any(
                Anthropic::Internal::AnyHash,
                T.proc.returns(T.anything),
                T.anything
              )
          ).void
        end
        private def variant(key, spec = nil)
        end

        # @api private
        sig { params(value: T.anything).returns(T.nilable(T.anything)) }
        private def resolve_variant(value)
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ===(other)
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ==(other)
        end

        sig { returns(Integer) }
        def hash
        end

        # @api private
        sig do
          override
            .params(
              value: T.anything,
              state: Anthropic::Internal::Type::Converter::CoerceState
            )
            .returns(T.anything)
        end
        def coerce(value, state:)
        end

        # @api private
        sig do
          override
            .params(
              value: T.anything,
              state: Anthropic::Internal::Type::Converter::DumpState
            )
            .returns(T.anything)
        end
        def dump(value, state:)
        end

        # @api private
        sig { returns(T.anything) }
        def to_sorbet_type
        end

        # @api private
        sig { params(depth: Integer).returns(String) }
        def inspect(depth: 0)
        end
      end
    end
  end
end
