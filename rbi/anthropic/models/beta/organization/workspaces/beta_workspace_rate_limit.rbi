# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimit < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit,
                  Anthropic::Internal::AnyHash
                )
              end

            # The kind of rate-limit group this entry represents. `model_group` entries apply
            # to a family of models (listed in `models`); other values apply to an API-surface
            # category and have `models` set to `null`.
            sig do
              returns(
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
              )
            end
            attr_accessor :group_type

            # The limiter values overridden for this group in this workspace. Limiter types
            # without a workspace override are omitted and inherit the organization value.
            sig do
              returns(
                T::Array[
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue
                ]
              )
            end
            attr_accessor :limits

            # Model names this entry's limits apply to, including aliases. `null` when
            # `group_type` is not `"model_group"`.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :models

            # The `id` of the RateLimit group this override applies to.
            sig { returns(String) }
            attr_accessor :rate_limit_id

            # Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the Workspace this override applies to.
            sig { returns(String) }
            attr_accessor :workspace_id

            sig do
              params(
                group_type:
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::OrSymbol,
                limits:
                  T::Array[
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue::OrHash
                  ],
                models: T.nilable(T::Array[String]),
                rate_limit_id: String,
                workspace_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The kind of rate-limit group this entry represents. `model_group` entries apply
              # to a family of models (listed in `models`); other values apply to an API-surface
              # category and have `models` set to `null`.
              group_type:,
              # The limiter values overridden for this group in this workspace. Limiter types
              # without a workspace override are omitted and inherit the organization value.
              limits:,
              # Model names this entry's limits apply to, including aliases. `null` when
              # `group_type` is not `"model_group"`.
              models:,
              # The `id` of the RateLimit group this override applies to.
              rate_limit_id:,
              # ID of the Workspace this override applies to.
              workspace_id:,
              # Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
              type: :workspace_rate_limit
            )
            end

            sig do
              override.returns(
                {
                  group_type:
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol,
                  limits:
                    T::Array[
                      Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue
                    ],
                  models: T.nilable(T::Array[String]),
                  rate_limit_id: String,
                  type: Symbol,
                  workspace_id: String
                }
              )
            end
            def to_hash
            end

            # The kind of rate-limit group this entry represents. `model_group` entries apply
            # to a family of models (listed in `models`); other values apply to an API-surface
            # category and have `models` set to `null`.
            module GroupType
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BATCH =
                T.let(
                  :batch,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )
              FILES =
                T.let(
                  :files,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )
              MODEL_GROUP =
                T.let(
                  :model_group,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )
              SKILLS =
                T.let(
                  :skills,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )
              TOKEN_COUNT =
                T.let(
                  :token_count,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )
              WEB_SEARCH =
                T.let(
                  :web_search,
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
