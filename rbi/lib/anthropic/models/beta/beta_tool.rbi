# typed: strong

module Anthropic
  module Models
    BetaTool = T.type_alias { Beta::BetaTool }

    module Beta
      class BetaTool < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Beta::BetaTool::InputSchema) }
        attr_accessor :input_schema

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(Symbol)) }
        attr_accessor :type

        sig do
          params(
            input_schema: Anthropic::Models::Beta::BetaTool::InputSchema,
            name: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            description: String,
            type: T.nilable(Symbol)
          ).void
        end
        def initialize(input_schema:, name:, cache_control: nil, description: nil, type: nil); end

        sig do
          override.returns(
            {
              input_schema: Anthropic::Models::Beta::BetaTool::InputSchema,
              name: String,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
              description: String,
              type: T.nilable(Symbol)
            }
          )
        end
        def to_hash; end

        class InputSchema < Anthropic::BaseModel
          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(T.anything)) }
          attr_accessor :properties

          sig { params(properties: T.nilable(T.anything), type: Symbol).void }
          def initialize(properties: nil, type: :object); end

          sig { override.returns({type: Symbol, properties: T.nilable(T.anything)}) }
          def to_hash; end
        end

        class Type < Anthropic::Enum
          abstract!

          CUSTOM = T.let(:custom, T.nilable(Symbol))

          sig { override.returns(T::Array[Symbol]) }
          def self.values; end
        end
      end
    end
  end
end
