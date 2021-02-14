# dispatch munin rules
class firewall::rules::munin (
  Array[Stdlib::IP::Address::V4] $collector = [],
  Array[Stdlib::IP::Address::V6] $collector6 = [],
  Stdlib::Port $port = 4949,
  Array[Enum['loc','net']] $collector_source = ['net'],
) {
  include firewall
  if $firewall::use_nftables {
    if !empty($collector) {
      nftables::rule {
        'default_in-muninipv4':
          content => "ip saddr {${collector.join(',')}} tcp dport ${port} accept",
      }
    }
    if !empty($collector6) {
      nftables::rule {
        'default_in-muninipv6':
          content => "ip6 saddr {${collector6.join(',')}} tcp dport ${port} accept",
      }
    }
  } else {
    class { 'shorewall::rules::munin':
      munin_port       => $port,
      munin_collector  => $collector,
      munin_collector6 => $collector6,
      collector_source => $collector_source,
    }
  }
}
