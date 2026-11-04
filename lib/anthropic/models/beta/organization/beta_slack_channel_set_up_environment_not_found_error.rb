# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # `settings.environment_id` names no Environment within the organization's reach,
        # and the request had set the channel up by then. The channel stays set up with
        # every setting unset.
        class BetaSlackChannelSetUpEnvironmentNotFoundError < Anthropic::Errors::NotFoundError
          # @!method error_code
          #   @return [Symbol, :slack_channel_set_up_environment_not_found]

          # @return [Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
