# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageAlreadyRegisteredErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_already_registered]
          required :error_code, const: :storage_already_registered

          # @!method initialize(error_code: :storage_already_registered)
          #   The organization already has External Storage for this bucket that it has not
          #   deleted. List the organization's External Storage to find it.
          #
          #   @param error_code [Symbol, :storage_already_registered]
        end
      end
    end
  end
end
