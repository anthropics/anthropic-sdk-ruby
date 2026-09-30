# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module AllowedInferenceGeo
        extend Anthropic::Internal::Type::Enum

        GLOBAL = :global
        US = :us

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
