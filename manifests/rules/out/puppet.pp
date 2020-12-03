# manage puppet outgoing rules
class firewall::rules::out::puppet(
  Array[Stdlib::IP::Address]
    $puppetserver,
  Integer
    $puppetserver_port = 8140,
) {
  include firewall
  if $firewall::use_nftables {
    class{'nftables::rules::out::puppet':
      puppetserver      => $puppetserver,
      puppetserver_port => $puppetserver_port,
    }
  } else {
    class{'shorewall::rules::out::puppet':
      puppetserver      => $puppetserver,
      puppetserver_port => $puppetserver_port,
    }
  }
}

