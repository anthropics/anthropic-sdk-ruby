# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKDisabled < Anthropic::Internal::Type::BaseModel
                # @!attribute retired_keys
                #   Keys that a region has retired, earliest `expires_at` first.
                #
                #   @return [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey>]
                required :retired_keys,
                         -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey] }

                # @!attribute type
                #
                #   @return [Symbol, :disabled]
                required :type, const: :disabled

                # @!method initialize(retired_keys:, type: :disabled)
                #   The control is off and has no keys.
                #
                #   @param retired_keys [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey>] Keys that a region has retired, earliest `expires_at` first.
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
