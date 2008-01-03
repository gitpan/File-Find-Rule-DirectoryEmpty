package File::Find::Rule::DirectoryEmpty;
use strict;
use base 'File::Find::Rule';
use vars qw($VERSION);
$VERSION = sprintf "%d.%02d", q$Revision: 1.6 $ =~ /(\d+)/g;


sub File::Find::Rule::directoryempty {
	my $self = shift->_force_object;


	$self->exec( 
		sub {
			opendir(DIR,+shift) or return;	

         for( readdir DIR ){
            if( !/^\.\.?$/ ){
               closedir DIR;
               return 0;
            }
         }
         closedir DIR;
         return 1;            
		}
	);		
}

	


1;

__END__

=pod

=head1 NAME

File::Find::Rule::DirectoryEmpty - find empty directories recursively

=head1 SYNOPSIS

	use File::Find::Rule::DirectoryEmpty;
	
	my @emptydirs = File::Find::Rule::DirectoryEmpty->directoryempty->in('/home/myself');

=head1 directoryempty()

returns boolean

=head1 DESCRIPTION

Instead of reading full count of directory contents, we return false as soon as we match
something other then . or ..
This may not work on windoze.

=head1 AUTHOR

Leo Charre leocharre at cpan dot org

=head1 SEE ALSO

L<File::Find::Rule>

=cut



