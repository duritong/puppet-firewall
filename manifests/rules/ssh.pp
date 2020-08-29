# manage incoming ssh
class firewall::rules::ssh(
  Array[Integer[1,65535]] $ports,
  String                  $source = 'net',
){
  include firewall
  if $firewall::use_nftables {
    class{'nftables::rules::ssh':
      ports  => $ports,
    }
  } else {
    class{'shorewall::rules::ssh':
      ports  => $ports,
      source => $source,
    }
  }
}
