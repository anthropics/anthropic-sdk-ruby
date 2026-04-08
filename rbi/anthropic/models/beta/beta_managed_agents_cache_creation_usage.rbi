# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCacheCreationUsage =
      Beta::BetaManagedAgentsCacheCreationUsage

    module Beta
      class BetaManagedAgentsCacheCreationUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCacheCreationUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # Tokens used to create 1-hour ephemeral cache entries.
        sig { returns(T.nilable(Integer)) }
        attr_reader :ephemeral_1h_input_tokens

        sig { params(ephemeral_1h_input_tokens: Integer).void }
        attr_writer :ephemeral_1h_input_tokens

        # Tokens used to create 5-minute ephemeral cache entries.
        sig { returns(T.nilable(Integer)) }
        attr_reader :ephemeral_5m_input_tokens

        sig { params(ephemeral_5m_input_tokens: Integer).void }
        attr_writer :ephemeral_5m_input_tokens

        # Prompt-cache creation token usage broken down by cache lifetime.
        sig do
          params(
            ephemeral_1h_input_tokens: Integer,
            ephemeral_5m_input_tokens: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Tokens used to create 1-hour ephemeral cache entries.
          ephemeral_1h_input_tokens: nil,
          # Tokens used to create 5-minute ephemeral cache entries.
          ephemeral_5m_input_tokens: nil
        )
        end

        sig do
          override.returns(
            {
              ephemeral_1h_input_tokens: Integer,
              ephemeral_5m_input_tokens: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
