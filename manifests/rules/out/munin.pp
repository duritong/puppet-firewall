# outgoing rules for munin
class firewall::rules::out::munin {
  include firewall
  if $firewall::use_nftables {
    nftables::simplerule {
      'munin_out':
        chain => 'default_out',
        dport => 4949,
        proto => 'tcp',
    }
  } else {
    include shorewall::rules::out::munin
  }
}
