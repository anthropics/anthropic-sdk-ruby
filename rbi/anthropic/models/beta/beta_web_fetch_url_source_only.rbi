# typed: strong

module Anthropic
  module Models
    BetaWebFetchURLSourceOnly = Beta::BetaWebFetchURLSourceOnly

    module Beta
      class BetaWebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchURLSourceOnly,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Anthropic::Beta::BetaWebFetchURLSourceToolReference])
        end
        attr_accessor :tools

        sig { returns(Symbol) }
        attr_accessor :type

        # The tool filter variant under which only the named tools' results contribute.
        sig do
          params(
            tools:
              T::Array[
                Anthropic::Beta::BetaWebFetchURLSourceToolReference::OrHash
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(tools:, type: :only)
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
