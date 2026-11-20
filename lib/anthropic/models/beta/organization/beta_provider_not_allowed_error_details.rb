# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaProviderNotAllowedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :provider_not_allowed]
          required :error_code, const: :provider_not_allowed

          # @!method initialize(error_code: :provider_not_allowed)
          #   The request can't use External Storage on this cloud provider. The error's
          #   message says why.
          #
          #   @param error_code [Symbol, :provider_not_allowed]
        end
      end
    end
  end
end
