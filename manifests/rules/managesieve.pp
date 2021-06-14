# manage incoming managesieve
class firewall::rules::managesieve {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_in-managesieve':
        content => 'tcp dport 4190 accept',
    }
  } else {
    include shorewall::rules::managesieve
  }
}
