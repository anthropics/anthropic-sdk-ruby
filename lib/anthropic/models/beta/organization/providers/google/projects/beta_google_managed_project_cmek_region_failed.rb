# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionFailed < Anthropic::Internal::Type::BaseModel
                # @!attribute effective_external_key_id
                #   The ID of the External Key that the region applies now (`ekey_...`). While a
                #   replacement key is `pending` or `failed`, this is the previous key. `null` when
                #   the region applies no key.
                #
                #   @return [String, nil]
                required :effective_external_key_id, String, nil?: true

                # @!attribute error
                #   Why the region cannot use the configured key.
                #
                #   @return [String]
                required :error, String

                # @!attribute type
                #
                #   @return [Symbol, :failed]
                required :type, const: :failed

                # @!method initialize(effective_external_key_id:, error:, type: :failed)
                #   The region stopped retrying validation before the configured key passed. To
                #   restart validation, send the region a key again. It can be the same key.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed}
                #   for more details.
                #
                #   @param effective_external_key_id [String, nil] The ID of the External Key that the region applies now (`ekey_...`). While a rep
                #
                #   @param error [String] Why the region cannot use the configured key.
                #
                #   @param type [Symbol, :failed]
              end
            end
          end
        end
      end
    end
  end
end
