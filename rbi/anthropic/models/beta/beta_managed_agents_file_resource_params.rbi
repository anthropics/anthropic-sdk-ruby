# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsFileResourceParams =
      Beta::BetaManagedAgentsFileResourceParams

    module Beta
      class BetaManagedAgentsFileResourceParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsFileResourceParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of a previously uploaded file.
        sig { returns(String) }
        attr_accessor :file_id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
        sig { returns(T.nilable(String)) }
        attr_accessor :mount_path

        # Mount a file uploaded via the Files API into the session.
        sig do
          params(
            file_id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::OrSymbol,
            mount_path: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of a previously uploaded file.
          file_id:,
          type:,
          # Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
          mount_path: nil
        )
        end

        sig do
          override.returns(
            {
              file_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::OrSymbol,
              mount_path: T.nilable(String)
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
                Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FILE =
            T.let(
              :file,
              Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::TaggedSymbol
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
