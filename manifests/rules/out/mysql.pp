# manage outgoing mysql
class firewall::rules::out::mysql {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::mysql
  } else {
    include shorewall::rules::out::mysql
  }
}
