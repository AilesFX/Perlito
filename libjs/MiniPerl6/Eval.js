// Do not edit this file - Generated by MiniPerl6 3.0
// class EvalFunction
if (typeof EvalFunction != 'object') {
  EvalFunction = function() {};
  EvalFunction = new EvalFunction;
  EvalFunction.f_isa = function (s) { return s == 'EvalFunction' };
  EvalFunction.f_perl = function () { return '::EvalFunction(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = EvalFunction;
  // accessor func
  EvalFunction.v_func = null;
  EvalFunction.f_func = function () { return this.v_func }
  // method apply
  EvalFunction.f_apply = function (v_env, v_args) {
    var v_self = this;
    try { return((v_self.v_func)(v_env, v_args)) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  EvalFunction.f_apply;  // v8 bug workaround
})();

// class CompUnit
if (typeof CompUnit != 'object') {
  CompUnit = function() {};
  CompUnit = new CompUnit;
  CompUnit.f_isa = function (s) { return s == 'CompUnit' };
  CompUnit.f_perl = function () { return '::CompUnit(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = CompUnit;
  // accessor name
  CompUnit.v_name = null;
  CompUnit.f_name = function () { return this.v_name }
  // accessor attributes
  CompUnit.v_attributes = null;
  CompUnit.f_attributes = function () { return this.v_attributes }
  // accessor methods
  CompUnit.v_methods = null;
  CompUnit.f_methods = function () { return this.v_methods }
  // accessor body
  CompUnit.v_body = null;
  CompUnit.f_body = function () { return this.v_body }
  // method eval
  CompUnit.f_eval = function (v_env) {
    var v_self = this;
    try { var v_env1;(v_env1 = (function () { var a = []; a.push({  }); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { v_stmt.f_eval(v_env1) })(a_[i_]) } })(v_self.v_body) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  CompUnit.f_eval;  // v8 bug workaround
})();

// class Val::Int
if (typeof Val$Int != 'object') {
  Val$Int = function() {};
  Val$Int = new Val$Int;
  Val$Int.f_isa = function (s) { return s == 'Val::Int' };
  Val$Int.f_perl = function () { return '::Val::Int(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Int;
  // accessor int
  Val$Int.v_int = null;
  Val$Int.f_int = function () { return this.v_int }
  // method eval
  Val$Int.f_eval = function (v_env) {
    var v_self = this;
    try { return(parseInt(v_self.v_int)) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Int.f_eval;  // v8 bug workaround
})();

// class Val::Bit
if (typeof Val$Bit != 'object') {
  Val$Bit = function() {};
  Val$Bit = new Val$Bit;
  Val$Bit.f_isa = function (s) { return s == 'Val::Bit' };
  Val$Bit.f_perl = function () { return '::Val::Bit(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Bit;
  // accessor bit
  Val$Bit.v_bit = null;
  Val$Bit.f_bit = function () { return this.v_bit }
  // method eval
  Val$Bit.f_eval = function (v_env) {
    var v_self = this;
    try { return(v_self.v_bit) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Bit.f_eval;  // v8 bug workaround
})();

// class Val::Num
if (typeof Val$Num != 'object') {
  Val$Num = function() {};
  Val$Num = new Val$Num;
  Val$Num.f_isa = function (s) { return s == 'Val::Num' };
  Val$Num.f_perl = function () { return '::Val::Num(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Num;
  // accessor num
  Val$Num.v_num = null;
  Val$Num.f_num = function () { return this.v_num }
  // method eval
  Val$Num.f_eval = function (v_env) {
    var v_self = this;
    try { return(parseFloat(v_self.v_num)) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Num.f_eval;  // v8 bug workaround
})();

// class Val::Buf
if (typeof Val$Buf != 'object') {
  Val$Buf = function() {};
  Val$Buf = new Val$Buf;
  Val$Buf.f_isa = function (s) { return s == 'Val::Buf' };
  Val$Buf.f_perl = function () { return '::Val::Buf(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Buf;
  // accessor buf
  Val$Buf.v_buf = null;
  Val$Buf.f_buf = function () { return this.v_buf }
  // method eval
  Val$Buf.f_eval = function (v_env) {
    var v_self = this;
    try { return(v_self.v_buf) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Buf.f_eval;  // v8 bug workaround
})();

// class Val::Undef
if (typeof Val$Undef != 'object') {
  Val$Undef = function() {};
  Val$Undef = new Val$Undef;
  Val$Undef.f_isa = function (s) { return s == 'Val::Undef' };
  Val$Undef.f_perl = function () { return '::Val::Undef(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Undef;
  // method eval
  Val$Undef.f_eval = function (v_env) {
    var v_self = this;
    try { return(null) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Undef.f_eval;  // v8 bug workaround
})();

// class Val::Object
if (typeof Val$Object != 'object') {
  Val$Object = function() {};
  Val$Object = new Val$Object;
  Val$Object.f_isa = function (s) { return s == 'Val::Object' };
  Val$Object.f_perl = function () { return '::Val::Object(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Val$Object;
  // accessor class
  Val$Object.v_class = null;
  Val$Object.f_class = function () { return this.v_class }
  // accessor fields
  Val$Object.v_fields = null;
  Val$Object.f_fields = function () { return this.v_fields }
  // method eval
  Val$Object.f_eval = function (v_env) {
    var v_self = this;
    try { f_warn("Interpreter TODO: Val::Object");return(( f_string("bless(") + f_string(( f_string(f_perl(v_self.v_fields)) + f_string(( f_string(", ") + f_string(( f_string(f_perl(v_self.v_class)) + f_string(")") )) )) )) )) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Val$Object.f_eval;  // v8 bug workaround
})();

// class Lit::Seq
if (typeof Lit$Seq != 'object') {
  Lit$Seq = function() {};
  Lit$Seq = new Lit$Seq;
  Lit$Seq.f_isa = function (s) { return s == 'Lit::Seq' };
  Lit$Seq.f_perl = function () { return '::Lit::Seq(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Lit$Seq;
  // accessor seq
  Lit$Seq.v_seq = null;
  Lit$Seq.f_seq = function () { return this.v_seq }
  // method eval
  Lit$Seq.f_eval = function (v_env) {
    var v_self = this;
    try { return(f_warn("Interpreter TODO: Lit::Seq")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Lit$Seq.f_eval;  // v8 bug workaround
})();

// class Lit::Array
if (typeof Lit$Array != 'object') {
  Lit$Array = function() {};
  Lit$Array = new Lit$Array;
  Lit$Array.f_isa = function (s) { return s == 'Lit::Array' };
  Lit$Array.f_perl = function () { return '::Lit::Array(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Lit$Array;
  // accessor array1
  Lit$Array.v_array1 = null;
  Lit$Array.f_array1 = function () { return this.v_array1 }
  // method eval
  Lit$Array.f_eval = function (v_env) {
    var v_self = this;
    try { var List_a = [];
(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_v) { f_push(List_a, v_v.f_eval(v_env)) })(a_[i_]) } })(v_self.v_array1);throw(List_a) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Lit$Array.f_eval;  // v8 bug workaround
})();

// class Lit::Hash
if (typeof Lit$Hash != 'object') {
  Lit$Hash = function() {};
  Lit$Hash = new Lit$Hash;
  Lit$Hash.f_isa = function (s) { return s == 'Lit::Hash' };
  Lit$Hash.f_perl = function () { return '::Lit::Hash(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Lit$Hash;
  // accessor hash1
  Lit$Hash.v_hash1 = null;
  Lit$Hash.f_hash1 = function () { return this.v_hash1 }
  // method eval
  Lit$Hash.f_eval = function (v_env) {
    var v_self = this;
    try { var Hash_h = {};
(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_field) { (Hash_h[v_field[0].f_eval(v_env)] = v_field[1].f_eval(v_env)) })(a_[i_]) } })(v_self.v_hash1);throw(Hash_h) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Lit$Hash.f_eval;  // v8 bug workaround
})();

// class Lit::Object
if (typeof Lit$Object != 'object') {
  Lit$Object = function() {};
  Lit$Object = new Lit$Object;
  Lit$Object.f_isa = function (s) { return s == 'Lit::Object' };
  Lit$Object.f_perl = function () { return '::Lit::Object(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Lit$Object;
  // accessor class
  Lit$Object.v_class = null;
  Lit$Object.f_class = function () { return this.v_class }
  // accessor fields
  Lit$Object.v_fields = null;
  Lit$Object.f_fields = function () { return this.v_fields }
  // method eval
  Lit$Object.f_eval = function (v_env) {
    var v_self = this;
    try { var v_fields;var v_str;f_warn("Interpreter TODO: Lit::Object");(v_fields = v_self.v_fields);(v_str = "");(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_field) { (v_str = ( f_string(v_str) + f_string(( f_string(v_field[0].f_eval()) + f_string(( f_string(" => ") + f_string(( f_string(v_field[1].f_eval()) + f_string(",") )) )) )) )) })(a_[i_]) } })((v_fields));return(( f_string(v_self.v_class) + f_string(( f_string("->new( ") + f_string(( f_string(v_str) + f_string(" )") )) )) )) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Lit$Object.f_eval;  // v8 bug workaround
})();

// class Index
if (typeof Index != 'object') {
  Index = function() {};
  Index = new Index;
  Index.f_isa = function (s) { return s == 'Index' };
  Index.f_perl = function () { return '::Index(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Index;
  // accessor obj
  Index.v_obj = null;
  Index.f_obj = function () { return this.v_obj }
  // accessor index_exp
  Index.v_index_exp = null;
  Index.f_index_exp = function () { return this.v_index_exp }
  // method eval
  Index.f_eval = function (v_env) {
    var v_self = this;
    try { return(v_self.v_obj.f_eval(v_env)[v_self.v_index_exp.f_eval(v_env)]) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Index.f_eval;  // v8 bug workaround
})();

// class Lookup
if (typeof Lookup != 'object') {
  Lookup = function() {};
  Lookup = new Lookup;
  Lookup.f_isa = function (s) { return s == 'Lookup' };
  Lookup.f_perl = function () { return '::Lookup(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Lookup;
  // accessor obj
  Lookup.v_obj = null;
  Lookup.f_obj = function () { return this.v_obj }
  // accessor index_exp
  Lookup.v_index_exp = null;
  Lookup.f_index_exp = function () { return this.v_index_exp }
  // method eval
  Lookup.f_eval = function (v_env) {
    var v_self = this;
    try { return(v_self.v_obj.f_eval(v_env)[v_self.v_index_exp.f_eval(v_env)]) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Lookup.f_eval;  // v8 bug workaround
})();

// class Var
if (typeof Var != 'object') {
  Var = function() {};
  Var = new Var;
  Var.f_isa = function (s) { return s == 'Var' };
  Var.f_perl = function () { return '::Var(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Var;
  // accessor sigil
  Var.v_sigil = null;
  Var.f_sigil = function () { return this.v_sigil }
  // accessor twigil
  Var.v_twigil = null;
  Var.f_twigil = function () { return this.v_twigil }
  // accessor namespace
  Var.v_namespace = null;
  Var.f_namespace = function () { return this.v_namespace }
  // accessor name
  Var.v_name = null;
  Var.f_name = function () { return this.v_name }
  // method eval
  Var.f_eval = function (v_env) {
    var v_self = this;
    try { var v_ns;var v_name;(v_ns = "");if ( f_bool(v_self.v_namespace) ) { (function () { (v_ns = ( f_string(v_self.v_namespace) + f_string("::") )); })() } else { (function () { if ( f_bool(( f_bool((v_self.v_sigil == "@")) && f_bool(( f_bool((v_self.v_twigil == "*")) && f_bool((v_self.v_name == "ARGS")) )) )) ) { (function () { throw(List_ARGS); })() } else { (function () { null })() };if ( f_bool((v_self.v_twigil == ".")) ) { (function () { f_warn(( f_string("Interpreter TODO: $.") + f_string(v_self.v_name) ));throw(( f_string("$self->{") + f_string(( f_string(v_self.v_name) + f_string("}") )) )); })() } else { (function () { null })() };if ( f_bool((v_self.v_name == "/")) ) { (function () { f_warn("Interpreter TODO: $/");throw(( f_string(v_self.v_sigil) + f_string("MATCH") )); })() } else { (function () { null })() }; })() };(v_name = ( f_string(v_self.v_sigil) + f_string(( f_string(v_ns) + f_string(v_self.v_name) )) ));(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_e) { if ( f_bool((v_e).hasOwnProperty(v_name)) ) { (function () { throw(v_e[v_name]); })() } else { (function () { null })() } })(a_[i_]) } })((v_env));return(f_warn("Interpreter runtime error: variable '" + v_name + "' not found")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Var.f_eval;  // v8 bug workaround
  // method plain_name
  Var.f_plain_name = function () {
    var v_self = this;
    try { if ( f_bool(v_self.v_namespace) ) { (function () { throw(( f_string(v_self.v_sigil) + f_string(( f_string(v_self.v_namespace) + f_string(( f_string("::") + f_string(v_self.v_name) )) )) )); })() } else { (function () { null })() };throw(( f_string(v_self.v_sigil) + f_string(v_self.v_name) )) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Var.f_plain_name;  // v8 bug workaround
})();

// class Bind
if (typeof Bind != 'object') {
  Bind = function() {};
  Bind = new Bind;
  Bind.f_isa = function (s) { return s == 'Bind' };
  Bind.f_perl = function () { return '::Bind(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Bind;
  // accessor parameters
  Bind.v_parameters = null;
  Bind.f_parameters = function () { return this.v_parameters }
  // accessor arguments
  Bind.v_arguments = null;
  Bind.f_arguments = function () { return this.v_arguments }
  // method eval
  Bind.f_eval = function (v_env) {
    var v_self = this;
    try { var v_name;var v_value;if ( f_bool(f_isa(v_self.v_parameters, "Lit::Array")) ) { (function () { f_warn("Interpreter TODO: Bind"); })() } else { (function () { null })() };if ( f_bool(f_isa(v_self.v_parameters, "Lit::Hash")) ) { (function () { f_warn("Interpreter TODO: Bind"); })() } else { (function () { null })() };if ( f_bool(f_isa(v_self.v_parameters, "Lit::Object")) ) { (function () { f_warn("Interpreter TODO: Bind"); })() } else { (function () { null })() };if ( f_bool(f_isa(v_self.v_parameters, "Decl")) ) { (function () { v_self.v_parameters.f_eval(v_env); })() } else { (function () { null })() };(v_name = v_self.v_parameters.f_plain_name());(v_value = v_self.v_arguments.f_eval(v_env));(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_e) { if ( f_bool((v_e).hasOwnProperty(v_name)) ) { (function () { (v_e[v_name] = v_value);throw(v_value); })() } else { (function () { null })() } })(a_[i_]) } })((v_env));return(f_warn(( f_string("Interpreter Bind: variable '") + f_string(( f_string(v_name) + f_string("' not found") )) ))) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Bind.f_eval;  // v8 bug workaround
})();

// class Proto
if (typeof Proto != 'object') {
  Proto = function() {};
  Proto = new Proto;
  Proto.f_isa = function (s) { return s == 'Proto' };
  Proto.f_perl = function () { return '::Proto(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Proto;
  // accessor name
  Proto.v_name = null;
  Proto.f_name = function () { return this.v_name }
  // method eval
  Proto.f_eval = function (v_env) {
    var v_self = this;
    try { return((v_self.v_name).f_string()) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Proto.f_eval;  // v8 bug workaround
})();

// class Call
if (typeof Call != 'object') {
  Call = function() {};
  Call = new Call;
  Call.f_isa = function (s) { return s == 'Call' };
  Call.f_perl = function () { return '::Call(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Call;
  // accessor invocant
  Call.v_invocant = null;
  Call.f_invocant = function () { return this.v_invocant }
  // accessor hyper
  Call.v_hyper = null;
  Call.f_hyper = function () { return this.v_hyper }
  // accessor method
  Call.v_method = null;
  Call.f_method = function () { return this.v_method }
  // accessor arguments
  Call.v_arguments = null;
  Call.f_arguments = function () { return this.v_arguments }
  // method eval
  Call.f_eval = function (v_env) {
    var v_self = this;
    try { var v_invocant;f_warn("Interpreter TODO: Call");(v_invocant = v_self.v_invocant.f_eval(v_env));if ( f_bool((v_invocant == "self")) ) { (function () { (v_invocant = "$self"); })() } else { (function () { null })() };if ( f_bool(v_self.v_hyper) ) { (function () { null })() } else { (function () { null })() };return(f_warn("Interpreter runtime error: method '" + v_self.v_method + "()' not found")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Call.f_eval;  // v8 bug workaround
})();

// class Apply
if (typeof Apply != 'object') {
  Apply = function() {};
  Apply = new Apply;
  Apply.f_isa = function (s) { return s == 'Apply' };
  Apply.f_perl = function () { return '::Apply(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Apply;
  // accessor code
  Apply.v_code = null;
  Apply.f_code = function () { return this.v_code }
  // accessor arguments
  Apply.v_arguments = null;
  Apply.f_arguments = function () { return this.v_arguments }
  // accessor namespace
  Apply.v_namespace = null;
  Apply.f_namespace = function () { return this.v_namespace }
  // method eval
  Apply.f_eval = function (v_env) {
    var v_self = this;
    try { var v_ns;var v_code;(v_ns = "");if ( f_bool(v_self.v_namespace) ) { (function () { (v_ns = ( f_string(v_self.v_namespace) + f_string("::") )); })() } else { (function () { null })() };(v_code = ( f_string(v_ns) + f_string(v_self.v_code) ));(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_e) { if ( f_bool((v_e).hasOwnProperty(v_code)) ) { (function () { throw(v_e[v_code]).f_apply(v_env, v_self.v_arguments); })() } else { (function () { null })() } })(a_[i_]) } })((v_env));return(f_warn("Interpreter runtime error: subroutine '" + v_code + "()' not found")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Apply.f_eval;  // v8 bug workaround
})();

// class Return
if (typeof Return != 'object') {
  Return = function() {};
  Return = new Return;
  Return.f_isa = function (s) { return s == 'Return' };
  Return.f_perl = function () { return '::Return(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Return;
  // accessor result
  Return.v_result = null;
  Return.f_result = function () { return this.v_result }
  // method eval
  Return.f_eval = function (v_env) {
    var v_self = this;
    try { f_warn("Interpreter TODO: Return");throw(( f_string("return(") + f_string(( f_string(v_self.v_result.f_eval()) + f_string(")") )) )) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Return.f_eval;  // v8 bug workaround
})();

// class If
if (typeof If != 'object') {
  If = function() {};
  If = new If;
  If.f_isa = function (s) { return s == 'If' };
  If.f_perl = function () { return '::If(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = If;
  // accessor cond
  If.v_cond = null;
  If.f_cond = function () { return this.v_cond }
  // accessor body
  If.v_body = null;
  If.f_body = function () { return this.v_body }
  // accessor otherwise
  If.v_otherwise = null;
  If.f_otherwise = function () { return this.v_otherwise }
  // method eval
  If.f_eval = function (v_env) {
    var v_self = this;
    try { var v_cond;(v_cond = v_self.v_cond);if ( f_bool(( f_bool(f_isa(v_cond, "Apply")) && f_bool((v_cond.f_code() == "prefix:<!>")) )) ) { (function () { var v_if;(v_if = function () { var tmp = {v_cond: v_cond.f_arguments()[0],v_body: v_self.v_otherwise,v_otherwise: v_self.v_body,}; tmp.__proto__ = If; return tmp }());throw(v_if.f_eval(v_env)); })() } else { (function () { null })() };if ( f_bool(v_cond.f_eval(v_env)) ) { (function () { var v_env1;(v_env1 = (function () { var a = []; a.push({  }); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { v_stmt.f_eval(v_env1) })(a_[i_]) } })(v_self.v_body); })() } else { (function () { var v_env1;(v_env1 = (function () { var a = []; a.push({  }); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { v_stmt.f_eval(v_env1) })(a_[i_]) } })(v_self.v_otherwise); })() };throw(null) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  If.f_eval;  // v8 bug workaround
})();

// class For
if (typeof For != 'object') {
  For = function() {};
  For = new For;
  For.f_isa = function (s) { return s == 'For' };
  For.f_perl = function () { return '::For(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = For;
  // accessor cond
  For.v_cond = null;
  For.f_cond = function () { return this.v_cond }
  // accessor body
  For.v_body = null;
  For.f_body = function () { return this.v_body }
  // accessor topic
  For.v_topic = null;
  For.f_topic = function () { return this.v_topic }
  // method eval
  For.f_eval = function (v_env) {
    var v_self = this;
    try { var v_cond;var v_topic_name;var v_env1;(v_cond = v_self.v_cond);(v_topic_name = v_self.v_topic.f_plain_name());(v_env1 = (function () { var a = []; a.push({  }); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_topic) { (v_env1[0] = (function () { var a = []; a[v_topic_name] = v_topic;  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { v_stmt.f_eval(v_env1) })(a_[i_]) } })(v_self.v_body) })(a_[i_]) } })((v_cond.f_eval(v_env)));throw(null) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  For.f_eval;  // v8 bug workaround
})();

// class When
if (typeof When != 'object') {
  When = function() {};
  When = new When;
  When.f_isa = function (s) { return s == 'When' };
  When.f_perl = function () { return '::When(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = When;
  // accessor parameters
  When.v_parameters = null;
  When.f_parameters = function () { return this.v_parameters }
  // accessor body
  When.v_body = null;
  When.f_body = function () { return this.v_body }
  // method eval
  When.f_eval = function (v_env) {
    var v_self = this;
    try { return(f_die("TODO - When")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  When.f_eval;  // v8 bug workaround
})();

// class While
if (typeof While != 'object') {
  While = function() {};
  While = new While;
  While.f_isa = function (s) { return s == 'While' };
  While.f_perl = function () { return '::While(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = While;
  // accessor cond
  While.v_cond = null;
  While.f_cond = function () { return this.v_cond }
  // accessor body
  While.v_body = null;
  While.f_body = function () { return this.v_body }
  // method eval
  While.f_eval = function (v_env) {
    var v_self = this;
    try { return(f_die("TODO - While")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  While.f_eval;  // v8 bug workaround
})();

// class Leave
if (typeof Leave != 'object') {
  Leave = function() {};
  Leave = new Leave;
  Leave.f_isa = function (s) { return s == 'Leave' };
  Leave.f_perl = function () { return '::Leave(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Leave;
  // method eval
  Leave.f_eval = function (v_env) {
    var v_self = this;
    try { return(f_die("TODO - Leave")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Leave.f_eval;  // v8 bug workaround
})();

// class Decl
if (typeof Decl != 'object') {
  Decl = function() {};
  Decl = new Decl;
  Decl.f_isa = function (s) { return s == 'Decl' };
  Decl.f_perl = function () { return '::Decl(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Decl;
  // accessor decl
  Decl.v_decl = null;
  Decl.f_decl = function () { return this.v_decl }
  // accessor type
  Decl.v_type = null;
  Decl.f_type = function () { return this.v_type }
  // accessor var
  Decl.v_var = null;
  Decl.f_var = function () { return this.v_var }
  // method eval
  Decl.f_eval = function (v_env) {
    var v_self = this;
    try { var v_decl;var v_name;(v_decl = v_self.v_decl);(v_name = v_self.v_var.f_plain_name());if ( f_bool((v_decl == "has")) ) { (function () { f_warn("Interpreter TODO: has"); })() } else { (function () { null })() };if ( f_bool((v_env[0]).hasOwnProperty(v_name)) ) { (function () { null })() } else { (function () { (v_env[0][v_name] = null); })() };throw(null) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Decl.f_eval;  // v8 bug workaround
  // method plain_name
  Decl.f_plain_name = function () {
    var v_self = this;
    try { return(v_self.v_var.f_plain_name()) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Decl.f_plain_name;  // v8 bug workaround
})();

// class Sig
if (typeof Sig != 'object') {
  Sig = function() {};
  Sig = new Sig;
  Sig.f_isa = function (s) { return s == 'Sig' };
  Sig.f_perl = function () { return '::Sig(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Sig;
  // accessor invocant
  Sig.v_invocant = null;
  Sig.f_invocant = function () { return this.v_invocant }
  // accessor positional
  Sig.v_positional = null;
  Sig.f_positional = function () { return this.v_positional }
  // accessor named
  Sig.v_named = null;
  Sig.f_named = function () { return this.v_named }
  // method eval
  Sig.f_eval = function (v_env) {
    var v_self = this;
    try { return(f_warn("Interpreter TODO: Sig")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Sig.f_eval;  // v8 bug workaround
})();

// class Method
if (typeof Method != 'object') {
  Method = function() {};
  Method = new Method;
  Method.f_isa = function (s) { return s == 'Method' };
  Method.f_perl = function () { return '::Method(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Method;
  // accessor name
  Method.v_name = null;
  Method.f_name = function () { return this.v_name }
  // accessor sig
  Method.v_sig = null;
  Method.f_sig = function () { return this.v_sig }
  // accessor block
  Method.v_block = null;
  Method.f_block = function () { return this.v_block }
  // method eval
  Method.f_eval = function (v_env) {
    var v_self = this;
    try { var v_sig;var v_invocant;var v_pos;var v_str;f_warn("Interpreter TODO: Method");(v_sig = v_self.v_sig);(v_invocant = v_sig.f_invocant());(v_pos = v_sig.f_positional());return((v_str = "my $List__ = \\@_; ")) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Method.f_eval;  // v8 bug workaround
})();

// class Sub
if (typeof Sub != 'object') {
  Sub = function() {};
  Sub = new Sub;
  Sub.f_isa = function (s) { return s == 'Sub' };
  Sub.f_perl = function () { return '::Sub(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Sub;
  // accessor name
  Sub.v_name = null;
  Sub.f_name = function () { return this.v_name }
  // accessor sig
  Sub.v_sig = null;
  Sub.f_sig = function () { return this.v_sig }
  // accessor block
  Sub.v_block = null;
  Sub.f_block = function () { return this.v_block }
  // method eval
  Sub.f_eval = function (v_env) {
    var v_self = this;
    try { var List_param_name = [];
var v_sub;(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_field) { f_push(List_param_name, v_field.f_plain_name()) })(a_[i_]) } })((v_self.v_sig.f_positional()));(v_sub = function () { var tmp = {v_func: function (v_env, v_args) { try { var Hash_context = {};
var v_n;var v_env1;var v_r = null;
(v_n = 0);(Hash_context["@_"] = v_args);(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_name) { (Hash_context[v_name] = v_args[v_n].f_eval(v_env));(v_n = (v_n + 1)) })(a_[i_]) } })(List_param_name);(v_env1 = (function () { var a = []; a.push(Hash_context); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { (v_r = v_stmt.f_eval(v_env1)) })(a_[i_]) } })(v_self.v_block);throw(v_r) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } }  },}; tmp.__proto__ = EvalFunction; return tmp }());if ( f_bool(v_self.v_name) ) { (function () { (v_env[0][v_self.v_name] = v_sub); })() } else { (function () { null })() };throw(v_sub) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Sub.f_eval;  // v8 bug workaround
})();

// class Do
if (typeof Do != 'object') {
  Do = function() {};
  Do = new Do;
  Do.f_isa = function (s) { return s == 'Do' };
  Do.f_perl = function () { return '::Do(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Do;
  // accessor block
  Do.v_block = null;
  Do.f_block = function () { return this.v_block }
  // method eval
  Do.f_eval = function (v_env) {
    var v_self = this;
    try { var v_env1;(v_env1 = (function () { var a = []; a.push({  }); (function(a_) { for (var i_ = 0; i_ < a_.length ; i_++) { a.push(a_[i_]) }})((v_env));  return a })());(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { (function (v_stmt) { v_stmt.f_eval(v_env1) })(a_[i_]) } })(v_self.v_block) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Do.f_eval;  // v8 bug workaround
})();

// class Use
if (typeof Use != 'object') {
  Use = function() {};
  Use = new Use;
  Use.f_isa = function (s) { return s == 'Use' };
  Use.f_perl = function () { return '::Use(' + Main._dump(this) + ')' };
}
(function () {
  var v__NAMESPACE = Use;
  // accessor mod
  Use.v_mod = null;
  Use.f_mod = function () { return this.v_mod }
  // method eval
  Use.f_eval = function (v_env) {
    var v_self = this;
    try { f_warn("Interpreter TODO: Use");return(( f_string("use ") + f_string(v_self.v_mod) )) } catch(err) { if ( err instanceof Error ) { throw(err) } else { return(err) } } 
  }
  Use.f_eval;  // v8 bug workaround
})();
