use Test::More tests => 1;

{package Foo;

    use Object::Nano qw<foo>;
    
};

my $foo = Foo->new(foo => 'bar');
is $foo->foo, 'bar', 'Foo is bar, so Object::Nano is working as expected';
