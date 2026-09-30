# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimit = Workspaces::WorkspaceRateLimit

      module Workspaces
        class WorkspaceRateLimit < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::WorkspaceRateLimit,
                Anthropic::Internal::AnyHash
              )
            end

          # The rate-limit group this entry's limits apply to. Its `type` equals
          # `group_type`.
          sig do
            returns(
              Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Variants
            )
          end
          attr_accessor :group

          # The workspace's limiter values for this group. By default only the limiter types
          # with a workspace-level override are listed. With `include_inherited` set to
          # `true`, the limiter types the workspace inherits from the organization are
          # listed too, each marked by `source`.
          sig do
            returns(
              T::Array[
                Anthropic::Organization::Workspaces::WorkspaceRateLimitValue
              ]
            )
          end
          attr_accessor :limits

          # Model names this entry's limits apply to, including aliases. `null` when
          # `group_type` is not `"model_group"`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :models

          # The `id` of the organization's RateLimit entry this entry applies to.
          sig { returns(String) }
          attr_accessor :rate_limit_id

          # Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
          sig { returns(Symbol) }
          attr_accessor :type

          # ID of the Workspace this entry applies to.
          sig { returns(String) }
          attr_accessor :workspace_id

          sig do
            params(
              group:
                T.any(
                  Anthropic::Organization::OrganizationRateLimitModelGroup::OrHash,
                  Anthropic::Organization::OrganizationRateLimitBatchGroup::OrHash,
                  Anthropic::Organization::OrganizationRateLimitTokenCountGroup::OrHash,
                  Anthropic::Organization::OrganizationRateLimitFilesGroup::OrHash,
                  Anthropic::Organization::OrganizationRateLimitSkillsGroup::OrHash,
                  Anthropic::Organization::OrganizationRateLimitWebSearchGroup::OrHash
                ),
              limits:
                T::Array[
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitValue::OrHash
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
            # The workspace's limiter values for this group. By default only the limiter types
            # with a workspace-level override are listed. With `include_inherited` set to
            # `true`, the limiter types the workspace inherits from the organization are
            # listed too, each marked by `source`.
            limits:,
            # Model names this entry's limits apply to, including aliases. `null` when
            # `group_type` is not `"model_group"`.
            models:,
            # The `id` of the organization's RateLimit entry this entry applies to.
            rate_limit_id:,
            # ID of the Workspace this entry applies to.
            workspace_id:,
            # Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
            type: :workspace_rate_limit
          )
          end

          sig do
            override.returns(
              {
                group:
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Variants,
                limits:
                  T::Array[
                    Anthropic::Organization::Workspaces::WorkspaceRateLimitValue
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
                  Anthropic::Organization::OrganizationRateLimitModelGroup,
                  Anthropic::Organization::OrganizationRateLimitBatchGroup,
                  Anthropic::Organization::OrganizationRateLimitTokenCountGroup,
                  Anthropic::Organization::OrganizationRateLimitFilesGroup,
                  Anthropic::Organization::OrganizationRateLimitSkillsGroup,
                  Anthropic::Organization::OrganizationRateLimitWebSearchGroup
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MODEL_GROUP =
                T.let(
                  :model_group,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )
              BATCH =
                T.let(
                  :batch,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )
              TOKEN_COUNT =
                T.let(
                  :token_count,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )
              FILES =
                T.let(
                  :files,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )
              SKILLS =
                T.let(
                  :skills,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )
              WEB_SEARCH =
                T.let(
                  :web_search,
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Variants
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
                  Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Type::OrSymbol,
                id: String,
                display_name: String
              ).returns(
                Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group::Variants
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
        end
      end
    end
  end
end
