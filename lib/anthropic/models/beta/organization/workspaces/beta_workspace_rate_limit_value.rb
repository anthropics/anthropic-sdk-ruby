# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitValue < Anthropic::Internal::Type::BaseModel
            # @!attribute org_limit
            #   The organization-level value for the same limiter type, for reference. `null`
            #   when the organization has no limit configured for this limiter type.
            #
            #   @return [Integer, nil]
            required :org_limit, Integer, nil?: true

            # @!attribute source
            #   Where `value` comes from. `organization` values are listed only when
            #   `include_inherited` is `true`, and then `value` equals `org_limit`.
            #
            #   @return [Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource]
            required :source,
                     union: -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue::Source }

            # @!attribute type
            #   The limiter type (for example, `requests_per_minute` or
            #   `input_tokens_per_minute`).
            #
            #   @return [String]
            required :type, String

            # @!attribute value
            #   The workspace's value for this limiter type: the workspace-level override when
            #   `source.type` is `workspace`, otherwise the organization's value.
            #
            #   @return [Integer]
            required :value, Integer

            # @!method initialize(org_limit:, source:, type:, value:)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue}
            #   for more details.
            #
            #   @param org_limit [Integer, nil] The organization-level value for the same limiter type, for reference. `null` wh
            #
            #   @param source [Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource] Where `value` comes from. `organization` values are listed only when `include_in
            #
            #   @param type [String] The limiter type (for example, `requests_per_minute` or `input_tokens_per_minute
            #
            #   @param value [Integer] The workspace's value for this limiter type: the workspace-level override when `

            # Where `value` comes from. `organization` values are listed only when
            # `include_inherited` is `true`, and then `value` equals `org_limit`.
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue#source
            module Source
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :workspace,
                      -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource }

              variant :organization,
                      -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource }

              module Type
                extend Anthropic::Internal::Type::Enum

                WORKSPACE = :workspace
                ORGANIZATION = :organization

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue::Source::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource]
              def self.new(type:, **args)
                case type.to_sym
                when :workspace
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitWorkspaceSource.new(**args)
                when :organization
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitOrganizationSource.new(**args)
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
end
