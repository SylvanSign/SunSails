:- use_module(library(http/json)).

convert(Functor, InName, OutName) :-
  open(InName, read, InStream),
  open(OutName, write, OutStream),
  json_read_dict(InStream, JsonList, [value_string_as(atom), default_tag(Functor)]),
  format(OutStream, ':- module(~as, [~a/1]).~n~n', [Functor, Functor]),
  maplist(run(Functor, OutStream), JsonList),
  close(InStream),
  close(OutStream).

run(Functor, OutStream, Dict) :-
  Term =.. [Functor, Dict],
  writeq(OutStream, Term),
  writeln(OutStream, .).
