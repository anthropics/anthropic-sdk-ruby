# typed: strong

module Anthropic
  module Models
    class WebSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            T::Array[Anthropic::WebSearchResultBlockParam],
            Anthropic::WebSearchToolRequestError
          )
        )
      end
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Tool invocation directly from the model.
      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120
            )
          )
        )
      end
      attr_reader :caller_

      sig do
        params(
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120::OrHash
            )
        ).void
      end
      attr_writer :caller_

      sig do
        params(
          content:
            T.any(
              T::Array[Anthropic::WebSearchResultBlockParam::OrHash],
              Anthropic::WebSearchToolRequestError::OrHash
            ),
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120::OrHash
            ),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        tool_use_id:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Tool invocation directly from the model.
        caller_: nil,
        type: :web_search_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                T::Array[Anthropic::WebSearchResultBlockParam],
                Anthropic::WebSearchToolRequestError
              ),
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            caller_:
              T.any(
                Anthropic::DirectCaller,
                Anthropic::ServerToolCaller,
                Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120
              )
          }
        )
      end
      def to_hash
      end

      # Tool invocation directly from the model.
      module Caller
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120
            )
          end

        class CodeExecution20260120 < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::WebSearchToolResultBlockParam::Caller::CodeExecution20260120,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :tool_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(tool_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(tool_id:, type: :code_execution_20260120)
          end

          sig { override.returns({ tool_id: String, type: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebSearchToolResultBlockParam::Caller::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
