# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RateLimits#list
        class BetaOrganizationRateLimit < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Identifier of this rate-limit entry. It is stable within the organization and
          #   differs between organizations; the group's own identifier is `group.id`. Pass it
          #   as `rate_limit_id` to set a workspace's overrides for this group.
          #
          #   @return [String]
          required :id, String

          # @!attribute group
          #   The rate-limit group this entry's limits apply to.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup]
          required :group, union: -> { Anthropic::Beta::Organization::BetaOrganizationRateLimit::Group }

          # @!attribute limits
          #   The limiter values that apply to this group.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitValue>]
          required :limits,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaOrganizationRateLimitValue] }

          # @!attribute models
          #   Model names this entry's limits apply to, including aliases. `null` when
          #   `group.type` is not `"model_group"`.
          #
          #   @return [Array<String>, nil]
          required :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute type
          #   Object type. Always `rate_limit` for organization rate-limit entries.
          #
          #   @return [Symbol, :rate_limit]
          required :type, const: :rate_limit

          # @!method initialize(id:, group:, limits:, models:, type: :rate_limit)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit} for more
          #   details.
          #
          #   @param id [String] Identifier of this rate-limit entry. It is stable within the organization and di
          #
          #   @param group [Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitModelGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitBatchGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitTokenCountGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitFilesGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitSkillsGroup, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitWebSearchGroup] The rate-limit group this entry's limits apply to.
          #
          #   @param limits [Array<Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitValue>] The limiter values that apply to this group.
          #
          #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when `group.
          #
          #   @param type [Symbol, :rate_limit] Object type. Always `rate_limit` for organization rate-limit entries.

          # The rate-limit group this entry's limits apply to.
          #
          # @see Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit#group
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
            # {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit::Group} for
            # more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit::Group::Type, String]
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
        end
      end
    end
  end
end
