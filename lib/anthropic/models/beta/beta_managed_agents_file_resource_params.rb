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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type }

        # @!attribute mount_path
        #   Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.
        #
        #   @return [String, nil]
        optional :mount_path, String, nil?: true

        # @!method initialize(file_id:, type:, mount_path: nil)
        #   Mount a file uploaded via the Files API into the session.
        #
        #   @param file_id [String] ID of a previously uploaded file.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams::Type]
        #
        #   @param mount_path [String, nil] Mount path in the container. Defaults to `/mnt/session/uploads/<file_id>`.

        # @see Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          FILE = :file

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsFileResourceParams = Beta::BetaManagedAgentsFileResourceParams
  end
end
