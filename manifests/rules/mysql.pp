# manage incoming mysql
class firewall::rules::mysql {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_in-mysql':
        content => 'tcp dport 3306 accept',
    }
  } else {
    include shorewall::rules::mysql
  }
}
