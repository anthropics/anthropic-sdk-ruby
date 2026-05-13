# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultCitations < Anthropic::Internal::Type::BaseModel
          # @!attribute enabled
          #   Whether citations are enabled for this search result.
          #
          #   @return [Boolean]
          required :enabled, Anthropic::Internal::Type::Boolean

          # @!method initialize(enabled:)
          #   Citation settings for a search result.
          #
          #   @param enabled [Boolean] Whether citations are enabled for this search result.
        end
      end
    end
  end
end
