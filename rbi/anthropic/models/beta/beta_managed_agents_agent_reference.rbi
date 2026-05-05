# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentReference = Beta::BetaManagedAgentsAgentReference

    module Beta
      class BetaManagedAgentsAgentReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentReference::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :version

        # A resolved agent reference with a concrete version.
        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentReference::Type::OrSymbol,
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(id:, type:, version:)
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentReference::Type::TaggedSymbol,
              version: Integer
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentReference::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Anthropic::Beta::BetaManagedAgentsAgentReference::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentReference::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
