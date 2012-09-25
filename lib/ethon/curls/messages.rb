module Ethon
  module Curls

    # This module contains available message codes.
    module Messages

      # Return message codes.
      #
      # @example Return message codes.
      #   Ethon::Curl.msg_codes
      #
      # @return [ Array ] The messages codes.
      #
      # @api private
      def msg_codes
        [:none, :done, :last]
      end
    end
  end
end
