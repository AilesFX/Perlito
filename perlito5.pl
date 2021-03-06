# Do not edit this file - Generated by Perlito5 9.0
use v5.10;
use Perlito5::Perl5::Runtime;
package main;
undef();
package Perlito;
use Perlito5::Match;
use Perlito5::Emitter::Token;
use Perlito5::Expression;
use Perlito5::Grammar::Control;
use Perlito5::Grammar::Regex;
use Perlito5::Grammar;
use Perlito5::Javascript::Emitter;
use Perlito5::Javascript::Runtime;
use Perlito5::Javascript::CORE;
use Perlito5::Javascript::IO;
use Perlito5::Macro;
use Perlito5::Perl5::Emitter;
use Perlito5::Perl6::Emitter;
use Perlito5::Precedence;
use Perlito5::Runtime;
use Perlito5::Dumper;
((my  $_V5_COMPILER_NAME) = 'Perlito5');
((my  $_V5_COMPILER_VERSION) = '9.0');
((my  $source) = '');
((my  $backend) = ${^O});
((my  $execute) = 1);
((my  $verbose) = 0);
((my  $expand_use) = 1);
if ($verbose) {
    warn('// Perlito5 compiler');
    warn(('// ARGV: ' . join(' ', @ARGV)))
};
((my  $help_message) = chr(10) . 'perlito5 [switches] [programfile]' . chr(10) . '  switches:' . chr(10) . '    -h --help' . chr(10) . '    -v --verbose' . chr(10) . '    -V --version' . chr(10) . '    -Idirectory     specify @INC/include directory (several -I' . chr(39) . 's allowed)' . chr(10) . '    -Ctarget        target backend: js, perl5, perl6' . chr(10) . '    -Cast-perl5     emits a dump of the abstract syntax tree' . chr(10) . '    --expand_use --noexpand_use' . chr(10) . '                    expand ' . chr(39) . 'use' . chr(39) . ' statements at compile time' . chr(10) . '    -e program      one line of program (omit programfile)' . chr(10));
for ( ; ((substr($ARGV[0], 0, 1) eq '-') && (substr($ARGV[0], 0, 2) ne '-e')); do { for ($_) {

}} ) {
    if (((($ARGV[0] eq '-v')) || (($ARGV[0] eq '--verbose')))) {
        ($verbose = 1);
        shift(@ARGV)
    }
    else {
        if (($ARGV[0] eq '-I')) {
            shift(@ARGV);
            ($lib = shift(@ARGV));
            unshift(@INC, $lib)
        }
        else {
            if ((substr($ARGV[0], 0, 2) eq '-I')) {
                ($lib = substr($ARGV[0], 2, 10));
                unshift(@INC, $lib);
                shift(@ARGV)
            }
            else {
                if ((substr($ARGV[0], 0, 2) eq '-C')) {
                    ($backend = substr($ARGV[0], 2, 10));
                    ($execute = 0);
                    shift(@ARGV);
                    if ((((($backend eq 'perl5') || ($backend eq 'python')) || ($backend eq 'ruby')) || ($backend eq 'perl6'))) {
                        ($expand_use = 0)
                    }
                }
                else {
                    if (($ARGV[0] eq '-MO=Deparse')) {
                        ($backend = 'perl5');
                        ($execute = 0);
                        ($expand_use = 0);
                        shift(@ARGV)
                    }
                    else {
                        if ((substr($ARGV[0], 0, 2) eq '-B')) {
                            shift(@ARGV)
                        }
                        else {
                            if (((($ARGV[0] eq '-V')) || (($ARGV[0] eq '--version')))) {
                                ($backend = '');
                                Perlito5::Runtime::say($_V5_COMPILER_NAME, ' ', $_V5_COMPILER_VERSION);
                                shift(@ARGV)
                            }
                            else {
                                if (((($ARGV[0] eq '-h') || ($ARGV[0] eq '--help')) || !(@ARGV))) {
                                    ($backend = '');
                                    Perlito5::Runtime::say($_V5_COMPILER_NAME, ' ', $_V5_COMPILER_VERSION, $help_message);
                                    shift(@ARGV)
                                }
                                else {
                                    if (($ARGV[0] eq '--expand_use')) {
                                        ($expand_use = 1);
                                        shift(@ARGV)
                                    }
                                    else {
                                        if (($ARGV[0] eq '--noexpand_use')) {
                                            ($expand_use = 0);
                                            shift(@ARGV)
                                        }
                                        else {
                                            die(('Unrecognized switch: ' . $ARGV[0] . '  (-h will show valid options).' . chr(10)))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
};
if (($backend && @ARGV)) {
    if (($ARGV[0] eq '-e')) {
        shift(@ARGV);
        if ($verbose) {
            warn('// source from command line: ', $ARGV[0])
        };
        ($source = shift(@ARGV))
    }
    else {
        if ($verbose) {
            warn('// source from file: ', $ARGV[0])
        };
        ($source = Perlito5::IO::slurp(shift(@ARGV)))
    };
    if ($verbose) {
        warn('// backend: ', $backend);
        warn('now parsing')
    };
    ($Perlito5::PKG_NAME = 'main');
    ($Perlito5::PROTO = {});
    if ($execute) {
        ($Perlito5::EXPAND_USE = 1);
        (my  $ok);
        (do { my $m = Perlito5::Grammar->exp_stmts("do {" .             ('package main; no strict; ' . $source . ' ; $ok = 1') . "}", 0);my $source = Perlito5::Match::flat($m)->[0]->emit_perl5(0, "scalar");eval $source;});
        if (!($ok)) {
            ((my  $error) = ($@ || 'Unknown error'));
            warn($error);
            exit(255)
        }
    }
    else {
        (%INC = ());
        ($Perlito5::EXPAND_USE = 0);
        (my  $m);
        (my  $ok);
                    (do {
                ($m = Perlito5::Grammar->exp_stmts($source, 0));
                ($ok = 1)
            });
        if ((!($ok) || ($m->{'to'} != length($source)))) {
            ((my  $error) = (($@ || ((($m->{'to'} != length($source)) && ('Syntax Error near ' . $m->{'to'})))) || 'Unknown error'));
            warn($error);
            exit(255)
        }
        else {
            (my  $comp_units);
            if ($expand_use) {
                ($comp_units = Perlito5::Grammar::Use::add_comp_unit(Perlito5::Match::flat($m)))
            }
            else {
                ($comp_units = Perlito5::Match::flat($m))
            };
            ($comp_units = [Perlito5::AST::CompUnit->new('name', 'main', 'body', $comp_units)]);
            if (($backend eq 'perl5')) {
                Perlito5::Runtime::say('# Do not edit this file - Generated by ', $_V5_COMPILER_NAME, ' ', $_V5_COMPILER_VERSION);
                print(Perlito5::AST::CompUnit::emit_perl5_program($comp_units))
            };
            if (($backend eq 'perl6')) {
                Perlito5::Runtime::say('# Do not edit this file - Generated by ', $_V5_COMPILER_NAME, ' ', $_V5_COMPILER_VERSION);
                print(Perlito5::AST::CompUnit::emit_perl6_program($comp_units))
            };
            if (($backend eq 'js')) {
                Perlito5::Runtime::say('// Do not edit this file - Generated by ', $_V5_COMPILER_NAME, ' ', $_V5_COMPILER_VERSION);
                if ($expand_use) {
                    print(Perlito5::Javascript::Runtime->emit_javascript());
                    print(Perlito5::Javascript::CORE->emit_javascript());
                    print(Perlito5::Javascript::IO->emit_javascript())
                };
                print(Perlito5::AST::CompUnit::emit_javascript_program($comp_units))
            };
            if (($backend eq 'ast-perl5')) {
                Perlito5::Runtime::say(Perlito5::Dumper::Dumper($comp_units))
            }
            else {
                if (($backend eq 'ast-pretty')) {
                    (do { my $m = Perlito5::Grammar->exp_stmts("do {" .                         'use Data::Printer {colored=>1,class=>{expand=>"all",show_methods=>"none"}};p($comp_units);1' . "}", 0);my $source = Perlito5::Match::flat($m)->[0]->emit_perl5(0, "scalar");eval $source;});
                    print($@)
                }
            }
        }
    }
};

1;
