:- use_module(library(http/http_server)).
:- use_module(library(http/http_files)).
:- use_module(library(pengines)).
:- use_module(knowledge/cards).

% START TODO clean this up when ready to start deploying
% :- use_module(library(http/http_unix_daemon)).
start :-
    http_server([port(8000)]).
% END TODO

:- http_handler(root(.), http_reply_from_files('dc/graphics/Metw', []), [prefix]).
:- http_handler(root(.), http_reply_file('index.html', []), []).
:- http_handler(root('favicon.ico'), http_reply_file('favicon.ico', []), []).
:- http_handler(js(.), http_reply_from_files('js', []), [prefix]).
