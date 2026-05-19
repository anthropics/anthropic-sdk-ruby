# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401EditInput =
      Beta::BetaManagedAgentsAgentToolset20260401EditInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401EditInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401EditInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Path of the file to edit.
        sig { returns(String) }
        attr_accessor :file_path

        # Replacement text.
        sig { returns(String) }
        attr_accessor :new_string

        # Substring to find and replace.
        sig { returns(String) }
        attr_accessor :old_string

        # When true, replace every occurrence of `old_string` instead of requiring a
        # unique match.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :replace_all

        sig { params(replace_all: T::Boolean).void }
        attr_writer :replace_all

        # Input payload for the `edit` tool. Performs a string replacement in the named
        # file; by default `old_string` must occur exactly once.
        sig do
          params(
            file_path: String,
            new_string: String,
            old_string: String,
            replace_all: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Path of the file to edit.
          file_path:,
          # Replacement text.
          new_string:,
          # Substring to find and replace.
          old_string:,
          # When true, replace every occurrence of `old_string` instead of requiring a
          # unique match.
          replace_all: nil
        )
        end

        sig do
          override.returns(
            {
              file_path: String,
              new_string: String,
              old_string: String,
              replace_all: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
