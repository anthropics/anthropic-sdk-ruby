# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimitUpdateValue = Workspaces::WorkspaceRateLimitUpdateValue

      module Workspaces
        class WorkspaceRateLimitUpdateValue < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::WorkspaceRateLimitUpdateValue,
                Anthropic::Internal::AnyHash
              )
            end

          # Rate limiter type.
          sig do
            returns(
              Anthropic::Organization::Workspaces::WorkspaceRateLimitType::OrSymbol
            )
          end
          attr_accessor :type

          # New limit value. Set to null to clear the workspace override and fall back to
          # the organization limit.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :value

          sig do
            params(
              type:
                Anthropic::Organization::Workspaces::WorkspaceRateLimitType::OrSymbol,
              value: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Rate limiter type.
            type:,
            # New limit value. Set to null to clear the workspace override and fall back to
            # the organization limit.
            value:
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitType::OrSymbol,
                value: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
