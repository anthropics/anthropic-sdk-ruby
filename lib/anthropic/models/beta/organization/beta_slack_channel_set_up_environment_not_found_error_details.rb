# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :slack_channel_set_up_environment_not_found]
          required :error_code, const: :slack_channel_set_up_environment_not_found

          # @!attribute slack_channel_id
          #   The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @return [String]
          required :slack_channel_id, String

          # @!method initialize(slack_channel_id:, error_code: :slack_channel_set_up_environment_not_found)
          #   `settings.environment_id` names no Environment within the organization's reach,
          #   and the request had set the channel up by then. The channel stays set up with
          #   every setting unset.
          #
          #   @param slack_channel_id [String] The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @param error_code [Symbol, :slack_channel_set_up_environment_not_found]
        end
      end
    end
  end
end
