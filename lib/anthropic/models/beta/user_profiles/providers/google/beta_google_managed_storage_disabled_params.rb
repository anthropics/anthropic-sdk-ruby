# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageDisabledParams < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :disabled]
              required :type, const: :disabled

              # @!method initialize(type: :disabled)
              #   Turns the control off and removes every region's bucket.
              #
              #   @param type [Symbol, :disabled]
            end
          end
        end
      end
    end
  end
end
