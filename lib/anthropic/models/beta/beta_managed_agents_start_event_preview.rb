# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaManagedAgentsStartEventPreview
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :"agent.message", -> { Anthropic::Beta::BetaManagedAgentsAgentMessagePreview }

        variant :"agent.thinking", -> { Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsStartEventPreview} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :id The id the buffered agent.message will carry if it is emitted. Matches the event
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview]
        def self.new(type:, **args)
          case type.to_sym
          when :"agent.message"
            Anthropic::Beta::BetaManagedAgentsAgentMessagePreview.new(**args)
          when :"agent.thinking"
            Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsStartEventPreview = Beta::BetaManagedAgentsStartEventPreview
  end
end
