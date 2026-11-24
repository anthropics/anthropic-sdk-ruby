# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageDisabled < Anthropic::Internal::Type::BaseModel
                # @!attribute retired_buckets
                #   Buckets that a region has retired, earliest `expires_at` first.
                #
                #   @return [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket>]
                required :retired_buckets,
                         -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket] }

                # @!attribute type
                #
                #   @return [Symbol, :disabled]
                required :type, const: :disabled

                # @!method initialize(retired_buckets:, type: :disabled)
                #   The control is off and has no buckets.
                #
                #   @param retired_buckets [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket>] Buckets that a region has retired, earliest `expires_at` first.
                #
                #   @param type [Symbol, :disabled]
              end
            end
          end
        end
      end
    end
  end
end
