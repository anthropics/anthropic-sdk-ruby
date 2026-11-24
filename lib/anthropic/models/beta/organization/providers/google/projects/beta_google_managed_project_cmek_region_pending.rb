# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionPending < Anthropic::Internal::Type::BaseModel
                # @!attribute effective_external_key_id
                #   The ID of the External Key that the region applies now (`ekey_...`). While a
                #   replacement key is `pending` or `failed`, this is the previous key. `null` when
                #   the region applies no key.
                #
                #   @return [String, nil]
                required :effective_external_key_id, String, nil?: true

                # @!attribute error
                #   Why the latest validation attempt failed. `null` when no attempt has failed.
                #
                #   @return [String, nil]
                required :error, String, nil?: true

                # @!attribute type
                #
                #   @return [Symbol, :pending]
                required :type, const: :pending

                # @!method initialize(effective_external_key_id:, error:, type: :pending)
                #   The region is validating the configured key, or the key has passed validation
                #   and the region has not started to apply it.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending}
                #   for more details.
                #
                #   @param effective_external_key_id [String, nil] The ID of the External Key that the region applies now (`ekey_...`). While a rep
                #
                #   @param error [String, nil] Why the latest validation attempt failed. `null` when no attempt has failed.
                #
                #   @param type [Symbol, :pending]
              end
            end
          end
        end
      end
    end
  end
end
