PROJECT = emq_auth_ldap
PROJECT_DESCRIPTION = Authentication/ACL with LDAP
PROJECT_VERSION = 2.3.10

DEPS = ecpool clique
dep_ecpool = git https://github.com/emqtt/ecpool v0.2.1
dep_clique  = git https://github.com/emqtt/clique v0.3.10

LOCAL_DEPS = eldap

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/gbrehmer/emqttd v2.3.10-authfix3
dep_cuttlefish = git https://github.com/emqtt/cuttlefish v2.0.11

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_DEPS = emqttc emq_auth_username
dep_emqttc = git https://github.com/emqtt/emqttc
dep_emq_auth_username = git https://github.com/emqtt/emq-auth-username

TEST_ERLC_OPTS += +debug_info
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_auth_ldap.conf -i priv/emq_auth_ldap.schema -d data
