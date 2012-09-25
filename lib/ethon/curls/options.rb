module Ethon
  module Curls

    # This module contains logic for setting options on
    # easy or multi interface.
    module Options

      # Sets appropriate option for easy, depending on value type.
      #
      # @api private
      def set_option(option, value, handle, type = :easy)
        return unless value

        name = "#{type}_setopt_#{value.class.to_s.downcase.delete(':')}"
        send(name, handle, option, value)
      end

      # :nodoc:
      #
      # @api private
      def option_types
        {
          :long => 0,
          :object_point => 10000,
          :function_point => 20000,
          :off_t => 30000
        }
      end

      # Curl multi options, refer
      # https://github.com/bagder/curl/blob/master/include/curl/multi.h
      #
      # @api private
      def multi_options
        {
          :socketfunction  =>  option_types[:function_point]  +  1,
          :socketdata      =>  option_types[:object_point]    +  2,
          :pipelining      =>  option_types[:long]            +  3,
          :timerfunction   =>  option_types[:function_point]  +  4,
          :timerdata       =>  option_types[:object_point]    +  5,
          :maxconnects     =>  option_types[:long]            +  6
        }
      end

      # Curl easy options, refer
      # https://github.com/bagder/curl/blob/master/include/curl/curl.h
      #
      # @api private
      def easy_options
        {

          :file                        =>  option_types[:object_point]    +  1,
          :writedata                   =>  option_types[:object_point]    +  1,
          :url                         =>  option_types[:object_point]    +  2,
          :port                        =>  option_types[:long]            +  3,
          :proxy                       =>  option_types[:object_point]    +  4,
          :userpwd                     =>  option_types[:object_point]    +  5,
          :proxyuserpwd                =>  option_types[:object_point]    +  6,
          :range                       =>  option_types[:object_point]    +  7,
          :infile                      =>  option_types[:object_point]    +  9,
          :readdata                    =>  option_types[:object_point]    +  9,
          :errorbuffer                 =>  option_types[:object_point]    +  10,
          :writefunction               =>  option_types[:function_point]  +  11,
          :readfunction                =>  option_types[:function_point]  +  12,
          :timeout                     =>  option_types[:long]            +  13,
          :infilesize                  =>  option_types[:long]            +  14,
          :postfields                  =>  option_types[:object_point]    +  15,
          :referer                     =>  option_types[:object_point]    +  16,
          :ftpport                     =>  option_types[:object_point]    +  17,
          :useragent                   =>  option_types[:object_point]    +  18,
          :low_speed_time              =>  option_types[:long]            +  20,
          :resume_from                 =>  option_types[:long]            +  21,
          :cookie                      =>  option_types[:object_point]    +  22,
          :httpheader                  =>  option_types[:object_point]    +  23,
          :httppost                    =>  option_types[:object_point]    +  24,
          :sslcert                     =>  option_types[:object_point]    +  25,
          :sslcertpasswd               =>  option_types[:object_point]    +  26,
          :sslkeypasswd                =>  option_types[:object_point]    +  26,
          :crlf                        =>  option_types[:long]            +  27,
          :quote                       =>  option_types[:object_point]    +  28,
          :writeheader                 =>  option_types[:object_point]    +  29,
          :headerdata                  =>  option_types[:object_point]    +  29,
          :cookiefile                  =>  option_types[:object_point]    +  31,
          :sslversion                  =>  option_types[:long]            +  32,
          :timecondition               =>  option_types[:long]            +  33,
          :timevalue                   =>  option_types[:long]            +  34,
          :customrequest               =>  option_types[:object_point]    +  36,
          :stderr                      =>  option_types[:object_point]    +  37,
          :postquote                   =>  option_types[:object_point]    +  39,
          :writeinfo                   =>  option_types[:object_point]    +  40,
          :verbose                     =>  option_types[:long]            +  41,
          :header                      =>  option_types[:long]            +  42,
          :noprogress                  =>  option_types[:long]            +  43,
          :nobody                      =>  option_types[:long]            +  44,
          :failonerror                 =>  option_types[:long]            +  45,
          :upload                      =>  option_types[:long]            +  46,
          :post                        =>  option_types[:long]            +  47,
          :ftplistonly                 =>  option_types[:long]            +  48,
          :ftpappend                   =>  option_types[:long]            +  50,
          :netrc                       =>  option_types[:long]            +  51,
          :followlocation              =>  option_types[:long]            +  52,
          :transfertext                =>  option_types[:long]            +  53,
          :put                         =>  option_types[:long]            +  54,
          :progressfunction            =>  option_types[:function_point]  +  56,
          :progressdata                =>  option_types[:object_point]    +  57,
          :autoreferer                 =>  option_types[:long]            +  58,
          :proxyport                   =>  option_types[:long]            +  59,
          :postfieldsize               =>  option_types[:long]            +  60,
          :httpproxytunnel             =>  option_types[:long]            +  61,
          :interface                   =>  option_types[:object_point]    +  62,
          :ssl_verifypeer              =>  option_types[:long]            +  64,
          :cainfo                      =>  option_types[:object_point]    +  65,
          :maxredirs                   =>  option_types[:long]            +  68,
          :filetime                    =>  option_types[:long]            +  69,
          :telnetoptions               =>  option_types[:object_point]    +  70,
          :maxconnects                 =>  option_types[:long]            +  71,
          :closepolicy                 =>  option_types[:long]            +  72,
          :fresh_connect               =>  option_types[:long]            +  74,
          :forbid_reuse                =>  option_types[:long]            +  75,
          :random_file                 =>  option_types[:object_point]    +  76,
          :egdsocket                   =>  option_types[:object_point]    +  77,
          :connecttimeout              =>  option_types[:long]            +  78,
          :headerfunction              =>  option_types[:function_point]  +  79,
          :httpget                     =>  option_types[:long]            +  80,
          :ssl_verifyhost              =>  option_types[:long]            +  81,
          :cookiejar                   =>  option_types[:object_point]    +  82,
          :ssl_cipher_list             =>  option_types[:object_point]    +  83,
          :http_version                =>  option_types[:long]            +  84,
          :ftp_use_epsv                =>  option_types[:long]            +  85,
          :sslcerttype                 =>  option_types[:object_point]    +  86,
          :sslkey                      =>  option_types[:object_point]    +  87,
          :sslkeytype                  =>  option_types[:object_point]    +  88,
          :sslengine                   =>  option_types[:object_point]    +  89,
          :sslengine_default           =>  option_types[:long]            +  90,
          :dns_use_global_cache        =>  option_types[:long]            +  91,
          :dns_cache_timeout           =>  option_types[:long]            +  92,
          :prequote                    =>  option_types[:object_point]    +  93,
          :debugfunction               =>  option_types[:function_point]  +  94,
          :debugdata                   =>  option_types[:object_point]    +  95,
          :cookiesession               =>  option_types[:long]            +  96,
          :capath                      =>  option_types[:object_point]    +  97,
          :buffersize                  =>  option_types[:long]            +  98,
          :nosignal                    =>  option_types[:long]            +  99,
          :share                       =>  option_types[:object_point]    +  100,
          :proxytype                   =>  option_types[:long]            +  101,
          :encoding                    =>  option_types[:object_point]    +  102,
          :private                     =>  option_types[:object_point]    +  103,
          :unrestricted_auth           =>  option_types[:long]            +  105,
          :ftp_use_eprt                =>  option_types[:long]            +  106,
          :httpauth                    =>  option_types[:long]            +  107,
          :ssl_ctx_function            =>  option_types[:function_point]  +  108,
          :ssl_ctx_data                =>  option_types[:object_point]    +  109,
          :ftp_create_missing_dirs     =>  option_types[:long]            +  110,
          :proxyauth                   =>  option_types[:long]            +  111,
          :ipresolve                   =>  option_types[:long]            +  113,
          :maxfilesize                 =>  option_types[:long]            +  114,
          :infilesize_large            =>  option_types[:off_t]           +  115,
          :resume_from_large           =>  option_types[:off_t]           +  116,
          :maxfilesize_large           =>  option_types[:off_t]           +  117,
          :netrc_file                  =>  option_types[:object_point]    +  118,
          :ftp_ssl                     =>  option_types[:long]            +  119,
          :postfieldsize_large         =>  option_types[:off_t]           +  120,
          :tcp_nodelay                 =>  option_types[:long]            +  121,
          :ftpsslauth                  =>  option_types[:long]            +  129,
          :ioctlfunction               =>  option_types[:function_point]  +  130,
          :ioctldata                   =>  option_types[:object_point]    +  131,
          :ftp_account                 =>  option_types[:object_point]    +  134,
          :cookielist                  =>  option_types[:object_point]    +  135,
          :ignore_content_length       =>  option_types[:long]            +  136,
          :ftp_skip_pasv_ip            =>  option_types[:long]            +  137,
          :ftp_filemethod              =>  option_types[:long]            +  138,
          :localport                   =>  option_types[:long]            +  139,
          :localportrange              =>  option_types[:long]            +  140,
          :connect_only                =>  option_types[:long]            +  141,
          :conv_from_network_function  =>  option_types[:function_point]  +  142,
          :conv_to_network_function    =>  option_types[:function_point]  +  143,
          :max_send_speed_large        =>  option_types[:off_t]           +  145,
          :max_recv_speed_large        =>  option_types[:off_t]           +  146,
          :ftp_alternative_to_user     =>  option_types[:object_point]    +  147,
          :sockoptfunction             =>  option_types[:function_point]  +  148,
          :sockoptdata                 =>  option_types[:object_point]    +  149,
          :ssl_sessionid_cache         =>  option_types[:long]            +  150,
          :ssh_auth_types              =>  option_types[:long]            +  151,
          :ssh_public_keyfile          =>  option_types[:object_point]    +  152,
          :ssh_private_keyfile         =>  option_types[:object_point]    +  153,
          :ftp_ssl_ccc                 =>  option_types[:long]            +  154,
          :timeout_ms                  =>  option_types[:long]            +  155,
          :connecttimeout_ms           =>  option_types[:long]            +  156,
          :http_transfer_decoding      =>  option_types[:long]            +  157,
          :http_content_decoding       =>  option_types[:long]            +  158,
          :copypostfields              =>  option_types[:object_point]    +  165,
          :proxy_transfer_mode         =>  option_types[:long]            +  166,
          :seekfunction                =>  option_types[:function_point]  +  167,
          :seekdata                    =>  option_types[:object_point]    +  168,
          :crlfile                     =>  option_types[:object_point]    +  169,
          :issuercert                  =>  option_types[:object_point]    +  170,
          :address_scope               =>  option_types[:long]            +  171,
          :certinfo                    =>  option_types[:long]            +  172,
          :username                    =>  option_types[:object_point]    +  173,
          :password                    =>  option_types[:object_point]    +  174,
          :proxyusername               =>  option_types[:object_point]    +  175,
          :proxypassword               =>  option_types[:object_point]    +  176,
          :noproxy                     =>  option_types[:object_point]    +  177,
          :tftp_blksize                =>  option_types[:long]            +  178,
          :socks5_gssapi_service       =>  option_types[:object_point]    +  179,
          :socks5_gssapi_nec           =>  option_types[:long]            +  180,
          :protocols                   =>  option_types[:long]            +  181,
          :redir_protocols             =>  option_types[:long]            +  182,
          :ssh_knownhosts              =>  option_types[:object_point]    +  183,
          :ssh_keyfunction             =>  option_types[:function_point]  +  184,
          :ssh_keydata                 =>  option_types[:object_point]    +  185,
          :mail_from                   =>  option_types[:object_point]    +  186,
          :mail_rcpt                   =>  option_types[:object_point]    +  187,
          :ftp_use_pret                =>  option_types[:long]            +  188,
          :rtsp_request                =>  option_types[:long]            +  189,
          :rtsp_session_id             =>  option_types[:object_point]    +  190,
          :rtsp_stream_uri             =>  option_types[:object_point]    +  191,
          :rtsp_transport              =>  option_types[:object_point]    +  192,
          :rtsp_client_cseq            =>  option_types[:long]            +  193,
          :rtsp_server_cseq            =>  option_types[:long]            +  194,
          :interleavedata              =>  option_types[:object_point]    +  195,
          :interleavefunction          =>  option_types[:function_point]  +  196,
          :wildcardmatch               =>  option_types[:long]            +  197,
          :chunk_bgn_function          =>  option_types[:function_point]  +  198,
          :chunk_end_function          =>  option_types[:function_point]  +  199,
          :fnmatch_function            =>  option_types[:function_point]  +  200,
          :chunk_data                  =>  option_types[:object_point]    +  201,
          :fnmatch_data                =>  option_types[:object_point]    +  202,
          :resolve                     =>  option_types[:object_point]    +  203,
          :tlsauth_username            =>  option_types[:object_point]    +  204,
          :tlsauth_password            =>  option_types[:object_point]    +  205,
          :tlsauth_type                =>  option_types[:object_point]    +  206,
          :transfer_encoding           =>  option_types[:long]            +  207,
          :closesocketfunction         =>  option_types[:function_point]  +  208,
          :closesocketdata             =>  option_types[:object_point]    +  209,
          :gssapi_delegation           =>  option_types[:long]            +  210,
          :dns_servers                 =>  option_types[:object_point]    +  211,
          :accepttimeout_ms            =>  option_types[:long]            +  212,
          :tcp_keepalive               =>  option_types[:long]            +  213,
          :tcp_keepidle                =>  option_types[:long]            +  214,
          :tcp_keepintvl               =>  option_types[:long]            +  215,
          :ssl_options                 =>  option_types[:long]            +  216,
          :mail_auth                   =>  option_types[:object_point]    +  217
        }
      end
    end
  end
end
