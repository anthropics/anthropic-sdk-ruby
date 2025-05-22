# typed: strong

module Anthropic
  module Models
    BetaContainerUploadBlock = Beta::BetaContainerUploadBlock

    module Beta
      class BetaContainerUploadBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContainerUploadBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :file_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Response model for a file uploaded to the container.
        sig { params(file_id: String, type: Symbol).returns(T.attached_class) }
        def self.new(file_id:, type: :container_upload)
        end

        sig { override.returns({ file_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
