# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPrefix < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix,
                Anthropic::Internal::AnyHash
              )
            end

          # The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`).
          # Pass this value as `path_prefix` on a subsequent list call to drill into the
          # directory.
          sig { returns(String) }
          attr_accessor :path

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A directory marker that
          # [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list)
          # returns instead of the memories below the requested `depth`.
          #
          # It stands for one or more memories whose paths start with `path`. It isn't a
          # stored object and doesn't have an ID. Each marker counts toward the page
          # `limit`.
          sig do
            params(
              path: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`).
            # Pass this value as `path_prefix` on a subsequent list call to drill into the
            # directory.
            path:,
            type:
          )
          end

          sig do
            override.returns(
              {
                path: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_PREFIX =
              T.let(
                :memory_prefix,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
