# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolBash20241022 < Anthropic::BaseModel
        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        sig { returns(Symbol) }
        def name
        end

        sig { params(_: Symbol).returns(Symbol) }
        def name=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

        sig do
          params(
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            name: Symbol,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(cache_control: nil, name: :bash, type: :bash_20241022)
        end

        sig do
          override
            .returns(
              {name: Symbol, type: Symbol, cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)}
            )
        end
        def to_hash
        end
      end
    end

    BetaToolBash20241022 = Beta::BetaToolBash20241022
  end
end
