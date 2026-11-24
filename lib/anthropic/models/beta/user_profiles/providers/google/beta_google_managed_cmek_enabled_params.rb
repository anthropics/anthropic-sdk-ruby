# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedCMEKEnabledParams < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :enabled]
              required :type, const: :enabled

              # @!attribute external_key_ids
              #   The External Key to use in each region, keyed by region code, such as `us` or
              #   `eu`. An External Key ID (`ekey_...`) sets that region's key, `null` removes it,
              #   and a region you leave out keeps its key. While the control is on, at least one
              #   region must have a key.
              #
              #   @return [Hash{Symbol=>String, nil}, nil]
              optional :external_key_ids, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

              # @!method initialize(external_key_ids: nil, type: :enabled)
              #   Turns the control on, or changes its keys while it is on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams}
              #   for more details.
              #
              #   @param external_key_ids [Hash{Symbol=>String, nil}, nil] The External Key to use in each region, keyed by region code, such as `us` or
              #
              #   @param type [Symbol, :enabled]
            end
          end
        end
      end
    end
  end
end
