# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::RateLimits#list
          class BetaWorkspaceRateLimit < Anthropic::Internal::Type::BaseModel
            # @!attribute group
            #   The rate-limit group this entry's limits apply to. Its `type` equals
            #   `group_type`.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup]
            required :group, union: -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group }

            # @!attribute group_type
            #   @deprecated Use `group.type` instead. `group_type` is still returned and always equals
            #   `group.type`.
            #
            #   Deprecated: use `group.type` instead. The kind of rate-limit group this entry
            #   represents. `model_group` entries apply to a family of models (listed in
            #   `models`); other values apply to an API-surface category and have `models` set
            #   to `null`. Always equal to `group.type`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType]
            required :group_type,
                     enum: -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType }

            # @!attribute limits
            #   The limiter values overridden for this group in this workspace. Limiter types
            #   without a workspace override are omitted and inherit the organization value.
            #
            #   @return [Array<Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue>]
            required :limits,
                     -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue] }

            # @!attribute models
            #   Model names this entry's limits apply to, including aliases. `null` when
            #   `group_type` is not `"model_group"`.
            #
            #   @return [Array<String>, nil]
            required :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute rate_limit_id
            #   The `id` of the organization's RateLimit entry this override applies to.
            #
            #   @return [String]
            required :rate_limit_id, String

            # @!attribute type
            #   Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
            #
            #   @return [Symbol, :workspace_rate_limit]
            required :type, const: :workspace_rate_limit

            # @!attribute workspace_id
            #   ID of the Workspace this override applies to.
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(group:, group_type:, limits:, models:, rate_limit_id:, workspace_id:, type: :workspace_rate_limit)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit} for
            #   more details.
            #
            #   @param group [Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup] The rate-limit group this entry's limits apply to. Its `type` equals `group_type
            #
            #   @param group_type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType] Deprecated: use `group.type` instead. The kind of rate-limit group this entry re
            #
            #   @param limits [Array<Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue>] The limiter values overridden for this group in this workspace. Limiter types wi
            #
            #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when
            #   `group\_
            #
            #   @param rate_limit_id [String] The `id` of the organization's RateLimit entry this override applies to.
            #
            #   @param workspace_id [String] ID of the Workspace this override applies to.
            #
            #   @param type [Symbol, :workspace_rate_limit] Object type. Always `workspace_rate_limit` for workspace rate-limit entries.

            # The rate-limit group this entry's limits apply to. Its `type` equals
            # `group_type`.
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit#group
            module Group
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :model_group, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup }

              variant :batch, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup }

              variant :token_count, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup }

              variant :files, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup }

              variant :skills, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup }

              variant :web_search, -> { Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup }

              module Type
                extend Anthropic::Internal::Type::Enum

                MODEL_GROUP = :model_group
                BATCH = :batch
                TOKEN_COUNT = :token_count
                FILES = :files
                SKILLS = :skills
                WEB_SEARCH = :web_search

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::Group::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String] :id Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
              #
              #   @option args [String] :display_name Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For d
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup]
              def self.new(type:, **args)
                case type.to_sym
                when :model_group
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup.new(**args)
                when :batch
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitBatchGroup.new(**args)
                when :token_count
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup.new(**args)
                when :files
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitFilesGroup.new(**args)
                when :skills
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitSkillsGroup.new(**args)
                when :web_search
                  Anthropic::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end

            # @deprecated Use `group.type` instead. `group_type` is still returned and always equals
            # `group.type`.
            #
            # Deprecated: use `group.type` instead. The kind of rate-limit group this entry
            # represents. `model_group` entries apply to a family of models (listed in
            # `models`); other values apply to an API-surface category and have `models` set
            # to `null`. Always equal to `group.type`.
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit#group_type
            module GroupType
              extend Anthropic::Internal::Type::Enum

              BATCH = :batch
              FILES = :files
              MODEL_GROUP = :model_group
              SKILLS = :skills
              TOKEN_COUNT = :token_count
              WEB_SEARCH = :web_search

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
