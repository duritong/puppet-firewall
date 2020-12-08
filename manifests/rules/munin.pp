# dispatch munin rules
class firewall::rules::munin(
  Array[Stdlib::IP::Address::V4] $munin_collector = [],
  Array[Stdlib::IP::Address::V6] $munin_collector6 = [],
  Stdlib::Port $munin_port = 4949,
  Enum['loc','net'] $collector_source = 'net',
){
  include firewall
  if $firewall::use_nftables {
    if !empty($munin_collector) {
      nftables::rule {
        'default_in-munin-ipv4':
          content => "ip saddr {${munin_collector.join(',')}} tcp dport ${munin_port} accept",
      }
    }
    if !empty($munin_collector6) {
      nftables::rule {
        'default_in-munin-ipv6':
          content => "ip6 saddr {${munin_collector6.join(',')}} tcp dport ${munin_port} accept",
      }
    }
  } else {
    class{'firewall::rules::munin':
      munin_port       => $port,
      munin_collector  => $munin_collector,
      munin_collector6 => $munin_collector6,
      collector_source => $collector_source,
    }
  }
}
