# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageDisabled < Anthropic::Internal::Type::BaseModel
              # @!attribute retired_buckets
              #   Buckets that a region has retired, earliest `expires_at` first.
              #
              #   @return [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket>]
              required :retired_buckets,
                       -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket] }

              # @!attribute type
              #
              #   @return [Symbol, :disabled]
              required :type, const: :disabled

              # @!method initialize(retired_buckets:, type: :disabled)
              #   The control is off and has no buckets.
              #
              #   @param retired_buckets [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket>] Buckets that a region has retired, earliest `expires_at` first.
              #
              #   @param type [Symbol, :disabled]
            end
          end
        end
      end
    end
  end
end
