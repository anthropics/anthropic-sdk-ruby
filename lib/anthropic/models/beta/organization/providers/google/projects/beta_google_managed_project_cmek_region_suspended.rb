# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKRegionSuspended < Anthropic::Internal::Type::BaseModel
                # @!attribute effective_external_key_id
                #   The ID of the External Key that the region applies now (`ekey_...`). While a
                #   replacement key is `pending` or `failed`, this is the previous key. `null` when
                #   the region applies no key.
                #
                #   @return [String, nil]
                required :effective_external_key_id, String, nil?: true

                # @!attribute type
                #
                #   @return [Symbol, :suspended]
                required :type, const: :suspended

                # @!method initialize(effective_external_key_id:, type: :suspended)
                #   Anthropic has withdrawn or paused its approval of customer-managed keys for this
                #   project, so the region does not apply the control.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended}
                #   for more details.
                #
                #   @param effective_external_key_id [String, nil] The ID of the External Key that the region applies now (`ekey_...`). While a rep
                #
                #   @param type [Symbol, :suspended]
              end
            end
          end
        end
      end
    end
  end
end
