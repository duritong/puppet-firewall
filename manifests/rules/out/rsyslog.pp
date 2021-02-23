# manage rsyslog outgoing rules
class firewall::rules::out::rsyslog (
  Array[Stdlib::IP::Address] $server,
  Integer $port = 20514,
) {
  include firewall
  if $firewall::use_nftables {
    $server.each |$index,$s| {
      nftables::rule {
        "default_out-rsyslog-${index}":
      }
      if $s =~ Stdlib::IP::Address::V6 {
        Nftables::Rule["default_out-rsyslog-${index}"] {
          content => "ip6 daddr ${s} tcp dport ${port} accept",
        }
      } else {
        Nftables::Rule["default_out-rsyslog-${index}"] {
          content => "ip daddr ${s} tcp dport ${port} accept",
        }
      }
    }
  } else {
    class { 'shorewall::rules::out::rsyslog':
      server => $server,
      port   => $port,
    }
  }
}
