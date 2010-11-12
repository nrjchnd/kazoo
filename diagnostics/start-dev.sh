#!/bin/sh


cd `dirname $0`
exec erl -setcookie `cat ../fs_conf/autoload_configs/.erlang.cookie` -pa $PWD/ebin -pa $PWD/deps/*/ebin \
    -boot start_sasl -sname diagnostics -s diagnostics
#    -kernel error_logger '{file, "log/error_log"}' \

