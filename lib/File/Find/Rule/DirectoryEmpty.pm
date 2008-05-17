package File::Find::Rule::DirectoryEmpty;
use strict;
use base 'File::Find::Rule';
use vars qw($VERSION);
$VERSION = sprintf "%d.%02d", q$Revision: 1.10 $ =~ /(\d+)/g;

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
	
	my @emptydirs = File::Find::Rule->directoryempty->in('/home/myself');

   # another way..
   
   my $o = new File::Find::Rule;
   $o->directoryempty;
   my @emptydirs = $o->in( $ENV{HOME} );

=head1 Matching Rules

=head2 directoryempty()

Matches only if it is an empty directory.

=head1 DESCRIPTION

This module inherits File::Find::Rule. It lets you find empty directories recursively.
Note that a directory with an empty directory inside it is not an empty directory.

=head2 NOTES

Instead of reading full count of directory contents, we return false as soon as we match
something other then . or .. This helps with speed.

=head1 CAVEATS

This may not work on windows platforms. You're welcome to send in a patch for it. 

=head1 AUTHOR

Leo Charre leocharre at cpan dot org

=head1 SEE ALSO

L<File::Find::Rule>

=cut



