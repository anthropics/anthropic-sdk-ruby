# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Skill to load in the session container.
      module BetaManagedAgentsSkillParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An Anthropic-managed skill.
        variant :anthropic, -> { Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams }

        # A user-created custom skill.
        variant :custom, -> { Anthropic::Beta::BetaManagedAgentsCustomSkillParams }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :skill_id Identifier of the Anthropic skill (e.g., "xlsx").
        #
        #   @option args [String, nil] :version Version to pin. Defaults to latest if omitted.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkillParams, Anthropic::Models::Beta::BetaManagedAgentsCustomSkillParams]
        def self.new(type:, **args)
          case type.to_sym
          when :anthropic
            Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams.new(**args)
          when :custom
            Anthropic::Beta::BetaManagedAgentsCustomSkillParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsSkillParams = Beta::BetaManagedAgentsSkillParams
  end
end
