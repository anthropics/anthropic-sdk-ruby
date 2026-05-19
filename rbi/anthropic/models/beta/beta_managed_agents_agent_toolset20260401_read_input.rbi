# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401ReadInput =
      Beta::BetaManagedAgentsAgentToolset20260401ReadInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401ReadInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401ReadInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Path of the file to read.
        sig { returns(String) }
        attr_accessor :file_path

        # Optional `[start_line, end_line]` 1-indexed inclusive range. When omitted the
        # entire file is returned. `end_line` of 0 or negative means "to end of file".
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_reader :view_range

        sig { params(view_range: T::Array[Integer]).void }
        attr_writer :view_range

        # Input payload for the `read` tool. Reads file contents relative to the runner's
        # working directory (or absolute when the runner permits).
        sig do
          params(file_path: String, view_range: T::Array[Integer]).returns(
            T.attached_class
          )
        end
        def self.new(
          # Path of the file to read.
          file_path:,
          # Optional `[start_line, end_line]` 1-indexed inclusive range. When omitted the
          # entire file is returned. `end_line` of 0 or negative means "to end of file".
          view_range: nil
        )
        end

        sig do
          override.returns({ file_path: String, view_range: T::Array[Integer] })
        end
        def to_hash
        end
      end
    end
  end
end
