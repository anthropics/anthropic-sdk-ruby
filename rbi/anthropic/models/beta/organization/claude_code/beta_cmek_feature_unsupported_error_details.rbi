# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaCMEKFeatureUnsupportedErrorDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedErrorDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :error_code

            # This stored settings document currently cannot be read or replaced. Contact
            # support, or, if you no longer need these settings, delete the group's settings
            # or clear the default.
            sig { params(error_code: Symbol).returns(T.attached_class) }
            def self.new(error_code: :cmek_feature_unsupported)
            end

            sig { override.returns({ error_code: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
