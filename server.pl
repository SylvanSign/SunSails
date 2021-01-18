:- use_module(library(http/http_server)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_unix_daemon)).
:- use_module(library(pengines)).

:- use_module(knowledge/cards).

:- http_handler(root(.), http_reply_from_files('dc/graphics/Metw', []), [prefix]).
:- http_handler(root(.), http_reply_file('index.html', []), []).
:- http_handler(root('favicon.ico'), http_reply_file('favicon.ico', []), []).
:- http_handler(js(.), http_reply_from_files('js', []), [prefix]).
