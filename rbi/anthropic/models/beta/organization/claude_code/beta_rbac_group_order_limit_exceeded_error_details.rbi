# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaRBACGroupOrderLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupOrderLimitExceededErrorDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :error_code

            # The RBAC Group order already has the most groups allowed. Delete another group's
            # settings first.
            sig { params(error_code: Symbol).returns(T.attached_class) }
            def self.new(error_code: :rbac_group_order_limit_exceeded)
            end

            sig { override.returns({ error_code: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
