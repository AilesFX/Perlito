# Do not edit this file - Generated by MiniPerl6 4.1
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
our $MATCH = MiniPerl6::Match->new();
{
package MiniPerl6::Lisp::LexicalBlock;
sub new { shift; bless { @_ }, "MiniPerl6::Lisp::LexicalBlock" }
sub block { $_[0]->{block} };
sub emit_lisp { my $self = $_[0]; if (@{$self->{block}}) {  } else { return('nil') }; (my  $str = ''); (my  $has_my_decl = 0); (my  $my_decl = ''); my  $Hash_decl_seen; for my $decl ( @{$self->{block}} ) { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) { (my  $var_name = $decl->var()->emit_lisp());if ($Hash_decl_seen->{$var_name}) {  } else { ($has_my_decl = 1);($my_decl = $my_decl . Decl::emit_lisp_initializer($decl->var()));($Hash_decl_seen->{$var_name} = 1) } } else {  };if ((Main::isa($decl, 'Bind') && (Main::isa($decl->parameters(), 'Decl') && ($decl->parameters()->decl() eq 'my')))) { (my  $var_name = $decl->parameters()->var()->emit_lisp());if ($Hash_decl_seen->{$var_name}) {  } else { ($has_my_decl = 1);($my_decl = $my_decl . Decl::emit_lisp_initializer($decl->parameters()->var()));($Hash_decl_seen->{$var_name} = 1) } } else {  } }; if ($has_my_decl) { ($str = $str . '(let (' . $my_decl . ') ') } else { ($str = $str . '(progn ') }; for my $decl ( @{$self->{block}} ) { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) {  } else { ($str = $str . $decl->emit_lisp()) } }; return($str . ')') }
}

{
package CompUnit;
sub new { shift; bless { @_ }, "CompUnit" }
sub name { $_[0]->{name} };
sub attributes { $_[0]->{attributes} };
sub methods { $_[0]->{methods} };
sub body { $_[0]->{body} };
sub emit_lisp { my $self = $_[0]; (my  $class_name = Main::to_lisp_namespace($self->{name})); (my  $str = ';; class ' . $self->{name} . Main->newline()); (my  $has_my_decl = 0); (my  $my_decl = ''); my  $Hash_decl_seen; for my $decl ( @{$self->{body}} ) { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my'))) { (my  $var_name = $decl->var()->emit_lisp());if ($Hash_decl_seen->{$var_name}) {  } else { ($has_my_decl = 1);($my_decl = $my_decl . Decl::emit_lisp_initializer($decl->var()));($Hash_decl_seen->{$var_name} = 1) } } else {  };if ((Main::isa($decl, 'Bind') && (Main::isa($decl->parameters(), 'Decl') && ($decl->parameters()->decl() eq 'my')))) { (my  $var_name = $decl->parameters()->var()->emit_lisp());if ($Hash_decl_seen->{$var_name}) {  } else { ($has_my_decl = 1);($my_decl = $my_decl . Decl::emit_lisp_initializer($decl->parameters()->var()));($Hash_decl_seen->{$var_name} = 1) } } else {  } }; if ($has_my_decl) { ($str = $str . '(let (' . $my_decl . ')' . Main->newline()) } else {  }; ($str = $str . '(if (not (ignore-errors (find-class \'' . $class_name . ')))
  (defclass ' . $class_name . ' () ()))

(let (x) 
  (setq x (make-instance \'' . $class_name . '))
  (defun proto-' . $class_name . ' () x))
'); (my  $dumper = ''); for my $decl ( @{$self->{body}} ) { if ((Main::isa($decl, 'Decl') && ($decl->decl() eq 'has'))) { (my  $accessor_name = $decl->var()->name());($dumper = $dumper . '(let ((m (make-instance \'mp-Pair))) ' . '(setf (sv-key m) "' . Main::lisp_escape_string($accessor_name) . '") ' . '(setf (sv-value m) (' . Main::to_lisp_identifier($accessor_name) . ' self)) m) ');($str = $str . ';; has $.' . $accessor_name . '
(let ((new-slots (list (list :name \'' . Main::to_lisp_identifier($accessor_name) . '
  :readers \'(' . Main::to_lisp_identifier($accessor_name) . ')
  :writers \'((setf ' . Main::to_lisp_identifier($accessor_name) . '))
  :initform \'(sv-undef)
  :initfunction (constantly (sv-undef))))))
(dolist (slot-defn (sb-mop:class-direct-slots (find-class \'' . $class_name . ')))
(push (list :name (sb-mop:slot-definition-name slot-defn)
  :readers (sb-mop:slot-definition-readers slot-defn)
  :writers (sb-mop:slot-definition-writers slot-defn)
  :initform (sb-mop:slot-definition-initform slot-defn)
  :initfunction (sb-mop:slot-definition-initfunction slot-defn))
new-slots))
(sb-mop:ensure-class \'' . $class_name . ' :direct-slots new-slots))

') } else {  };if (Main::isa($decl, 'Method')) { (my  $sig = $decl->sig());(my  $invocant = $sig->invocant());(my  $pos = $sig->positional());(my  $str_specific = '(' . $invocant->emit_lisp() . ' ' . $class_name . ')');(my  $str_generic = $invocant->emit_lisp());(my  $str_optionals = '');for my $field ( @{$pos} ) { ($str_optionals = $str_optionals . ' ' . $field->emit_lisp()) };if ($str_optionals) { ($str_specific = $str_specific . ' &optional' . $str_optionals);($str_generic = $str_generic . ' &optional' . $str_optionals) } else {  };(my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $decl->block(), ));($str = $str . ';; method ' . $decl->name() . '
(if (not (ignore-errors (find-method \'' . Main::to_lisp_identifier($decl->name()) . ' () ())))
  (defgeneric ' . Main::to_lisp_identifier($decl->name()) . ' (' . $str_generic . ')' . Main->newline());($str = $str . '      (:documentation ' . '"' . 'a method' . '"' . ')))
(defmethod ' . Main::to_lisp_identifier($decl->name()) . ' (' . $str_specific . ')
  (block mp6-function
    ' . $block->emit_lisp() . '))

') } else {  };if (Main::isa($decl, 'Sub')) { (my  $pos = $decl->sig()->positional());my  $param;if (@{$pos}) { for my $field ( @{$pos} ) { ($param = $param . $field->emit_lisp() . ' ') } } else {  };(my  $sig = '');if ($param) { ($sig = '&optional ' . $param) } else {  };(my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $decl->block(), ));($str = $str . '(defun ' . $class_name . '-' . Main::to_lisp_identifier($decl->name()) . ' (' . $sig . ')' . '
' . '  (block mp6-function ' . $block->emit_lisp() . '))' . '
' . '(in-package ' . $class_name . ')' . '
' . '  (defun ' . Main::to_lisp_identifier($decl->name()) . ' (' . $sig . ')' . '
' . '    (mp-Main::' . $class_name . '-' . Main::to_lisp_identifier($decl->name()) . ' ' . $param . '))' . '
' . '(in-package mp-Main)' . '
') } else {  } }; if (($self->{name} ne 'Pair')) { ($str = $str . '(defmethod sv-perl ((self ' . $class_name . '))' . Main->newline() . '  (mp-Main::sv-lisp_dump_object "::' . Main::lisp_escape_string($self->{name}) . '"' . ' (list ' . $dumper . ')))' . Main->newline() . Main->newline()) } else {  }; for my $decl ( @{$self->{body}} ) { if ((((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has') || ($decl->decl() eq 'my'))) ? 0 : 1) && ((Main::isa($decl, 'Method') ? 0 : 1) && (Main::isa($decl, 'Sub') ? 0 : 1)))) { ($str = $str . $decl->emit_lisp() . Main->newline()) } else {  } }; if ($has_my_decl) { ($str = $str . ')') } else {  }; ($str = $str . Main->newline() . Main->newline()) };
sub emit_lisp_program { my $comp_units = $_[0]; (my  $str = ''); for my $comp_unit ( @{$comp_units} ) { ($str = $str . '(defpackage ' . Main::to_lisp_namespace($comp_unit->name()) . '
' . '  (:use common-lisp mp-Main))' . '
') }; for my $comp_unit ( @{$comp_units} ) { ($str = $str . $comp_unit->emit_lisp() . '
') }; return($str) }
}

{
package Val::Int;
sub new { shift; bless { @_ }, "Val::Int" }
sub int { $_[0]->{int} };
sub emit_lisp { my $self = $_[0]; $self->{int} }
}

{
package Val::Bit;
sub new { shift; bless { @_ }, "Val::Bit" }
sub bit { $_[0]->{bit} };
sub emit_lisp { my $self = $_[0]; $self->{bit} }
}

{
package Val::Num;
sub new { shift; bless { @_ }, "Val::Num" }
sub num { $_[0]->{num} };
sub emit_lisp { my $self = $_[0]; $self->{num} }
}

{
package Val::Buf;
sub new { shift; bless { @_ }, "Val::Buf" }
sub buf { $_[0]->{buf} };
sub emit_lisp { my $self = $_[0]; '"' . Main::lisp_escape_string($self->{buf}) . '"' }
}

{
package Val::Undef;
sub new { shift; bless { @_ }, "Val::Undef" }
sub emit_lisp { my $self = $_[0]; '(sv-undef)' }
}

{
package Val::Object;
sub new { shift; bless { @_ }, "Val::Object" }
sub class { $_[0]->{class} };
sub fields { $_[0]->{fields} };
sub emit_lisp { my $self = $_[0]; 'bless(' . Main::perl($self->{fields}, ) . ', ' . Main::perl($self->{class}, ) . ')' }
}

{
package Lit::Array;
sub new { shift; bless { @_ }, "Lit::Array" }
sub array1 { $_[0]->{array1} };
sub emit_lisp { my $self = $_[0]; if (@{$self->{array1}}) { (my  $str = '');for my $elem ( @{$self->{array1}} ) { if (((Main::isa($elem, 'Var') && ($elem->sigil() eq '@')) || (Main::isa($elem, 'Apply') && ($elem->code() eq 'prefix:<@>')))) { ($str = $str . ' (coerce ' . $elem->emit_lisp() . ' \'list)') } else { ($str = $str . ' (list ' . $elem->emit_lisp() . ')') } };return('(let ((_tmp_ (concatenate \'list ' . $str . '))) ' . '(make-array (length _tmp_) :adjustable 1 :fill-pointer t :initial-contents _tmp_))') } else { return('(make-array 0 :adjustable 1 :fill-pointer t)') } }
}

{
package Lit::Hash;
sub new { shift; bless { @_ }, "Lit::Hash" }
sub hash1 { $_[0]->{hash1} };
sub emit_lisp { my $self = $_[0]; if (@{$self->{hash1}}) { (my  $fields = $self->{hash1});(my  $str = '');for my $field ( @{$fields} ) { ($str = $str . '(setf (mp-Main::sv-hash-lookup ' . $field->[0]->emit_lisp() . ' h) ' . $field->[1]->emit_lisp() . ')') };return('(let ((h (make-hash-table :test \'equal))) ' . $str . ' h)') } else { return('(make-hash-table :test \'equal)') } }
}

{
package Lit::Code;
sub new { shift; bless { @_ }, "Lit::Code" }

}

{
package Lit::Object;
sub new { shift; bless { @_ }, "Lit::Object" }
sub class { $_[0]->{class} };
sub fields { $_[0]->{fields} };
sub emit_lisp { my $self = $_[0]; if (@{$self->{fields}}) { (my  $fields = $self->{fields});(my  $str = '');for my $field ( @{$fields} ) { ($str = $str . '(setf (' . Main::to_lisp_identifier($field->[0]->buf()) . ' m) ' . $field->[1]->emit_lisp() . ')') };'(let ((m (make-instance \'' . Main::to_lisp_namespace($self->{class}) . '))) ' . $str . ' m)' } else { return('(make-instance \'' . Main::to_lisp_namespace($self->{class}) . ')') } }
}

{
package Index;
sub new { shift; bless { @_ }, "Index" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_lisp { my $self = $_[0]; return('(mp-Main::sv-array-index ' . $self->{obj}->emit_lisp() . ' ' . $self->{index_exp}->emit_lisp() . ')') }
}

{
package Lookup;
sub new { shift; bless { @_ }, "Lookup" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_lisp { my $self = $_[0]; return('(mp-Main::sv-hash-lookup ' . $self->{index_exp}->emit_lisp() . ' ' . $self->{obj}->emit_lisp() . ')') }
}

{
package Var;
sub new { shift; bless { @_ }, "Var" }
sub sigil { $_[0]->{sigil} };
sub twigil { $_[0]->{twigil} };
sub namespace { $_[0]->{namespace} };
sub name { $_[0]->{name} };
sub emit_lisp { my $self = $_[0]; (my  $ns = ''); if ($self->{namespace}) { ($ns = Main::to_lisp_namespace($self->{namespace}) . '::') } else { if ((($self->{sigil} eq '@') && (($self->{twigil} eq '*') && ($self->{name} eq 'ARGS')))) { return('*mp6-args*') } else {  } }; (($self->{twigil} eq '.') ? '(' . Main::to_lisp_identifier($self->{name}) . ' sv-self)' : (($self->{name} eq '/') ? Main::to_lisp_identifier('MATCH') : $ns . Main::to_lisp_identifier($self->{name}))) }
}

{
package Bind;
sub new { shift; bless { @_ }, "Bind" }
sub parameters { $_[0]->{parameters} };
sub arguments { $_[0]->{arguments} };
sub emit_lisp { my $self = $_[0]; if (Main::isa($self->{parameters}, 'Lit::Object')) { (my  $class = $self->{parameters}->class());(my  $a = $self->{parameters}->fields());(my  $b = $self->{arguments});(my  $str = 'do { ');(my  $i = 0);my  $arg;for my $var ( @{$a} ) { (my  $bind = Bind->new( 'parameters' => $var->[1],'arguments' => Call->new( 'invocant' => $b,'method' => $var->[0]->buf(),'arguments' => [],'hyper' => 0, ), ));($str = $str . ' ' . $bind->emit_lisp() . ' ');($i = ($i + 1)) };return($str . $self->{parameters}->emit_lisp() . ' }') } else {  }; if ((Main::isa($self->{parameters}, 'Decl') && ($self->{parameters}->decl() eq 'my'))) { return('(setf ' . $self->{parameters}->var()->emit_lisp() . ' ' . $self->{arguments}->emit_lisp() . ')') } else {  }; '(setf ' . $self->{parameters}->emit_lisp() . ' ' . $self->{arguments}->emit_lisp() . ')' }
}

{
package Proto;
sub new { shift; bless { @_ }, "Proto" }
sub name { $_[0]->{name} };
sub emit_lisp { my $self = $_[0]; '(proto-' . Main::to_lisp_namespace($self->{name}) . ')' }
}

{
package Call;
sub new { shift; bless { @_ }, "Call" }
sub invocant { $_[0]->{invocant} };
sub hyper { $_[0]->{hyper} };
sub method { $_[0]->{method} };
sub arguments { $_[0]->{arguments} };
sub emit_lisp { my $self = $_[0]; (my  $arguments = Main::join([ map { $_->emit_lisp() } @{ $self->{arguments} } ], ' ')); (my  $invocant = $self->{invocant}->emit_lisp()); if (($invocant eq 'self')) { ($invocant = 'sv-self') } else {  }; if (($self->{method} eq 'isa')) { if (($self->{arguments}->[0]->buf() eq 'Str')) { return('(typep ' . $invocant . ' \'string)') } else {  };return('(typep ' . $invocant . ' \'' . Main::to_lisp_namespace($self->{arguments}->[0]->buf()) . ')') } else {  }; if (($self->{method} eq 'chars')) { if ($self->{hyper}) { die('not implemented') } else { return('(length ' . $invocant . ')') } } else {  }; if ((($self->{method} eq 'yaml') || ($self->{method} eq 'say'))) { if ($self->{hyper}) { return('[ map { ' . $self->{method} . '( $_, ' . ', ' . $arguments . ')' . ' } @{ ' . $invocant . ' } ]') } else { return('(' . $self->{method} . ' ' . $invocant . ' ' . $arguments . ')') } } else {  }; (my  $meth = Main::to_lisp_identifier($self->{method}) . ' '); if (($self->{method} eq 'postcircumfix:<( )>')) { return('(funcall ' . $invocant . ' ' . $arguments . ')') } else {  }; if ($self->{hyper}) { return('(map \'vector #\'(lambda (c) (' . $meth . ' c)) ' . $invocant . ')') } else { return('(' . $meth . $invocant . ' ' . $arguments . ')') } }
}

{
package Apply;
sub new { shift; bless { @_ }, "Apply" }
sub code { $_[0]->{code} };
sub arguments { $_[0]->{arguments} };
sub namespace { $_[0]->{namespace} };
sub emit_lisp { my $self = $_[0]; (my  $ns = ''); if ($self->{namespace}) { ($ns = Main::to_lisp_namespace($self->{namespace}) . '::') } else {  }; (my  $code = $ns . $self->{code}); if (($code eq 'infix:<~>')) { return('(concatenate \'string (sv-string ' . $self->{arguments}->[0]->emit_lisp() . ') (sv-string ' . $self->{arguments}->[1]->emit_lisp() . '))') } else {  }; if (($code eq 'ternary:<?? !!>')) { return('(if (sv-bool ' . $self->{arguments}->[0]->emit_lisp() . ') ' . $self->{arguments}->[1]->emit_lisp() . ' ' . $self->{arguments}->[2]->emit_lisp() . ')') } else {  }; (my  $args = ''); if (@{$self->{arguments}}) { ($args = Main::join([ map { $_->emit_lisp() } @{ $self->{arguments} } ], ' ')) } else {  }; if (($code eq 'self')) { return('sv-self') } else {  }; if (($code eq 'false')) { return('nil') } else {  }; if (($code eq 'make')) { return('(setf (sv-capture sv-MATCH) ' . $args . ')') } else {  }; if (($code eq 'substr')) { return('(sv-substr ' . $args . ')') } else {  }; if (($code eq 'say')) { return('(mp-Main::sv-say (list ' . $args . '))') } else {  }; if (($code eq 'print')) { return('(mp-Main::sv-print (list ' . $args . '))') } else {  }; if (($code eq 'warn')) { return('(write-line (format nil "~{~a~}" (list ' . $args . ')) *error-output*)') } else {  }; if (($code eq 'die')) { return('(progn (write-line (format nil "~{~a~}" (list ' . $args . ')) *error-output*) (sb-ext:quit))') } else {  }; if (($code eq 'array')) { return($args) } else {  }; if (($code eq 'exists')) { (my  $arg = $self->{arguments}->[0]);if (Main::isa($arg, 'Lookup')) { return('(nth-value 1 ' . $arg->emit_lisp() . ')') } else {  } } else {  }; if (($code eq 'prefix:<~>')) { return('(sv-string ' . $args . ')') } else {  }; if (($code eq 'prefix:<!>')) { return('(not (sv-bool ' . $args . '))') } else {  }; if (($code eq 'prefix:<?>')) { return('(sv-bool ' . $args . ')') } else {  }; if (($code eq 'prefix:<$>')) { return('(sv-scalar ' . $args . ')') } else {  }; if (($code eq 'prefix:<@>')) { return($args) } else {  }; if (($code eq 'prefix:<%>')) { return($args) } else {  }; if (($code eq 'infix:<+>')) { return('(sv-add ' . $args . ')') } else {  }; if (($code eq 'infix:<->')) { return('(sv-sub ' . $args . ')') } else {  }; if (($code eq 'infix:<*>')) { return('(sv-mul ' . $args . ')') } else {  }; if (($code eq 'infix:</>')) { return('(sv-div ' . $args . ')') } else {  }; if (($code eq 'infix:<>>')) { return('(sv-numeric-bigger ' . $args . ')') } else {  }; if (($code eq 'infix:<<>')) { return('(sv-numeric-smaller ' . $args . ')') } else {  }; if (($code eq 'infix:<>=>')) { return('(sv-numeric-bigger-equal ' . $args . ')') } else {  }; if (($code eq 'infix:<<=>')) { return('(sv-numeric-smaller-equal ' . $args . ')') } else {  }; if (($code eq 'infix:<==>')) { return('(sv-numeric-equal ' . $args . ')') } else {  }; if (($code eq 'infix:<!=>')) { return('(not (sv-numeric-equal ' . $args . '))') } else {  }; if (($code eq 'infix:<&&>')) { return('(sv-and ' . $args . ')') } else {  }; if (($code eq 'infix:<||>')) { return('(sv-or ' . $args . ')') } else {  }; if (($code eq 'infix:<eq>')) { return('(sv-eq ' . $args . ')') } else {  }; if (($code eq 'infix:<ne>')) { return('(not (sv-eq ' . $args . '))') } else {  }; return('(' . $ns . Main::to_lisp_identifier($self->{code}) . ' ' . $args . ')') }
}

{
package Return;
sub new { shift; bless { @_ }, "Return" }
sub result { $_[0]->{result} };
sub emit_lisp { my $self = $_[0]; return('(return-from mp6-function ' . $self->{result}->emit_lisp() . ')') }
}

{
package If;
sub new { shift; bless { @_ }, "If" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub otherwise { $_[0]->{otherwise} };
sub emit_lisp { my $self = $_[0]; (my  $block1 = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{body}, )); (my  $block2 = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{otherwise}, )); '(if (sv-bool ' . $self->{cond}->emit_lisp() . ') ' . $block1->emit_lisp() . ' ' . $block2->emit_lisp() . ')' }
}

{
package For;
sub new { shift; bless { @_ }, "For" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub topic { $_[0]->{topic} };
sub emit_lisp { my $self = $_[0]; (my  $cond = $self->{cond}); (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{body}, )); if ((Main::isa($cond, 'Var') && ($cond->sigil() eq '@'))) { ($cond = Apply->new( 'code' => 'prefix:<@>','arguments' => [$cond], )) } else {  }; '(loop for ' . $self->{topic}->emit_lisp() . ' across ' . $cond->emit_lisp() . ' do ' . $block->emit_lisp() . ')' }
}

{
package While;
sub new { shift; bless { @_ }, "While" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub emit_lisp { my $self = $_[0]; '(loop while (sv-bool ' . $self->{cond}->emit_lisp() . ') do ' . MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{body}, )->emit_lisp() . ')' }
}

{
package Decl;
sub new { shift; bless { @_ }, "Decl" }
sub decl { $_[0]->{decl} };
sub type { $_[0]->{type} };
sub var { $_[0]->{var} };
sub emit_lisp { my $self = $_[0]; (my  $decl = $self->{decl}); (my  $name = $self->{var}->name()); (($decl eq 'has') ? 'sub ' . $name . ' { ' . '@_ == 1 ' . '? ( $_[0]->{' . $name . '} ) ' . ': ( $_[0]->{' . $name . '} = $_[1] ) ' . '}' : $self->{decl} . ' ' . $self->{type} . ' ' . $self->{var}->emit_lisp()) };
sub emit_lisp_initializer { my $decl = $_[0]; if (($decl->sigil() eq '%')) { return('(' . $decl->emit_lisp() . ' (make-hash-table :test \'equal))') } else { if (($decl->sigil() eq '@')) { return('(' . $decl->emit_lisp() . ' (make-array 0 :fill-pointer t :adjustable t))') } else { return('(' . $decl->emit_lisp() . ' (sv-undef))') } } }
}

{
package Sig;
sub new { shift; bless { @_ }, "Sig" }
sub invocant { $_[0]->{invocant} };
sub positional { $_[0]->{positional} };
sub named { $_[0]->{named} };
sub emit_lisp { my $self = $_[0]; ' print \'Signature - TODO\'; die \'Signature - TODO\'; ' }
}

{
package Method;
sub new { shift; bless { @_ }, "Method" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_lisp { my $self = $_[0];  }
}

{
package Sub;
sub new { shift; bless { @_ }, "Sub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_lisp { my $self = $_[0]; (my  $sig = $self->{sig}); (my  $pos = $sig->positional()); (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{block}, )); my  $str; if (@{$pos}) { for my $field ( @{$pos} ) { ($str = $str . $field->emit_lisp() . ' ') } } else {  }; if ($str) { ($str = '&optional ' . $str) } else {  }; if ($self->{name}) { '(defun ' . Main::to_lisp_identifier($self->{name}) . ' (' . $str . ')' . Main->newline() . '  (block mp6-function ' . $block->emit_lisp() . '))' . Main->newline() } else { '(lambda ' . $self->{name} . ' (' . $str . ')' . Main->newline() . '  (block mp6-function ' . $block->emit_lisp() . '))' . Main->newline() } }
}

{
package Do;
sub new { shift; bless { @_ }, "Do" }
sub block { $_[0]->{block} };
sub emit_lisp { my $self = $_[0]; (my  $block = MiniPerl6::Lisp::LexicalBlock->new( 'block' => $self->{block}, )); return($block->emit_lisp()) }
}

{
package Use;
sub new { shift; bless { @_ }, "Use" }
sub mod { $_[0]->{mod} };
sub emit_lisp { my $self = $_[0]; Main->newline() . ';; use ' . Main::to_lisp_namespace($self->{mod}) . Main->newline() }
}

1;
