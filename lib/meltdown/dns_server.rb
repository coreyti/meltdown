require 'rexec'
require 'rexec/daemon'
require 'rubydns'

module Meltdown
  class DnsServer < RExec::Daemon::Base
    class << self
      def run
        # don't buffer output (for realtime debugging)
        $stdout.sync = true
        $stderr.sync = true

        # listen on same port as Pow, registered in /etc/resolver/dev
        RubyDNS::run_server(:listen => [[:udp, "0.0.0.0", 20560]]) do
          match(/.*\.dev$/, :A) do |match, transaction|
            logger.info "DNS match A    : #{transaction.inspect}"
            transaction.respond!("127.0.0.1")
          end

          match(/.*\.dev$/, :AAAA) do |match, transaction|
            logger.info "DNS match AAAA : #{transaction.inspect}"
            transaction.respond!("::1")
          end

          match("1.0.0.127.in-addr.arpa", :PTR) do |transaction|
            logger.info "DNS match PTR  : #{transaction.inspect}"
            transaction.respond!(Name.create("default.dev."))
          end
        end
      end
    end
  end
end
