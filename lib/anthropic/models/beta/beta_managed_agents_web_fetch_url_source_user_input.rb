# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether URLs in the text of user messages may be fetched.
      module BetaManagedAgentsWebFetchURLSourceUserInput
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Every URL from this source may be fetched. This is the default.
        variant :all, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll }

        # This source contributes no URLs that may be fetched.
        variant :none, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone }

        module Type
          extend Anthropic::Internal::Type::Enum

          ALL = :all
          NONE = :none

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone]
        def self.new(type:, **args)
          case type.to_sym
          when :all
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll.new(**args)
          when :none
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsWebFetchURLSourceUserInput = Beta::BetaManagedAgentsWebFetchURLSourceUserInput
  end
end
