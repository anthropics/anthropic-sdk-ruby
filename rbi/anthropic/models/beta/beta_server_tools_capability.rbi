# typed: strong

module Anthropic
  module Models
    BetaServerToolsCapability = Beta::BetaServerToolsCapability

    module Beta
      class BetaServerToolsCapability < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaServerToolsCapability,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the model supports the code execution tool: true when the model supports
        # at least one version of the tool, not necessarily every version.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :code_execution

        sig do
          params(
            code_execution: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :code_execution

        # Whether this capability is supported by the model.
        sig { returns(T::Boolean) }
        attr_accessor :supported

        # Whether the model supports the web search tool: true when the model supports at
        # least one version of the tool, not necessarily every version.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :web_search

        sig do
          params(
            web_search: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :web_search

        # Web search and code execution tool support, with one entry per tool.
        sig do
          params(
            code_execution: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            supported: T::Boolean,
            web_search: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the model supports the code execution tool: true when the model supports
          # at least one version of the tool, not necessarily every version.
          code_execution:,
          # Whether this capability is supported by the model.
          supported:,
          # Whether the model supports the web search tool: true when the model supports at
          # least one version of the tool, not necessarily every version.
          web_search:
        )
        end

        sig do
          override.returns(
            {
              code_execution: Anthropic::Beta::BetaCapabilitySupport,
              supported: T::Boolean,
              web_search: Anthropic::Beta::BetaCapabilitySupport
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
