# typed: strong

module Anthropic
  module Models
    module Organization
      class ComplianceSettingUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ComplianceSettingUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
        # the object form; the response always returns the canonical object form.
        sig do
          returns(
            T.any(
              Anthropic::Organization::ComplianceSettingsStateEnabledParam,
              Anthropic::Organization::ComplianceSettingsStateDisabledParam
            )
          )
        end
        attr_accessor :state

        sig do
          params(
            state:
              T.any(
                Anthropic::Organization::ComplianceSettingsStateEnabledParam::OrHash,
                Anthropic::Organization::ComplianceSettingsStateDisabledParam::OrHash
              ),
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          # the object form; the response always returns the canonical object form.
          state:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              state:
                T.any(
                  Anthropic::Organization::ComplianceSettingsStateEnabledParam,
                  Anthropic::Organization::ComplianceSettingsStateDisabledParam
                ),
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
