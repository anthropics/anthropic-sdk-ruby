# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCustomToolParams = Beta::BetaManagedAgentsCustomToolParams

    module Beta
      class BetaManagedAgentsCustomToolParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCustomToolParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Description of what the tool does, shown to the agent to help it decide when to
        # use the tool. 1-1024 characters.
        sig { returns(String) }
        attr_accessor :description

        # JSON Schema for custom tool input parameters.
        sig { returns(Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema) }
        attr_reader :input_schema

        sig do
          params(
            input_schema:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash
          ).void
        end
        attr_writer :input_schema

        # Unique name for the tool. 1-128 characters; letters, digits, underscores, and
        # hyphens.
        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # A custom tool that is executed by the API client rather than the agent. When the
        # agent calls this tool, an `agent.custom_tool_use` event is emitted and the
        # session goes idle, waiting for the client to provide the result via a
        # `user.custom_tool_result` event.
        sig do
          params(
            description: String,
            input_schema:
              Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::OrHash,
            name: String,
            type:
              Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Description of what the tool does, shown to the agent to help it decide when to
          # use the tool. 1-1024 characters.
          description:,
          # JSON Schema for custom tool input parameters.
          input_schema:,
          # Unique name for the tool. 1-128 characters; letters, digits, underscores, and
          # hyphens.
          name:,
          type:
        )
        end

        sig do
          override.returns(
            {
              description: String,
              input_schema:
                Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema,
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(
              :custom,
              Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type::TaggedSymbol
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
