# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagGuestPolicyChannelOnly < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Claude answers with only the Bundles attached to the channel itself.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :channel_only)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
