# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::RateLimits#list
      class OrganizationRateLimit < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Identifier of this rate-limit entry. It is stable within the organization and
        #   differs between organizations; the group's own identifier is `group.id`.
        #
        #   @return [String]
        required :id, String

        # @!attribute group
        #   The rate-limit group this entry's limits apply to. Its `type` equals
        #   `group_type`.
        #
        #   @return [Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup]
        required :group, union: -> { Anthropic::Organization::OrganizationRateLimit::Group }

        # @!attribute limits
        #   The limiter values that apply to this group.
        #
        #   @return [Array<Anthropic::Models::Organization::OrganizationRateLimitValue>]
        required :limits,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Organization::OrganizationRateLimitValue] }

        # @!attribute models
        #   Model names this entry's limits apply to, including aliases. `null` when
        #   `group_type` is not `"model_group"`.
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
        #   {Anthropic::Models::Organization::OrganizationRateLimit} for more details.
        #
        #   @param id [String] Identifier of this rate-limit entry. It is stable within the organization and di
        #
        #   @param group [Anthropic::Models::Organization::OrganizationRateLimitModelGroup, Anthropic::Models::Organization::OrganizationRateLimitBatchGroup, Anthropic::Models::Organization::OrganizationRateLimitTokenCountGroup, Anthropic::Models::Organization::OrganizationRateLimitFilesGroup, Anthropic::Models::Organization::OrganizationRateLimitSkillsGroup, Anthropic::Models::Organization::OrganizationRateLimitWebSearchGroup] The rate-limit group this entry's limits apply to. Its `type` equals `group_type
        #
        #   @param limits [Array<Anthropic::Models::Organization::OrganizationRateLimitValue>] The limiter values that apply to this group.
        #
        #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when
        #   `group\_
        #
        #   @param type [Symbol, :rate_limit] Object type. Always `rate_limit` for organization rate-limit entries.

        # The rate-limit group this entry's limits apply to. Its `type` equals
        # `group_type`.
        #
        # @see Anthropic::Models::Organization::OrganizationRateLimit#group
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
          # {Anthropic::Models::Organization::OrganizationRateLimit::Group} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Organization::OrganizationRateLimit::Group::Type, String]
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

    OrganizationRateLimit = Organization::OrganizationRateLimit
  end
end
