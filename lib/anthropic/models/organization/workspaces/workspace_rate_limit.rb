# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # @see Anthropic::Resources::Organization::Workspaces::RateLimits#list
        class WorkspaceRateLimit < Anthropic::Internal::Type::BaseModel
          # @!attribute group
          #   The rate-limit group this entry's limits apply to. Its `type` equals
          #   `group_type`.
          #
          #   @return [Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup]
          required :group, union: -> { Anthropic::Organization::Workspaces::WorkspaceRateLimit::Group }

          # @!attribute limits
          #   The workspace's limiter values for this group. By default only the limiter types
          #   with a workspace-level override are listed. With `include_inherited` set to
          #   `true`, the limiter types the workspace inherits from the organization are
          #   listed too, each marked by `source`.
          #
          #   @return [Array<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitValue>]
          required :limits,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Organization::Workspaces::WorkspaceRateLimitValue] }

          # @!attribute models
          #   Model names this entry's limits apply to, including aliases. `null` when
          #   `group_type` is not `"model_group"`.
          #
          #   @return [Array<String>, nil]
          required :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute rate_limit_id
          #   The `id` of the organization's RateLimit entry this entry applies to.
          #
          #   @return [String]
          required :rate_limit_id, String

          # @!attribute type
          #   Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
          #
          #   @return [Symbol, :workspace_rate_limit]
          required :type, const: :workspace_rate_limit

          # @!attribute workspace_id
          #   ID of the Workspace this entry applies to.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(group:, limits:, models:, rate_limit_id:, workspace_id:, type: :workspace_rate_limit)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit} for more
          #   details.
          #
          #   @param group [Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup] The rate-limit group this entry's limits apply to. Its `type` equals `group_type
          #
          #   @param limits [Array<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitValue>] The workspace's limiter values for this group. By default only the limiter types
          #
          #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when
          #   `group\_
          #
          #   @param rate_limit_id [String] The `id` of the organization's RateLimit entry this entry applies to.
          #
          #   @param workspace_id [String] ID of the Workspace this entry applies to.
          #
          #   @param type [Symbol, :workspace_rate_limit] Object type. Always `workspace_rate_limit` for workspace rate-limit entries.

          # The rate-limit group this entry's limits apply to. Its `type` equals
          # `group_type`.
          #
          # @see Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit#group
          module Group
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :model_group, -> { Anthropic::Organization::OrganizationRateLimitModelGroup }

            variant :batch, -> { Anthropic::Organization::OrganizationRateLimitBatchGroup }

            variant :token_count, -> { Anthropic::Organization::OrganizationRateLimitTokenCountGroup }

            variant :files, -> { Anthropic::Organization::OrganizationRateLimitFilesGroup }

            variant :skills, -> { Anthropic::Organization::OrganizationRateLimitSkillsGroup }

            variant :web_search, -> { Anthropic::Organization::OrganizationRateLimitWebSearchGroup }

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
            #   @return [Array(Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit::Group} for
            # more details.
            #
            # @param type [Symbol, Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit::Group::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :id Opaque identifier of the rate-limit group (for example, `rlg_01VPTCmyiu5ZLsWkcxY
            #
            #   @option args [String] :display_name Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For d
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup]
            def self.new(type:, **args)
              case type.to_sym
              when :model_group
                Anthropic::Organization::OrganizationRateLimitModelGroup.new(**args)
              when :batch
                Anthropic::Organization::OrganizationRateLimitBatchGroup.new(**args)
              when :token_count
                Anthropic::Organization::OrganizationRateLimitTokenCountGroup.new(**args)
              when :files
                Anthropic::Organization::OrganizationRateLimitFilesGroup.new(**args)
              when :skills
                Anthropic::Organization::OrganizationRateLimitSkillsGroup.new(**args)
              when :web_search
                Anthropic::Organization::OrganizationRateLimitWebSearchGroup.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end

      WorkspaceRateLimit = Workspaces::WorkspaceRateLimit
    end
  end
end
