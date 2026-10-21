# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsFileResourceParams < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #   ID of a previously uploaded file.
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :file]
        required :type, const: :file

        # @!attribute mount_path
        #   Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
        #
        #   @return [String, nil]
        optional :mount_path, String, nil?: true

        # @!method initialize(file_id:, mount_path: nil, type: :file)
        #   Mount a file uploaded via the Files API into the session.
        #
        #   @param file_id [String] ID of a previously uploaded file.
        #
        #   @param mount_path [String, nil] Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
        #
        #   @param type [Symbol, :file]
      end
    end

    BetaManagedAgentsFileResourceParams = Beta::BetaManagedAgentsFileResourceParams
  end
end
