# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeMentionOnly < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Claude replies only when it is @-mentioned.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :mention_only)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
