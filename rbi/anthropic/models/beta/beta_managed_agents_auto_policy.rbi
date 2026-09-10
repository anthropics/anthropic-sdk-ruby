# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAutoPolicy = Beta::BetaManagedAgentsAutoPolicy

    module Beta
      class BetaManagedAgentsAutoPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAutoPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The server decides each tool call individually: it judges, from the tool, its
        # input, and the session content so far, whether the call is safe to execute or
        # high-risk, and evaluates it to allow when judged safe and to deny when judged
        # high-risk. A call the server cannot reach a judgement on evaluates to ask.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :auto)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
