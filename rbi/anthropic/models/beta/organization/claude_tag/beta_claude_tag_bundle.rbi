# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class BetaClaudeTagBundle < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle,
                  Anthropic::Internal::AnyHash
                )
              end

            # The Bundle's identifier. Starts with `capp_`.
            sig { returns(String) }
            attr_accessor :id

            # Time the Bundle was created.
            sig { returns(Time) }
            attr_accessor :created_at

            # What the Bundle is for. Null when it has none. Read-only.
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # The Bundle's name. Always set. Read-only.
            sig { returns(String) }
            attr_accessor :display_name

            sig { returns(Symbol) }
            attr_accessor :type

            # Time of the last change to the Bundle.
            sig { returns(Time) }
            attr_accessor :updated_at

            # A named set of access that Claude can use in a Slack channel or a Slack
            # workspace: connectors, repositories and credentials. Created and edited in
            # claude.ai.
            sig do
              params(
                id: String,
                created_at: Time,
                description: T.nilable(String),
                display_name: String,
                updated_at: Time,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The Bundle's identifier. Starts with `capp_`.
              id:,
              # Time the Bundle was created.
              created_at:,
              # What the Bundle is for. Null when it has none. Read-only.
              description:,
              # The Bundle's name. Always set. Read-only.
              display_name:,
              # Time of the last change to the Bundle.
              updated_at:,
              type: :bundle
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  description: T.nilable(String),
                  display_name: String,
                  type: Symbol,
                  updated_at: Time
                }
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
