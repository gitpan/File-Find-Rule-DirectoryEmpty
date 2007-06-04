package File::Find::Rule::DirectoryEmpty;
use strict;
use base 'File::Find::Rule';

our $VERSION = sprintf "%d.%02d", q$Revision: 1.1 $ =~ /(\d+)/g;


sub File::Find::Rule::directoryempty {
	my $self = shift->_force_object;

#	$self->directory;
	
	$self->exec( 
		sub {
			opendir(DIR,+shift) or return;	
			my $count = scalar(grep{!/^\.\.?$/} readdir DIR);
			closedir DIR;
			return ($count==0);	
		}
	);	
	
}

	
#    my $dh = IO::Dir->new($fullname) or return;
#    my $count = scalar(grep{!/^\.\.?$/} $dh->read());
#    $dh->close();
#    return($count==0);
#}


1;

__END__

=pod

=head1 NAME

File::Find::Rule::DirectoryEmpty - test a directory for being empty

=head1 SYNOPSIS

	use File::Find::Rule::DirectoryEmpty;
	
	my @emptydirs = File::Find::Rule::DirectoryEmpty->directoryempty->in('/home/myself');

=head1 directoryempty()

returns boolean

=head1 AUTHOR

Leo Charre leocharre at cpan dot org

=head1 SEE ALSO

L<File::Find::Rule>

=cut



