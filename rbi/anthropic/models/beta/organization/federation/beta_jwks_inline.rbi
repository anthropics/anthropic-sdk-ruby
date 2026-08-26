# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSInline < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaJWKSInline,
                  Anthropic::Internal::AnyHash
                )
              end

            # Inline JWK objects.
            sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
            attr_accessor :keys

            sig { returns(Symbol) }
            attr_accessor :type

            # JWKS supplied directly; no network fetch.
            sig do
              params(
                keys: T::Array[T::Hash[Symbol, T.anything]],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Inline JWK objects.
              keys:,
              type: :inline
            )
            end

            sig do
              override.returns(
                { keys: T::Array[T::Hash[Symbol, T.anything]], type: Symbol }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
