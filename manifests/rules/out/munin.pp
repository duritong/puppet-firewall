# outgoing rules for munin
class firewall::rules::out::munin {
  include firewall
  if $firewall::use_nftables {
    nftables::simplerule {
      'munin-out':
        chain => 'default_out',
        dport => '4949',
    }
  } else {
    include shorewall::rules::out::munin
  }
}
