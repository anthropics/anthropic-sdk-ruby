# typed: strong

module Anthropic
  module Models
    BetaEnvironmentArchivedErrorDetails =
      Beta::BetaEnvironmentArchivedErrorDetails

    module Beta
      class BetaEnvironmentArchivedErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentArchivedErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The environment is archived, so it cannot be updated.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :environment_archived)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
