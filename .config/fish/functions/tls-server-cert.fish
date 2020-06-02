function tls-server-cert --description "tls-server-cert HOST"
  set host $argv[1];
  echo | \
    openssl s_client -servername "$host" -connect "$host":443 2> /dev/null | \
    openssl x509 -text
end
