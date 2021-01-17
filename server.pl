:- use_module(library(http/http_server)).
:- use_module(library(http/http_files)).
:- use_module(library(pengines)).
% :- use_module(library(http/http_unix_daemon)). % TODO uncomment when ready to deploy

:- http_handler(root(.), http_reply_from_files('dc/graphics/Metw/Wizards', []), [prefix]).
:- http_handler(js(.), http_reply_from_files('js', []), [prefix]).


s :-
    http_server([port(8000)]).

% is_true(Question) :-
%         pengine_input(Question, yes).
