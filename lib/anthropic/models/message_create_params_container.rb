# frozen_string_literal: true

module Anthropic
  module Models
    # Container identifier for reuse across requests.
    module MessageCreateParamsContainer
      extend Anthropic::Internal::Type::Union

      # Container parameters with skills to be loaded.
      variant -> { Anthropic::ContainerParams }

      variant String

      # @!method self.variants
      #   @return [Array(Anthropic::Models::ContainerParams, String)]
    end
  end
end
