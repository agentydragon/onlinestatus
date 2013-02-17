require 'net/ping/tcp'
require 'net/ping/udp'

module OnlineStatus
	KNOWN_GOOD_HOSTS = {
		# Some known good websites
		"www.google.com" => { tcp: 80 },
		"www.wikipedia.org" => { tcp: 80 },
		"www.facebook.com" => { tcp: 80 },
		"www.twitter.com" => { tcp: 80 },
		"www.youtube.com" => { tcp: 80 },

		# TODO: somehow ping DNS root servers?
		# DNS root server IPs
		#"198.41.0.4" => { udp: 53 }, # A
		#"192.228.79.201" => { udp: 53 }, # B
		#"192.33.4.12" => { udp: 53 }, # C
		#"199.7.91.13" => { udp: 53 }, # D
		#"192.203.230.10" => { udp: 53 }, # E
		#"192.5.5.241" => { udp: 53 }, # F
		#"192.112.36.4" => { udp: 53 }, # G
		#"128.63.2.53" => { udp: 53 }, # H
		#"192.36.148.17" => { udp: 53 }, # I
		#"192.58.128.30" => { udp: 53 }, # J
		#"193.0.14.129" => { udp: 53 }, # K
		#"199.7.83.42" => { udp: 53 }, # L
		#"202.12.27.33" => { udp: 53 }, # M
	}

	private
	def self.host_pingable?(host, methods)
		for protocol, port in methods
			case protocol
			when :tcp
				ping = Net::Ping::TCP.new(host, port)
			#when :udp
			#	ping = Net::Ping::UDP.new(host, port)
			else
				next
			end

			return true if ping.ping?
		end
		false
	end

	public
	def self.online?
		# Online = at least 3 known good servers are pingable
		good_hosts = 0
		for host, methods in KNOWN_GOOD_HOSTS
			good_hosts += 1 if host_pingable?(host, methods)

			return true if good_hosts >= 3
		end

		false
	end

	def self.online
		online?
	end

	def self.offline?
		!online?
	end

	def self.offline
		offline?
	end
end
