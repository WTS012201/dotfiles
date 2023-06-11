; inherits: typescript


(type_parameters
  "<" @opening
  ">" @closing) @container

(type_arguments
  "<" @opening
  ">" @closing) @container

(template_substitution
  "${" @opening
  "}"  @closing) @container

(object
  "{" @opening
  "}" @closing) @container

(statement_block
  "{" @opening
  "}" @closing) @container

(class_body
  "{" @opening
  "}" @closing) @container

(arguments
  "(" @opening
  ")" @closing) @container

(formal_parameters
  "(" @opening
  ")" @closing) @container

(parenthesized_expression
  "(" @opening
  ")" @closing) @container

(subscript_expression
  "[" @opening
  "]" @closing) @container

(named_imports
  "{" @opening
  "}" @closing) @container

(export_clause
  "{" @opening
  "}" @closing) @container

(object_pattern
  "{" @opening
  "}" @closing) @container

(array
  "[" @opening
  "]" @closing) @container

(array_pattern
  "[" @opening
  "]" @closing) @container

(array_type
  "[" @opening
  "]" @closing) @container

(object_type
  "{" @opening
  "}" @closing) @container
