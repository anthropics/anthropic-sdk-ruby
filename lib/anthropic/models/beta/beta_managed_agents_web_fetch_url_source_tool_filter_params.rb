# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Which tools' results contribute URLs that may be fetched. Accepts the string
      # "all" or "none", or an object whose type is "all", "none", "only" or "except".
      # Responses use the object form.
      module BetaManagedAgentsWebFetchURLSourceToolFilterParams
        extend Anthropic::Internal::Type::Union

        # String form of a url_sources value that has no field other than its type: "all" means {"type": "all"} and "none" means {"type": "none"}.
        variant enum: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand }

        # Which tools' results contribute URLs that may be fetched.
        variant union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter }

        # @!method self.variants
        #   @return [Array(Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept)]
      end
    end

    BetaManagedAgentsWebFetchURLSourceToolFilterParams =
      Beta::BetaManagedAgentsWebFetchURLSourceToolFilterParams
  end
end
