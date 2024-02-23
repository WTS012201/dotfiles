; inherits: c

(parameter_list
   "(" @opening
   ")" @closing) @container

(argument_list
   "(" @opening
   ")" @closing) @container

(parenthesized_expression
  "(" @opening
  ")" @closing) @container

(for_range_loop
  "(" @opening
  ")" @closing) @container

(condition_clause
  "(" @opening
  ")" @closing) @container

(compound_statement
  "{" @opening
  "}" @closing) @container

(initializer_list
  "{" @opening
  "}" @closing) @container

(field_declaration_list
   "{" @opening
   "}" @closing) @container

(template_parameter_list
  "<" @opening
  ">" @closing) @container

(initializer_list
  "{" @opening
  "}" @closing) @container

(template_argument_list
  "<" @opening
  ">" @closing) @container

(subscript_argument_list
  "[" @opening
  "]" @closing) @container

(array_declarator
  "[" @opening
  "]" @closing) @container

(lambda_capture_specifier
  "[" @opening
  "]" @closing) @container
