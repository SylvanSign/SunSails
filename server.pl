:- use_module(library(http/http_server)).
:- use_module(library(http/http_files)).
:- use_module(library(pengines)).

% START TODO clean this up when ready to start deploying
% :- use_module(library(http/http_unix_daemon)).
start :-
    http_server([port(8000)]).
% END TODO

:- http_handler(root(.), http_reply_from_files('dc/graphics/Metw/Wizards', []), [prefix]).
:- http_handler(root('index.html'), http_reply_file('index.html', []), []).
:- http_handler(js(.), http_reply_from_files('js', []), [prefix]).

% is_true(Question) :-
%         pengine_input(Question, yes).
