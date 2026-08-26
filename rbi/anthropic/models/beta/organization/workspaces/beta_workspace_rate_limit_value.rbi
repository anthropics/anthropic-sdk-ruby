# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitValue < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue,
                  Anthropic::Internal::AnyHash
                )
              end

            # The organization-level value for the same limiter type, for reference. `null`
            # when the organization has no limit configured for this limiter type.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :org_limit

            # The limiter type (for example, `requests_per_minute` or
            # `input_tokens_per_minute`).
            sig { returns(String) }
            attr_accessor :type

            # The workspace-level override value for this limiter type.
            sig { returns(Integer) }
            attr_accessor :value

            sig do
              params(
                org_limit: T.nilable(Integer),
                type: String,
                value: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # The organization-level value for the same limiter type, for reference. `null`
              # when the organization has no limit configured for this limiter type.
              org_limit:,
              # The limiter type (for example, `requests_per_minute` or
              # `input_tokens_per_minute`).
              type:,
              # The workspace-level override value for this limiter type.
              value:
            )
            end

            sig do
              override.returns(
                { org_limit: T.nilable(Integer), type: String, value: Integer }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
