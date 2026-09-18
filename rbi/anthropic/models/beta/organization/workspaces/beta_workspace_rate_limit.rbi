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

            # The rate-limit group this entry's limits apply to. Its `type` equals
            # `group_type`.
            sig do
              returns(
                Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Variants
              )
            end
            attr_accessor :group

            # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
            # represents. `model_group` entries apply to a family of models (listed in
            # `models`); other values apply to an API-surface category and have `models` set
            # to `null`. Always equal to `group.type`.
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

            # The `id` of the organization's RateLimit entry this override applies to.
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
                group:
                  T.any(
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup::OrHash,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup::OrHash,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup::OrHash,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup::OrHash,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup::OrHash,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup::OrHash
                  ),
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
              # The rate-limit group this entry's limits apply to. Its `type` equals
              # `group_type`.
              group:,
              # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
              # represents. `model_group` entries apply to a family of models (listed in
              # `models`); other values apply to an API-surface category and have `models` set
              # to `null`. Always equal to `group.type`.
              group_type:,
              # The limiter values overridden for this group in this workspace. Limiter types
              # without a workspace override are omitted and inherit the organization value.
              limits:,
              # Model names this entry's limits apply to, including aliases. `null` when
              # `group_type` is not `"model_group"`.
              models:,
              # The `id` of the organization's RateLimit entry this override applies to.
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
                  group:
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Variants,
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

            # The rate-limit group this entry's limits apply to. Its `type` equals
            # `group_type`.
            module Group
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup,
                    Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MODEL_GROUP =
                  T.let(
                    :model_group,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )
                BATCH =
                  T.let(
                    :batch,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )
                TOKEN_COUNT =
                  T.let(
                    :token_count,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )
                FILES =
                  T.let(
                    :files,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )
                SKILLS =
                  T.let(
                    :skills,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )
                WEB_SEARCH =
                  T.let(
                    :web_search,
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type::OrSymbol,
                  id: String,
                  display_name: String
                ).returns(
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Variants
                )
              end
              def self.new(
                type:,
                # Opaque identifier of the rate-limit group (for example,
                # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
                # changes, unlike the entry's own identifier, which differs per organization.
                id:,
                # Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For
                # display only; it may change.
                display_name: nil
              )
              end
            end

            # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
            # represents. `model_group` entries apply to a family of models (listed in
            # `models`); other values apply to an API-surface category and have `models` set
            # to `null`. Always equal to `group.type`.
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
