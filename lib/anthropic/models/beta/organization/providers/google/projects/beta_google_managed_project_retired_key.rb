# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectRetiredKey < Anthropic::Internal::Type::BaseModel
                # @!attribute expires_at
                #   When this entry is removed, in RFC 3339 format.
                #
                #   @return [Time]
                required :expires_at, Time

                # @!attribute external_key_id
                #   The ID of the retired External Key (`ekey_...`).
                #
                #   @return [String]
                required :external_key_id, String

                # @!attribute region
                #   The code of the region that retired the key.
                #
                #   @return [String]
                required :region, String

                # @!method initialize(expires_at:, external_key_id:, region:)
                #   A key that a region has retired. Keep the key usable until `expires_at`.
                #
                #   @param expires_at [Time] When this entry is removed, in RFC 3339 format.
                #
                #   @param external_key_id [String] The ID of the retired External Key (`ekey_...`).
                #
                #   @param region [String] The code of the region that retired the key.
              end
            end
          end
        end
      end
    end
  end
end
