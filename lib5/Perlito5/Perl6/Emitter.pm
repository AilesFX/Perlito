# Do not edit this file - Generated by Perlito5 9.0
use v5.10;
use Perlito5::Perl5::Runtime;
package main;
undef();
use Perlito5::AST;
package Perlito5::Perl6;
do { for ($_) {
    sub Perlito5::Perl6::tab {
        ((my  $level) = shift());
join("", chr(9) x $level)
    };
    ((my  %safe_char) = ('$', 1, '%', 1, '@', 1, '&', 1, '_', 1, ',', 1, '.', 1, ':', 1, ';', 1, '-', 1, '+', 1, '*', 1, ' ', 1, '(', 1, ')', 1, '<', 1, '=', 1, '>', 1, '[', 1, ']', 1, '{', 1, '|', 1, '}', 1));
    sub Perlito5::Perl6::escape_string {
        ((my  $s) = shift());
        (my  @out);
        ((my  $tmp) = '');
        if (($s eq '')) {
            return (chr(39) . chr(39))
        };
        for my $i ((0 .. (length($s) - 1))) {
            ((my  $c) = substr($s, $i, 1));
            if ((((((($c ge 'a') && ($c le 'z'))) || ((($c ge 'A') && ($c le 'Z')))) || ((($c ge '0') && ($c le '9')))) || exists($safe_char{$c}))) {
                ($tmp = ($tmp . $c))
            }
            else {
                if (($tmp ne '')) {
                    push(@out, (chr(39) . $tmp . chr(39)) )
                };
                push(@out, ('chr(' . ord($c) . ')') );
                ($tmp = '')
            }
        };
        if (($tmp ne '')) {
            push(@out, (chr(39) . $tmp . chr(39)) )
        };
        return (join(' ~ ', @out))
    };
    sub Perlito5::Perl6::to_str {
        ((my  $cond) = shift());
        if ($cond->isa('Perlito5::AST::Val::Buf')) {
            return ($cond->emit_perl6())
        }
        else {
            return (('(' . $cond->emit_perl6() . ')'))
        }
    };
    sub Perlito5::Perl6::to_num {
        ((my  $cond) = shift());
        if (($cond->isa('Perlito5::AST::Val::Int') || $cond->isa('Perlito5::AST::Val::Num'))) {
            return ($cond->emit_perl6())
        }
        else {
            return (('(' . $cond->emit_perl6() . ')'))
        }
    };
    sub Perlito5::Perl6::to_bool {
        ((my  $cond) = shift());
        if (((((($cond->isa('Perlito5::AST::Val::Int')) || ($cond->isa('Perlito5::AST::Val::Num'))) || (($cond->isa('Perlito5::AST::Apply') && ($cond->code() eq 'infix:<||>')))) || (($cond->isa('Perlito5::AST::Apply') && ($cond->code() eq 'infix:<&&>')))) || (($cond->isa('Perlito5::AST::Apply') && ($cond->code() eq 'prefix:<!>'))))) {
            return ($cond->emit_perl6())
        }
        else {
            return (('(' . $cond->emit_perl6() . ')'))
        }
    }
}};
package Perlito5::Perl6::LexicalBlock;
do { for ($_) {
    sub Perlito5::Perl6::LexicalBlock::new {
        ((my  $class) = shift());
        bless({@_}, $class)
    };
    sub Perlito5::Perl6::LexicalBlock::block {
        $_[0]->{        'block'}
    };
    sub Perlito5::Perl6::LexicalBlock::needs_return {
        $_[0]->{        'needs_return'}
    };
    sub Perlito5::Perl6::LexicalBlock::top_level {
        $_[0]->{        'top_level'}
    };
    sub Perlito5::Perl6::LexicalBlock::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        if ($self->{'top_level'}) {
            ((my  $block) = Perlito5::Perl6::LexicalBlock->new('block', $self->block(), 'needs_return', $self->needs_return(), 'top_level', 0));
            return (($block->emit_perl6(($level + 1)) . ';' . chr(10)))
        };
        (my  @block);
        for (@{$self->{'block'}}) {
            if (defined($_)) {
                push(@block, $_ )
            }
        };
        if (!(@block)) {
            return ((Perlito5::Perl6::tab($level) . ';'))
        };
        (my  @str);
        for my $decl (@block) {
            if (($decl->isa('Perlito5::AST::Decl') && ($decl->decl() eq 'my'))) {
                push(@str, (Perlito5::Perl6::tab($level) . $decl->emit_perl6_init()) )
            };
            if (($decl->isa('Perlito5::AST::Apply') && ($decl->code() eq 'infix:<=>'))) {
                ((my  $var) = $decl->arguments()->[0]);
                if (($var->isa('Perlito5::AST::Decl') && ($var->decl() eq 'my'))) {
                    push(@str, (Perlito5::Perl6::tab($level) . $var->emit_perl6_init()) )
                }
            }
        };
        for my $decl (@block) {
            if (!((($decl->isa('Perlito5::AST::Decl') && ($decl->decl() eq 'my'))))) {
                push(@str, ($decl->emit_perl6($level) . ';') )
            }
        };
        return ((join(chr(10), @str) . ';'))
    }
}};
package Perlito5::AST::CompUnit;
do { for ($_) {
    sub Perlito5::AST::CompUnit::emit_perl6 {
        ((my  $self) = $_[0]);
        ((my  $level) = $_[1]);
        (my  @body);
        ((my  $i) = 0);
        for ( ; ($i <= scalar(@{$self->{'body'}})); do { for ($_) {

}} ) {
            ((my  $stmt) = $self->{'body'}->[$i]);
            if (((ref($stmt) eq 'Perlito5::AST::Apply') && ($stmt->code() eq 'package'))) {
                ((my  $name) = $stmt->namespace());
                (my  @stmts);
                ($i)++;
                for ( ; (($i <= scalar(@{$self->{'body'}})) && !((((ref($self->{'body'}->[$i]) eq 'Perlito5::AST::Apply') && ($self->{'body'}->[$i]->code() eq 'package'))))); do { for ($_) {

}} ) {
                    push(@stmts, $self->{'body'}->[$i] );
                    ($i)++
                };
                push(@body, Perlito5::AST::CompUnit->new('name', $name, 'body', \@stmts) )
            }
            else {
                if (defined($stmt)) {
                    push(@body, $stmt )
                };
                ($i)++
            }
        };
        ((my  $class_name) = $self->{'name'});
        ((my  $str) = ('package ' . $class_name . '{' . chr(10)));
        for my $decl (@body) {
            if (($decl->isa('Perlito5::AST::Decl') && (($decl->decl() eq 'my')))) {
                ($str = ($str . '  ' . $decl->emit_perl6_init()))
            };
            if (($decl->isa('Perlito5::AST::Apply') && ($decl->code() eq 'infix:<=>'))) {
                ((my  $var) = $decl->arguments()->[0]);
                if (($var->isa('Perlito5::AST::Decl') && ($var->decl() eq 'my'))) {
                    ($str = ($str . '  ' . $var->emit_perl6_init()))
                }
            }
        };
        for my $decl (@body) {
            if ($decl->isa('Perlito5::AST::Sub')) {
                ($str = ($str . ($decl)->emit_perl6(($level + 1)) . ';' . chr(10)))
            }
        };
        for my $decl (@body) {
            if (((defined($decl) && (!((($decl->isa('Perlito5::AST::Decl') && ($decl->decl() eq 'my')))))) && (!(($decl->isa('Perlito5::AST::Sub')))))) {
                ($str = ($str . ($decl)->emit_perl6(($level + 1)) . ';' . chr(10)))
            }
        };
        ($str . '}' . chr(10))
    };
    sub Perlito5::AST::CompUnit::emit_perl6_program {
        ((my  $comp_units) = shift());
        ((my  $str) = '');
        ($str = ($str . 'use Perlito5::Perl6::Runtime;' . chr(10)));
        for my $comp_unit (@{$comp_units}) {
            ($str = ($str . $comp_unit->emit_perl6() . chr(10)))
        };
        return ($str)
    }
}};
package Perlito5::AST::Val::Int;
do { for ($_) {
    sub Perlito5::AST::Val::Int::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . $self->{'int'})
    }
}};
package Perlito5::AST::Val::Num;
do { for ($_) {
    sub Perlito5::AST::Val::Num::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . $self->{'num'})
    }
}};
package Perlito5::AST::Val::Buf;
do { for ($_) {
    sub Perlito5::AST::Val::Buf::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . Perlito5::Perl6::escape_string($self->{'buf'}))
    }
}};
package Perlito5::AST::Lit::Block;
do { for ($_) {
    sub Perlito5::AST::Lit::Block::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $sig) = '$_');
        if ($self->{'sig'}) {
            ($sig = $self->{'sig'}->emit_perl6(($level + 1)))
        };
        return ((Perlito5::Perl6::tab($level) . ('(function (' . $sig . ') {' . chr(10)) . (Perlito5::Perl6::LexicalBlock->new('block', $self->{'stmts'}, 'needs_return', 1))->emit_perl6(($level + 1)) . chr(10) . Perlito5::Perl6::tab($level) . '})'))
    }
}};
package Perlito5::AST::Index;
do { for ($_) {
    sub Perlito5::AST::Index::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        if (($self->{'obj'}->isa('Perlito5::AST::Var') && ($self->{'obj'}->sigil() eq '$'))) {
            ((my  $v) = Perlito5::AST::Var->new('sigil', '@', 'namespace', $self->{'obj'}->namespace(), 'name', $self->{'obj'}->name()));
            return (($v->emit_perl6($level) . '[' . $self->{'index_exp'}->emit_perl6() . ']'))
        };
        (Perlito5::Perl6::tab($level) . $self->{'obj'}->emit_perl6() . '[' . $self->{'index_exp'}->emit_perl6() . ']')
    }
}};
package Perlito5::AST::Lookup;
do { for ($_) {
    sub Perlito5::AST::Lookup::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        if (($self->{'obj'}->isa('Perlito5::AST::Var') && ($self->{'obj'}->sigil() eq '$'))) {
            ((my  $v) = Perlito5::AST::Var->new('sigil', '%', 'namespace', $self->{'obj'}->namespace(), 'name', $self->{'obj'}->name()));
            return (($v->emit_perl6($level) . '{' . $self->{'index_exp'}->emit_perl6() . '}'))
        };
        return (($self->{'obj'}->emit_perl6($level) . '{' . $self->{'index_exp'}->emit_perl6() . '}'))
    }
}};
package Perlito5::AST::Var;
do { for ($_) {
    sub Perlito5::AST::Var::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        if (($self->{'sigil'} eq '*')) {
            ((my  $ns) = 'PKG');
            if ($self->{'namespace'}) {
                ($ns = ('NAMESPACE["' . $self->{'namespace'} . '"]'))
            };
            return (($ns . '::' . $self->{'name'}))
        };
        ((my  $ns) = '');
        if ($self->{'namespace'}) {
            ($ns = ($self->{'namespace'} . '::'))
        };
        ($ns . $self->{'sigil'} . $self->{'name'})
    }
}};
package Perlito5::AST::Proto;
do { for ($_) {
    sub Perlito5::AST::Proto::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . $self->{'name'})
    }
}};
package Perlito5::AST::Call;
do { for ($_) {
    sub Perlito5::AST::Call::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $invocant) = $self->{'invocant'}->emit_perl6());
        ((my  $meth) = $self->{'method'});
        if (($meth eq 'postcircumfix:<[ ]>')) {
            return ((Perlito5::Perl6::tab($level) . $invocant . '[' . $self->{'arguments'}->emit_perl6() . ']'))
        };
        if (($meth eq 'postcircumfix:<{ }>')) {
            return ((Perlito5::Perl6::tab($level) . $invocant . '{' . $self->{'arguments'}->emit_perl6() . '}'))
        };
        if (($meth eq 'postcircumfix:<( )>')) {
            ((my  @args) = ());
            for (@{$self->{'arguments'}}) {
                push(@args, $_->emit_perl6() )
            };
            return ((Perlito5::Perl6::tab($level) . '(' . $invocant . ')(' . join(',', @args) . ')'))
        };
        ((my  @args) = ($invocant));
        for (@{$self->{'arguments'}}) {
            push(@args, $_->emit_perl6() )
        };
        return ((Perlito5::Perl6::tab($level) . $invocant . '.' . $meth . '(' . join(',', @args) . ')'))
    }
}};
package Perlito5::AST::Apply;
do { for ($_) {
    ((my  %op_infix_js) = ('infix:<->', ' - ', 'infix:<*>', ' * ', 'infix:<x>', ' x ', 'infix:<+>', ' + ', 'infix:<.>', ' ~ ', 'infix:</>', ' / ', 'infix:<>>', ' > ', 'infix:<<>', ' < ', 'infix:<>=>', ' >= ', 'infix:<<=>', ' <= ', 'infix:<eq>', ' eq ', 'infix:<ne>', ' ne ', 'infix:<le>', ' le ', 'infix:<ge>', ' ge ', 'infix:<==>', ' == ', 'infix:<!=>', ' != ', 'infix:<..>', ' .. ', 'infix:<&&>', ' && ', 'infix:<||>', ' || ', 'infix:<and>', ' and ', 'infix:<or>', ' or ', 'infix:<//>', ' // '));
    sub Perlito5::AST::Apply::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $apply) = $self->op_assign());
        if ($apply) {
            return ($apply->emit_perl6($level))
        };
        ((my  $code) = $self->{'code'});
        if ((ref($code) ne '')) {
            ((my  @args) = ());
            for (@{$self->{'arguments'}}) {
                push(@args, $_->emit_perl6() )
            };
            return ((Perlito5::Perl6::tab($level) . '(' . $self->{'code'}->emit_perl6() . ')(' . join(',', @args) . ')'))
        };
        if (($code eq 'infix:<=>>')) {
            return ((Perlito5::Perl6::tab($level) . join(', ', map($_->emit_perl6(), @{$self->{'arguments'}}))))
        };
        if (exists($op_infix_js{$code})) {
            return ((Perlito5::Perl6::tab($level) . '(' . join($op_infix_js{$code}, map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'eval')) {
            return (('eval(perl5_to_js(' . Perlito5::Perl6::to_str($self->{'arguments'}->[0]) . '))'))
        };
        if (($code eq 'undef')) {
            return ((Perlito5::Perl6::tab($level) . 'Any'))
        };
        if (($code eq 'shift')) {
            if (!((($self->{'arguments'} && @{$self->{'arguments'}})))) {
                return ('shift(@_)')
            }
        };
        if (($code eq 'map')) {
            ((my  $fun) = $self->{'arguments'}->[0]);
            ((my  $list) = $self->{'arguments'}->[1]);
            return (('(function (a_) { ' . 'var out = []; ' . 'if ( a_ == null ) { return out; }; ' . 'for(var i = 0; i < a_.length; i++) { ' . 'my $_ = a_[i]; ' . 'out.push(' . $fun->emit_perl6() . ')' . '}; ' . 'return out;' . ' })(' . $list->emit_perl6() . ')'))
        };
        if ((($code eq 'bless') || ($code eq 'ref'))) {
            return (('Perlito5::Perl6::Runtime::' . $code . '( ' . join(', ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'prefix:<!>')) {
            return (('!( ' . Perlito5::Perl6::to_bool($self->{'arguments'}->[0]) . ')'))
        };
        if (($code eq 'prefix:<$>')) {
            ((my  $arg) = $self->{'arguments'}->[0]);
            return (('$(' . $arg->emit_perl6() . ')'))
        };
        if (($code eq 'prefix:<@>')) {
            return (('@(' . join(' ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'prefix:<%>')) {
            ((my  $arg) = $self->{'arguments'}->[0]);
            return (('%(' . $arg->emit_perl6() . ')'))
        };
        if (($code eq 'circumfix:<[ ]>')) {
            return (('[' . join(', ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ']'))
        };
        if (($code eq 'circumfix:<{ }>')) {
            return (('{' . join(', ', map($_->emit_perl6(), @{$self->{'arguments'}})) . '}'))
        };
        if (($code eq 'prefix:<' . chr(92) . '>')) {
            ((my  $arg) = $self->{'arguments'}->[0]);
            if ($arg->isa('Perlito5::AST::Var')) {
                if (($arg->sigil() eq '@')) {
                    return ($arg->emit_perl6())
                };
                if (($arg->sigil() eq '%')) {
                    return (('(HashRef.new(' . $arg->emit_perl6() . '))'))
                }
            };
            return (('(ScalarRef.new(' . $arg->emit_perl6() . '))'))
        };
        if (($code eq 'postfix:<++>')) {
            return (('(' . join(' ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')++'))
        };
        if (($code eq 'postfix:<-->')) {
            return (('(' . join(' ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')--'))
        };
        if (($code eq 'prefix:<++>')) {
            return (('++(' . join(' ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'prefix:<-->')) {
            return (('--(' . join(' ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'prefix:<+>')) {
            return (('+(' . $self->{'arguments'}->[0]->emit_perl6() . ')'))
        };
        if (($code eq 'list:<.>')) {
            return (('(' . join(' ~ ', map(Perlito5::Perl6::to_str($_), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'ternary:<? :>')) {
            return ((Perlito5::Perl6::tab($level) . '( ' . Perlito5::Perl6::to_bool($self->{'arguments'}->[0]) . ' ?? ' . ($self->{'arguments'}->[1])->emit_perl6() . ' !! ' . ($self->{'arguments'}->[2])->emit_perl6() . ')'))
        };
        if (($code eq 'circumfix:<( )>')) {
            return ((Perlito5::Perl6::tab($level) . '(' . join(', ', map($_->emit_perl6(), @{$self->{'arguments'}})) . ')'))
        };
        if (($code eq 'infix:<=>')) {
            return (emit_perl6_bind($self->{'arguments'}->[0], $self->{'arguments'}->[1], $level))
        };
        if (($code eq 'return')) {
            return ((Perlito5::Perl6::tab($level) . 'return(' . ((($self->{'arguments'} && @{$self->{'arguments'}}) ? $self->{'arguments'}->[0]->emit_perl6() : '')) . ')'))
        };
        if ($self->{'namespace'}) {
            if ((($self->{'namespace'} eq 'Perl6') && ($code eq 'inline'))) {
                if ($self->{'arguments'}->[0]->isa('Perlito5::AST::Val::Buf')) {
                    return ($self->{'arguments'}->[0]->{'buf'})
                }
                else {
                    die('Perl6::inline needs a string constant')
                }
            };
            ($code = ($self->{'namespace'} . '::' . ($code)))
        };
        ((my  @args) = ());
        for (@{$self->{'arguments'}}) {
            push(@args, $_->emit_perl6() )
        };
        (Perlito5::Perl6::tab($level) . $code . '(' . join(', ', @args) . ')')
    };
    sub Perlito5::AST::Apply::emit_perl6_bind {
        ((my  $parameters) = shift());
        ((my  $arguments) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . '(' . $parameters->emit_perl6() . ' = ' . $arguments->emit_perl6() . ')')
    }
}};
package Perlito5::AST::If;
do { for ($_) {
    sub Perlito5::AST::If::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $cond) = $self->{'cond'});
        if (($cond->isa('Perlito5::AST::Var') && ($cond->sigil() eq '@'))) {
            ($cond = Perlito5::AST::Apply->new('code', 'prefix:<@>', 'arguments', [$cond]))
        };
        ((my  $body) = Perlito5::Perl6::LexicalBlock->new('block', $self->{'body'}->stmts(), 'needs_return', 0));
        ((my  $s) = (Perlito5::Perl6::tab($level) . 'if ( ' . Perlito5::Perl6::to_bool($cond) . ' ) {' . chr(10) . $body->emit_perl6(($level + 1)) . chr(10) . Perlito5::Perl6::tab($level) . '}'));
        if (@{$self->{'otherwise'}->stmts()}) {
            ((my  $otherwise) = Perlito5::Perl6::LexicalBlock->new('block', $self->{'otherwise'}->stmts(), 'needs_return', 0));
            ($s = ($s . chr(10) . Perlito5::Perl6::tab($level) . 'else {' . chr(10) . $otherwise->emit_perl6(($level + 1)) . chr(10) . Perlito5::Perl6::tab($level) . '}'))
        };
        return ($s)
    }
}};
package Perlito5::AST::While;
do { for ($_) {
    sub Perlito5::AST::While::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $body) = Perlito5::Perl6::LexicalBlock->new('block', $self->{'body'}->stmts(), 'needs_return', 0));
        return ((Perlito5::Perl6::tab($level) . 'loop ( ' . (($self->{'init'} ? ($self->{'init'}->emit_perl6() . '; ') : '; ')) . (($self->{'cond'} ? (Perlito5::Perl6::to_bool($self->{'cond'}) . '; ') : '; ')) . (($self->{'continue'} ? ($self->{'continue'}->emit_perl6() . ' ') : ' ')) . ') {' . chr(10) . $body->emit_perl6(($level + 1)) . ' }'))
    }
}};
package Perlito5::AST::For;
do { for ($_) {
    sub Perlito5::AST::For::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $cond) = $self->{'cond'});
        ((my  $body) = Perlito5::Perl6::LexicalBlock->new('block', $self->{'body'}->stmts(), 'needs_return', 0));
        ((my  $sig) = '$_');
        if ($self->{'body'}->sig()) {
            ($sig = $self->{'body'}->sig()->emit_perl6(($level + 1)))
        };
        (Perlito5::Perl6::tab($level) . 'for ' . $cond->emit_perl6() . ' -> ' . $sig . ' { ' . $body->emit_perl6(($level + 1)) . '}' . chr(10))
    }
}};
package Perlito5::AST::Decl;
do { for ($_) {
    sub Perlito5::AST::Decl::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . $self->{'var'}->emit_perl6())
    };
    sub Perlito5::AST::Decl::emit_perl6_init {
        ((my  $self) = shift());
        ($self->{'decl'} . ' ' . ($self->{'var'})->emit_perl6() . ';')
    }
}};
package Perlito5::AST::Sub;
do { for ($_) {
    sub Perlito5::AST::Sub::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        (Perlito5::Perl6::tab($level) . 'sub ' . (($self->{'name'} ? $self->{'name'} : '')) . '(*@_) {' . chr(10) . (Perlito5::Perl6::LexicalBlock->new('block', $self->{'block'}, 'needs_return', 1, 'top_level', 1))->emit_perl6(($level + 1)) . chr(10) . Perlito5::Perl6::tab($level) . '}')
    }
}};
package Perlito5::AST::Do;
do { for ($_) {
    sub Perlito5::AST::Do::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $block) = $self->simplify()->block());
        return ((Perlito5::Perl6::tab($level) . '(do {' . chr(10) . (Perlito5::Perl6::LexicalBlock->new('block', $block, 'needs_return', 1))->emit_perl6(($level + 1)) . chr(10) . Perlito5::Perl6::tab($level) . '})'))
    }
}};
package Perlito5::AST::Use;
do { for ($_) {
    sub Perlito5::AST::Use::emit_perl6 {
        ((my  $self) = shift());
        ((my  $level) = shift());
        ((my  $mod) = $self->{'mod'});
        if (((($mod eq 'feature') || ($mod eq 'strict')) || ($mod eq 'v5'))) {
            return ()
        };
        (Perlito5::Perl6::tab($level) . 'use ' . $self->{'mod'} . ';')
    }
}};

1;
