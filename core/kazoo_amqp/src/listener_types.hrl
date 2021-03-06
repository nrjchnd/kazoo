-ifndef(KZ_LISTENER_TYPES_HRL).

-include_lib("kazoo_amqp/include/kz_amqp.hrl").
-include_lib("kazoo_stdlib/include/kz_types.hrl").
-include_lib("kazoo_stdlib/include/kz_log.hrl").

-type binding_module() :: atom() | ne_binary().

-type binding_property() :: {'restrict_to', list()}.
-type binding_properties() :: [binding_property()].

-type binding() :: {binding_module(), binding_properties()}. %% {kapi_module, options}
-type bindings() :: [binding()].

%% ExchangeName, ExchangeType[, ExchangeOptions]
-type declare_exchange() :: {ne_binary(), ne_binary()} |
                            {ne_binary(), ne_binary(), kz_proplist()}.
-type declare_exchanges() :: [declare_exchange()].

-type start_params() :: [{'responders', responder_start_params()} |
                         {'bindings', bindings()} |
                         {'queue_name', binary()} |
                         {'queue_options', kz_proplist()} |
                         {'consume_options', kz_proplist()} |
                         {'basic_qos', non_neg_integer()} |
                         {'broker' | 'broker_tag', ne_binary()} |
                         {'declare_exchanges', declare_exchanges()} |
                         {'auto_ack', boolean()}
                        ].

-type responder_callback_fun2() :: fun((kz_json:object(), kz_proplist()) -> no_return()).
-type responder_callback_fun3() :: fun((kz_json:object(), kz_proplist(), basic_deliver()) -> no_return()).
-type responder_callback_fun4() :: fun((kz_json:object(), kz_proplist(), basic_deliver(), amqp_basic()) -> no_return()).
-type responder_callback_fun() :: responder_callback_fun2() | responder_callback_fun3() | responder_callback_fun4().

-type responder_callback() :: atom() | {atom(), atom()} | responder_callback_fun().
-type responder_callback_mapping() :: {ne_binary(), ne_binary()}.
-type responder_callback_mappings() :: [responder_callback_mapping()].

-type responder_start_params() :: [{responder_callback(), responder_callback_mappings()}].

-type responder_mfa() :: mfa() | {responder_callback_fun(), arity()}.

%% { {Event-Category, Event-Name}, CallbackModule | {CallbackModule, Function} | CallbackFun}
-type responder() :: {responder_callback_mapping(), responder_mfa() }.
-type responders() :: [responder()].

-define(KZ_LISTENER_TYPES_HRL, 'true').
-endif.
