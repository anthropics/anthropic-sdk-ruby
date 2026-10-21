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

          sig { returns(Symbol) }
          attr_accessor :type

          # A directory marker that
          # [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list)
          # returns instead of the memories below the requested `depth`.
          #
          # It stands for one or more memories whose paths start with `path`. It isn't a
          # stored object and doesn't have an ID. Each marker counts toward the page
          # `limit`.
          sig { params(path: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`).
            # Pass this value as `path_prefix` on a subsequent list call to drill into the
            # directory.
            path:,
            type: :memory_prefix
          )
          end

          sig { override.returns({ path: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
