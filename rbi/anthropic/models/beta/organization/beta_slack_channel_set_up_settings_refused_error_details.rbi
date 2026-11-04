# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSlackChannelSetUpSettingsRefusedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          # A stable code that names the cause.
          sig { returns(Symbol) }
          attr_accessor :error_code

          # The identifier of the channel the request set up, starting with `slch_`.
          sig { returns(String) }
          attr_accessor :slack_channel_id

          # The request set the channel up, and `settings` was then refused. The channel
          # stays set up with every setting unset.
          sig do
            params(slack_channel_id: String, error_code: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The identifier of the channel the request set up, starting with `slch_`.
            slack_channel_id:,
            # A stable code that names the cause.
            error_code: :slack_channel_set_up_settings_refused
          )
          end

          sig do
            override.returns({ error_code: Symbol, slack_channel_id: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
