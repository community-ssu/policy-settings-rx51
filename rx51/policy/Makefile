DRESC := dresc
SWIPL := swipl
LIBPROLOG := /usr/share/libprolog/libprolog.pl
PLC := ../../scripts/plc

POLICY_SRCS := $(shell grep '^configuration' policy.pl | sed 's/configuration(\[//;s/])\./.pl/;s/,/.pl/g') $(shell grep '^subsystems' policy.pl | sed 's/subsystems(\[//;s/])\./.pl/;s/,/.pl/g')

all: policy.plc policy.dresc

clean:
	$(RM) policy.plc
#	$(RM) policy.dresc

#policy.dresc: policy.dres
#	$(DRESC) $< -o $@

policy.plc: policy.pl $(LIBPROLOG) $(POLICY_SRCS)
	$(SWIPL) -q -t precompile -s $(PLC) -- -c policy.pl $(LIBPROLOG) -o $@
