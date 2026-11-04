# typed: strong

module Anthropic
  module Models
    module Organization
      class OrgAPIKeyLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The organization has reached its limit of active API keys.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :org_api_key_limit_exceeded)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
