# gorilla Fod
class gorilla(){
if $::osfamily == 'windows'{
    class {'gorilla::install':}
    -> Class['gorilla']
  }
}
