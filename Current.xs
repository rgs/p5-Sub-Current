#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sub::Current	PACKAGE = Sub::Current

PROTOTYPES: ENABLE

SV *
ROUTINE()
    PREINIT:
	CV *cv;
    CODE:
	cv = Perl_find_runcv(aTHX_ NULL);
	if (CvUNIQUE(cv))
	    RETVAL = &PL_sv_undef;
	else
	    RETVAL = newRV((SV*)cv);
    OUTPUT:
	RETVAL
