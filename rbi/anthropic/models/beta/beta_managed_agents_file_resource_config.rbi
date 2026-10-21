# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsFileResourceConfig =
      Beta::BetaManagedAgentsFileResourceConfig

    module Beta
      class BetaManagedAgentsFileResourceConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsFileResourceConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of a previously uploaded file.
        sig { returns(String) }
        attr_accessor :file_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
        sig { returns(T.nilable(String)) }
        attr_accessor :mount_path

        # A file mounted into each session's container.
        sig do
          params(
            file_id: String,
            mount_path: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of a previously uploaded file.
          file_id:,
          # Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
          mount_path: nil,
          type: :file
        )
        end

        sig do
          override.returns(
            { file_id: String, type: Symbol, mount_path: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
