# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeAutomatic < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Claude reads along and joins in when it can help, and pauses on its own in quiet
          # or busy channels.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :automatic)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
