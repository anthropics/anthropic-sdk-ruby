# frozen_string_literal: true

module Anthropic
  module Models
    # How the platform uses the API on behalf of the entity this profile represents.
    # `application`: the platform sells a product that uses the API behind the scenes,
    # and the profile represents an individual end-user of that product.
    # `passthrough`: the platform resells raw inference, and the profile identifies
    # the resold-to company.
    module UserProfileAccessType
      extend Anthropic::Internal::Type::Enum

      # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
      APPLICATION = :application

      # The user profile represents a company that the platform resells Claude access to.
      PASSTHROUGH = :passthrough

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
