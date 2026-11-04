# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The request set the channel up, and `settings` was then refused. The channel
        # stays set up with every setting unset.
        class BetaSlackChannelSetUpSettingsRefusedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
