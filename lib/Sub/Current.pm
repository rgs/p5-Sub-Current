package Sub::Current;

our $VERSION = '0.02';
require XSLoader;
XSLoader::load('Sub::Current', $VERSION);

sub import {
    *{caller() . '::ROUTINE'} = *ROUTINE;
}

__END__

=head1 NAME

Sub::Current - Get the current subroutine

=head1 SYNOPSIS

    use Sub::Current;
    sub f {
	# ...
	if ($some_condition) {
	    # let's recurse!
	    ROUTINE->();
	}
	# ...
    }

=head1 DESCRIPTION

Sub::Current makes available a function C<ROUTINE()>, that returns a code
reference pointing at the currently executing subroutine.

In a special block (BEGIN, END, CHECK, INIT, and UNITCHECK in Perl 5.10)
this function will return undef.

Outside of a special block (that is, at the top level of a program)
C<ROUTINE()> will return undef as well.

=head1 COPYRIGHT

(c) Copyright 2007 by Rafael Garcia-Suarez.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
