# manage puppet outgoing rules
class firewall::rules::out::puppet(
  Variant[String,Array[String,1]
    $puppetserver,
  Integer
    $puppetserver_port,
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

