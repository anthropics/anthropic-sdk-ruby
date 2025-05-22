# typed: strong

module Anthropic
  module Models
    BetaContainerUploadBlockParam = Beta::BetaContainerUploadBlockParam

    module Beta
      class BetaContainerUploadBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContainerUploadBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :file_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # A content block that represents a file to be uploaded to the container Files
        # uploaded via this block will be available in the container's input directory.
        sig do
          params(
            file_id: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          file_id:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :container_upload
        )
        end

        sig do
          override.returns(
            {
              file_id: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
