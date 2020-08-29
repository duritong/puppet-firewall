# manage puppet outgoing rules
class firewall::rules::out::puppet(
  String $puppetserver,
  Integer $puppetserver_port,
) {
  include firewall
  if $firewall::use_nftables {
    class{'nftables::rules::out::puppet':
      puppetserver      => $puppetmaster,
      puppetserver_port => $puppetmaster_port,
    }
  } else {
    class{'shorewall::rules::out::puppet':
      puppetserver      => $puppetmaster,
      puppetserver_port => $puppetmaster_port,
    }
  }
}

