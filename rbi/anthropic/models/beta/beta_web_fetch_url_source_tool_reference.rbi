# typed: strong

module Anthropic
  module Models
    BetaWebFetchURLSourceToolReference =
      Beta::BetaWebFetchURLSourceToolReference

    module Beta
      class BetaWebFetchURLSourceToolReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchURLSourceToolReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # One entry of a tool filter's `tools`: it must name a tool declared in this
        # request's `tools[]`.
        sig { params(name: String, type: Symbol).returns(T.attached_class) }
        def self.new(name:, type: :tool_reference)
        end

        sig { override.returns({ name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
