# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class BetaClaudeTagDeletedSlackChannel < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagDeletedSlackChannel,
                  Anthropic::Internal::AnyHash
                )
              end

            # The removed channel's identifier.
            sig { returns(String) }
            attr_accessor :id

            sig { returns(Symbol) }
            attr_accessor :type

            # Confirms that a Slack channel was removed from Claude Tag.
            sig { params(id: String, type: Symbol).returns(T.attached_class) }
            def self.new(
              # The removed channel's identifier.
              id:,
              type: :slack_channel_deleted
            )
            end

            sig { override.returns({ id: String, type: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
