# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeThread < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Every new top-level message in the channel gets its own reply from Claude, in a
          # thread under it. Available where it is enabled for the channel, and only once
          # Claude has been used in the channel.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :thread)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
