# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonRedirect < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The API disabled the destination because the endpoint answered a delivery with a
          # 3xx status. Redirects are never followed, and one such answer disables the
          # destination at once.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :redirect)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
