# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagGuestPolicyAllow < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Claude answers in the channel.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :allow)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
