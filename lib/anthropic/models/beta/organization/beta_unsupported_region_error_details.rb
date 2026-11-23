# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaUnsupportedRegionErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :unsupported_region]
          required :error_code, const: :unsupported_region

          # @!method initialize(error_code: :unsupported_region)
          #   `provider_config.region` is not a region where External Storage is available.
          #
          #   @param error_code [Symbol, :unsupported_region]
        end
      end
    end
  end
end
