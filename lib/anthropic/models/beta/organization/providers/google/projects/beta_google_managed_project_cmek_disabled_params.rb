# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKDisabledParams < Anthropic::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :disabled]
                required :type, const: :disabled

                # @!method initialize(type: :disabled)
                #   Turns the control off and removes every region's key.
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
