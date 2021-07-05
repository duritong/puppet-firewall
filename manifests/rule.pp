# manage simple rules
define firewall::rule (
  Nftables::SimpleRuleName $rule_name = $title,
  Nftables::Port $port,
  Enum['tcp','udp'] $proto = 'tcp',
  Enum['out','in'] $direction = 'in',
) {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      "default_${direction}-${rule_name}":
        content => "${proto} dport ${port} accept",
    }
  } else {
    if $direction == 'out' {
      $source      = '$FW'
      $destination = 'net'
    } else {
      $source      = 'net'
      $destination = '$FW'
    }
    shorewall::rule { "${source}-${destination}-${rule_name}-${proto}":
      source          => $source,
      destination     => $destination,
      proto           => $proto,
      destinationport => String($port),
      order           => 240,
      action          => 'ACCEPT';
    }
  }
}
