# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentParams = Beta::BetaManagedAgentsAgentParams

    module Beta
      class BetaManagedAgentsAgentParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The `agent` ID.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsAgentParams::Type::OrSymbol)
        end
        attr_accessor :type

        # The specific `agent` version to use. Omit to use the latest version. Must be at
        # least 1 if specified.
        sig { returns(T.nilable(Integer)) }
        attr_reader :version

        sig { params(version: Integer).void }
        attr_writer :version

        # Specification for an Agent. Provide a specific `version` or use the short-form
        # `agent="agent_id"` for the most recent version
        sig do
          params(
            id: String,
            type: Anthropic::Beta::BetaManagedAgentsAgentParams::Type::OrSymbol,
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The `agent` ID.
          id:,
          type:,
          # The specific `agent` version to use. Omit to use the latest version. Must be at
          # least 1 if specified.
          version: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentParams::Type::OrSymbol,
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
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsAgentParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT =
            T.let(
              :agent,
              Anthropic::Beta::BetaManagedAgentsAgentParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentParams::Type::TaggedSymbol
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
