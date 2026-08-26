# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#validate
        class ExternalKeyValidateResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #   Error message when status is `failure`. Null otherwise.
          #
          #   @return [String, nil]
          required :error, String, nil?: true

          # @!attribute status
          #   `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip
          #   failed or timed out; see `error`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status]
          required :status, enum: -> { Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status }

          # @!attribute type
          #
          #   @return [Symbol, :external_key_validation]
          required :type, const: :external_key_validation

          # @!method initialize(error:, status:, type: :external_key_validation)
          #   Result of a validation roundtrip against the customer's KMS.
          #
          #   HTTP 200 for both outcomes — the operation completed; `status` says whether the
          #   key works.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse} for more
          #   details.
          #
          #   @param error [String, nil] Error message when status is `failure`. Null otherwise.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status] `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip faile
          #
          #   @param type [Symbol, :external_key_validation]

          # `success` — encrypt/decrypt roundtrip succeeded. `failure` — the roundtrip
          # failed or timed out; see `error`.
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse#status
          module Status
            extend Anthropic::Internal::Type::Enum

            FAILURE = :failure
            SUCCESS = :success

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
