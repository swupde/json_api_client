module JsonApiClient
  module Middleware
    class Gzip < Faraday::Middleware

      def call(environment)
        @app.call(environment).on_complete do |env|
          if gzip?(env)
            env[:raw_body] = env[:body]
            env[:body] = unzip(env[:body])
          end
        end
      end

      private
      
      def unzip(body)
        sio = StringIO.new( body )
        gz = Zlib::GzipReader.new( sio )
        gz.read()      
      end

      def gzip?(env)
        env[:response_headers][ 'Content-Encoding' ].eql?( 'gzip' ) 
      end
    end
  end
end