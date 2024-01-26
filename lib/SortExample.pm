## no critic: TestingAndDebugging::RequireUseStrict
package SortExample;

# AUTHORITY
# DATE
# DIST
# VERSION

1;
# ABSTRACT: Sort examples

=head1 SPECIFICATION VERSION

0.1


=head1 SYNOPSIS

Basic use with L<Sort::ByExample>:

 use Sort::ByExample qw(sbe);
 use SortExample::AHMS::Fruit::EN; # list of fruit by decreasing priority/popularity

 my @sorted = sbe(SortExample::AHMS::Fruit::EN::get_example(), "peach", "grape", "strawberry");
 # => ("strawberry", "grape", "peach");

Specifying arguments:

 use Sort::ByExample qw(sbe);
 use SortExample::Foo;
 my @sorted = sbe(SortExample::Foo::get_example(arg1=>..., ), ...);

Specifying example on the command-line (for other CLI's):

 % sort-by-example -m AHMS::Fruit::EN ...
 % sort-by-example -m Foo=arg1,val,arg2,val ...


=head1 DESCRIPTION

B<EXPERIMENTAL.>

C<SortExample> is a namespace for modules that declare sort examples. Sort
examples are used with L<Sort::ByExample>.

=head2 Writing a SortExample module

 package SortExample::Foo;

 # required. must return a hash (DefHash)
 sub meta {
     return +{
         v => 1,
         summary => 'Sort examples related to Foo',
         args => {
             arg1 => {
                 schema => 'str*', # Sah schema
                 req => 1,
             },
         },
     };
 }

 sub get_example {
     my %args = @_;
     ...
 }

 1;


=head2 Namespace organization

TODO.


=head2 SEE ALSO

=head2 Base specifications

L<DefHash>

L<Sah>

=head2 Related modules

L<Sort::ByExample>
