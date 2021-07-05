# manage incoming rule
define firewall::rule (
  Nftables::SimpleRuleName $rule_name = $title,
  Nftables::Port $port,
  Enum['tcp','udp'] $proto,
) {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      "default_in-${rule_name}":
        content => "${proto} dport ${port} accept",
    }
  } else {
    shorewall::rule { "net-me-${rule_name}-${proto}":
      source          => 'net',
      destination     => '$FW',
      proto           => $proto,
      destinationport => String($port),
      order           => 240,
      action          => 'ACCEPT';
    }
  }
}
