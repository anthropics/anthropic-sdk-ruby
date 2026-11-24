# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedCMEKDisabled < Anthropic::Internal::Type::BaseModel
              # @!attribute retired_keys
              #   Keys that a region has retired, earliest `expires_at` first.
              #
              #   @return [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey>]
              required :retired_keys,
                       -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey] }

              # @!attribute type
              #
              #   @return [Symbol, :disabled]
              required :type, const: :disabled

              # @!method initialize(retired_keys:, type: :disabled)
              #   The control is off and has no keys.
              #
              #   @param retired_keys [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey>] Keys that a region has retired, earliest `expires_at` first.
              #
              #   @param type [Symbol, :disabled]
            end
          end
        end
      end
    end
  end
end
