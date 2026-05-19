# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401WriteInput =
      Beta::BetaManagedAgentsAgentToolset20260401WriteInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401WriteInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401WriteInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Full file contents to write.
        sig { returns(String) }
        attr_accessor :content

        # Path of the file to write.
        sig { returns(String) }
        attr_accessor :file_path

        # Input payload for the `write` tool. Writes (overwriting) the entire file
        # contents.
        sig do
          params(content: String, file_path: String).returns(T.attached_class)
        end
        def self.new(
          # Full file contents to write.
          content:,
          # Path of the file to write.
          file_path:
        )
        end

        sig { override.returns({ content: String, file_path: String }) }
        def to_hash
        end
      end
    end
  end
end
