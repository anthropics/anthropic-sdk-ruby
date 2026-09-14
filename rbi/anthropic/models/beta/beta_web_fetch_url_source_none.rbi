# typed: strong

module Anthropic
  module Models
    BetaWebFetchURLSourceNone = Beta::BetaWebFetchURLSourceNone

    module Beta
      class BetaWebFetchURLSourceNone < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchURLSourceNone,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The `url_sources` variant under which a source contributes nothing: no result of
        # the tool filter's source, or no user input.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :none)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
