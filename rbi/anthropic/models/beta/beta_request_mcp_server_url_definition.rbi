# typed: strong

module Anthropic
  module Models
    BetaRequestMCPServerURLDefinition = Beta::BetaRequestMCPServerURLDefinition

    module Beta
      class BetaRequestMCPServerURLDefinition < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRequestMCPServerURLDefinition,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :url

        sig { returns(T.nilable(String)) }
        attr_accessor :authorization_token

        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaRequestMCPServerToolConfiguration)
          )
        end
        attr_reader :tool_configuration

        sig do
          params(
            tool_configuration:
              T.nilable(
                Anthropic::Beta::BetaRequestMCPServerToolConfiguration::OrHash
              )
          ).void
        end
        attr_writer :tool_configuration

        sig do
          params(
            name: String,
            url: String,
            authorization_token: T.nilable(String),
            tool_configuration:
              T.nilable(
                Anthropic::Beta::BetaRequestMCPServerToolConfiguration::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          name:,
          url:,
          authorization_token: nil,
          tool_configuration: nil,
          type: :url
        )
        end

        sig do
          override.returns(
            {
              name: String,
              type: Symbol,
              url: String,
              authorization_token: T.nilable(String),
              tool_configuration:
                T.nilable(
                  Anthropic::Beta::BetaRequestMCPServerToolConfiguration
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
