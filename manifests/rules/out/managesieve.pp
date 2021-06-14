# outgoing managesieve
class firewall::rules::out::managesieve {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_out-managesieve':
        content => 'tcp dport 4190 accept',
    }
  } else {
    include shorewall::rules::out::managesieve
  }
}
