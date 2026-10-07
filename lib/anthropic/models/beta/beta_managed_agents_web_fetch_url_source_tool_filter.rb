# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Which tools' results contribute URLs that may be fetched.
      module BetaManagedAgentsWebFetchURLSourceToolFilter
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Every URL from this source may be fetched. This is the default.
        variant :all, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll }

        # This source contributes no URLs that may be fetched.
        variant :none, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone }

        # Only the named tools' results contribute URLs that may be fetched.
        variant :only, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly }

        # Every tool's results contribute URLs that may be fetched, except the named tools' results.
        variant :except, -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept }

        module Type
          extend Anthropic::Internal::Type::Enum

          ALL = :all
          NONE = :none
          ONLY = :only
          EXCEPT = :except

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference>] :tools The tools whose results contribute. Between 1 and 128 entries, each with a diffe
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept]
        def self.new(type:, **args)
          case type.to_sym
          when :all
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll.new(**args)
          when :none
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone.new(**args)
          when :only
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly.new(**args)
          when :except
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsWebFetchURLSourceToolFilter = Beta::BetaManagedAgentsWebFetchURLSourceToolFilter
  end
end
