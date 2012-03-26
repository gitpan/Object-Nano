package Object::Nano;

use strict;
use warnings;

our $VERSION = '0.001';

sub import {
    my ($class, @args) = @_;
    my $target = caller;
    
    warnings->import();
    strict->import();

    {
        no strict 'refs';
        *{ "${target}::new" } = sub {
            my ($self, %accessors) = @_;
            my $this = {};
            if (%accessors) {
                foreach my $method (keys %accessors) {
                    $this->{$method} = $accessors{$method};
                }
            }
            return bless $this, $target;
        };

    }

    if (@args) {
        for my $a (@args) {
            _add_as_accessor($a);
        }
    }
}

sub _add_as_accessor {
    my ($method, $value) = @_;
    my $target = caller(1);
    
    {
        no strict 'refs';

        *{"${target}::$method"} = sub {
            my ($self, $val) = @_;
            
            if ($val) {
                $self->{$method} = $val;
                return $val;
            }
            
            return $self->{$method}||"";
        };
    }
}

=head1 NAME

Object::Nano - No frills class building, with readable and writable accessors

=head1 DESCRIPTION

=head2 Why another class builder???

I've tried different class builders, my favorite being L<Object::Tiny> for its simplicity, speed, compactness, etc.. but unfortunately when I needed to create writable accessors I became stuck. So, L<Object::Nano> was born. All it does is build you a simple class and creates readable/writable accessors. Oh, and imports warnings and strict, so you don't need to do that either.
Not really fussed about writable accessors and warnings/strict? Then you're probably better off with L<Object::Tiny>

=head1 SYNOPSIS

    package MyClass;

    use Object::Nano qw<name level email>;

    1;

After the above you have a full-working class with a few usable accessors. So you can do something like...

    use TestClass;

    my $t = TestClass->new(
        name    => 'Foo',
        level   => 15,
    );
    
    $t->email('foo@foo'); # updated the email accessor

=head1 AUTHOR

Brad Haywood <brad@perlpowered.com>

=head1 LICENSE

You may distribute this code under the same terms as Perl itself.

=cut

1;
