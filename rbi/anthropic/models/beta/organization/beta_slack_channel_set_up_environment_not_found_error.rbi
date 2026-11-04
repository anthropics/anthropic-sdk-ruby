# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # `settings.environment_id` names no Environment within the organization's reach,
        # and the request had set the channel up by then. The channel stays set up with
        # every setting unset.
        class BetaSlackChannelSetUpEnvironmentNotFoundError < Anthropic::Errors::NotFoundError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
