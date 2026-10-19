# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class RateLimitUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::RateLimitUpdateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the workspace.
            sig { returns(String) }
            attr_accessor :workspace_id

            # The `id` of the organization's rate-limit entry to set overrides for.
            sig { returns(String) }
            attr_accessor :rate_limit_id

            # Limits to set or clear. Unspecified limit types are unchanged.
            sig do
              returns(
                T::Array[
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitUpdateValue
                ]
              )
            end
            attr_accessor :limits

            sig do
              params(
                workspace_id: String,
                rate_limit_id: String,
                limits:
                  T::Array[
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitUpdateValue::OrHash
                  ],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the workspace.
              workspace_id:,
              # The `id` of the organization's rate-limit entry to set overrides for.
              rate_limit_id:,
              # Limits to set or clear. Unspecified limit types are unchanged.
              limits:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  workspace_id: String,
                  rate_limit_id: String,
                  limits:
                    T::Array[
                      Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitUpdateValue
                    ],
                  request_options: Anthropic::RequestOptions
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
end
