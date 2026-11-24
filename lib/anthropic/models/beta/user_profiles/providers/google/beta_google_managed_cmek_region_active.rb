# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedCMEKRegionActive < Anthropic::Internal::Type::BaseModel
              # @!attribute effective_external_key_id
              #   The ID of the External Key that the region applies now (`ekey_...`). While a
              #   replacement key is `pending` or `failed`, this is the previous key. `null` when
              #   the region applies no key.
              #
              #   @return [String, nil]
              required :effective_external_key_id, String, nil?: true

              # @!attribute error
              #   Why Google Cloud KMS refused the region's latest use of the key. `null` when the
              #   region has no refusal to report. A `null` does not mean that the key works.
              #
              #   @return [String, nil]
              required :error, String, nil?: true

              # @!attribute last_checked_at
              #   When the region last got a successful answer from Google Cloud KMS for the key,
              #   in RFC 3339 format. `null` when it has none to report.
              #
              #   @return [Time, nil]
              required :last_checked_at, Time, nil?: true

              # @!attribute type
              #
              #   @return [Symbol, :active]
              required :type, const: :active

              # @!attribute validated_at
              #   When the status last became `active`, in RFC 3339 format.
              #
              #   @return [Time]
              required :validated_at, Time

              # @!method initialize(effective_external_key_id:, error:, last_checked_at:, validated_at:, type: :active)
              #   The configured key passed validation, and the region applies it.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive}
              #   for more details.
              #
              #   @param effective_external_key_id [String, nil] The ID of the External Key that the region applies now (`ekey_...`). While a rep
              #
              #   @param error [String, nil] Why Google Cloud KMS refused the region's latest use of the key. `null` when the
              #
              #   @param last_checked_at [Time, nil] When the region last got a successful answer from Google Cloud KMS for the key,
              #
              #   @param validated_at [Time] When the status last became `active`, in RFC 3339 format.
              #
              #   @param type [Symbol, :active]
            end
          end
        end
      end
    end
  end
end
