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

          # A rolled-up directory marker returned by
          # [List memories](/en/api/beta/memory_stores/memories/list) when `depth` is set.
          # Indicates that one or more memories exist deeper than the requested depth under
          # this prefix. This is a list-time rollup, not a stored resource; it has no ID and
          # no lifecycle. Each prefix counts toward the page `limit` and interleaves with
          # `memory` items in path order.
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
