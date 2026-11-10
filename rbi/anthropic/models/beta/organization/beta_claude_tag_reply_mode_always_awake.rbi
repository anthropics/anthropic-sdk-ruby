# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagReplyModeAlwaysAwake < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Like `automatic`, but Claude never pauses on its own. Available where it is
          # enabled for the channel.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :always_awake)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
