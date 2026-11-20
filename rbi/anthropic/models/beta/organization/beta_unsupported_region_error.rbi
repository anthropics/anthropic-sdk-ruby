# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # `provider_config.region` is not a region where External Storage is available.
        class BetaUnsupportedRegionError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaUnsupportedRegionErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
