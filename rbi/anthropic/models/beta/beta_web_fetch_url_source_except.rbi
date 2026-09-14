# typed: strong

module Anthropic
  module Models
    BetaWebFetchURLSourceExcept = Beta::BetaWebFetchURLSourceExcept

    module Beta
      class BetaWebFetchURLSourceExcept < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchURLSourceExcept,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Anthropic::Beta::BetaWebFetchURLSourceToolReference])
        end
        attr_accessor :tools

        sig { returns(Symbol) }
        attr_accessor :type

        # The tool filter variant under which every result but the named tools'
        # contributes.
        sig do
          params(
            tools:
              T::Array[
                Anthropic::Beta::BetaWebFetchURLSourceToolReference::OrHash
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(tools:, type: :except)
        end

        sig do
          override.returns(
            {
              tools:
                T::Array[Anthropic::Beta::BetaWebFetchURLSourceToolReference],
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
