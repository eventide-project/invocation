#include <mruby.h>
#include <mruby/hash.h>
#include <mruby/variable.h>

// debug
#include <mruby/string.h>

#define INVOCATION (mrb_class_get(mrb, "Invocation"))
#define INVOCATION_BINDING (mrb_class_get_under(mrb, INVOCATION, "Binding"))

static mrb_value
mrb_invocation_binding_receiver(mrb_state* mrb, mrb_value self) {
  return mrb_iv_get(mrb, self, mrb_intern_lit(mrb, "receiver"));
}

static mrb_value
mrb_invocation_binding_local_variable_get(mrb_state* mrb, mrb_value self) {
  mrb_value local_variables;
  mrb_sym variable_name;

  mrb_get_args(mrb, "n", &variable_name);

  local_variables = mrb_iv_get(mrb, self, mrb_intern_lit(mrb, "local_variable_data"));

  return mrb_hash_get(mrb, local_variables, mrb_symbol_value(variable_name));
}

static mrb_value
mrb_invocation_binding_method_name(mrb_state* mrb, mrb_value self) {
  return mrb_iv_get(mrb, self, mrb_intern_lit(mrb, "method_name"));
}

static mrb_value
mrb_invocation_binding_eval__method_only(mrb_state* mrb, mrb_value self) {
  mrb_value str;

  mrb_get_args(mrb, "S", &str);

  return mrb_invocation_binding_method_name(mrb, self);
}

static mrb_value
mrb_invocation_binding_get(mrb_state* mrb, mrb_value self) {
  mrb_value binding;
  mrb_value local_variables;

  binding = mrb_obj_new(mrb, INVOCATION_BINDING, 0, NULL);

  mrb_iv_set(mrb, binding, mrb_intern_lit(mrb, "receiver"), mrb_str_new_cstr(mrb, "some-receiver"));
  mrb_iv_set(mrb, binding, mrb_intern_lit(mrb, "method_name"), mrb_symbol_value(mrb_intern_cstr(mrb, "some_method")));

  local_variables = mrb_hash_new_capa(mrb, 111);
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "req")), mrb_str_new_cstr(mrb, "req not set"));
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "opt")), mrb_str_new_cstr(mrb, "opt not set"));
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "rest")), mrb_str_new_cstr(mrb, "rest not set"));
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "keyreq")), mrb_str_new_cstr(mrb, "keyreq not set"));
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "key")), mrb_str_new_cstr(mrb, "key not set"));
  mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "keyrest")), mrb_str_new_cstr(mrb, "keyrest not set"));
  //mrb_hash_set(mrb, local_variables, mrb_symbol_value(mrb_intern_cstr(mrb, "block")), mrb_str_new_cstr(mrb, "some-block"));
  mrb_iv_set(mrb, binding, mrb_intern_lit(mrb, "local_variable_data"), local_variables);

  return binding;
}

void
mrb_evt_invocation_gem_init(mrb_state* mrb) {
  struct RClass* invocation_class;
  struct RClass* invocation_binding_class;

  invocation_class = mrb_define_class(mrb, "Invocation", mrb->object_class);

  invocation_binding_class = mrb_define_class_under(mrb, invocation_class, "Binding", mrb->object_class);
  mrb_define_method(mrb, invocation_binding_class, "method_name", mrb_invocation_binding_method_name, MRB_ARGS_NONE());
  mrb_define_method(mrb, invocation_binding_class, "eval", mrb_invocation_binding_eval__method_only, MRB_ARGS_REQ(1));
  //mrb_define_method(mrb, invocation_binding_class, "local_variable_defined?", mrb_invocation_binding_local_variable_defined, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, invocation_binding_class, "local_variable_get", mrb_invocation_binding_local_variable_get, MRB_ARGS_REQ(1));
  //mrb_define_method(mrb, invocation_binding_class, "local_variable_set", mrb_invocation_binding_local_variable_set, MRB_ARGS_REQ(2));
  //mrb_define_method(mrb, invocation_binding_class, "local_variables", mrb_invocation_binding_local_variables, MRB_ARGS_NONE());
  mrb_define_method(mrb, invocation_binding_class, "receiver", mrb_invocation_binding_receiver, MRB_ARGS_NONE());
  //mrb_define_method(mrb, invocation_binding_class, "source_location", mrb_invocation_binding_source_location, MRB_ARGS_NONE());

  mrb_define_class_method(mrb, invocation_binding_class, "get", mrb_invocation_binding_get, MRB_ARGS_NONE());

  return;
}

void
mrb_evt_invocation_gem_final(mrb_state* mrb) {
  return;
}
