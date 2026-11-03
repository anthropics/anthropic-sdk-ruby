# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspaceAPIKeyLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The workspace has reached its limit of active API keys.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :workspace_api_key_limit_exceeded)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
