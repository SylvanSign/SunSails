run:
	swipl server.pl --port=8000 --interactive

build: cardnum dc knowledge/cards.pl knowledge/sets.pl knowledge/bans.pl

.PHONY: pull
pull:
	cd cardnum && git pull
	cd dc && git pull

knowledge/cards.pl: cardnum/fdata/cards-dc.json
	swipl \
		-g "convert(card, 'cardnum/fdata/cards-dc.json', 'knowledge/cards.pl'), halt" \
		json_list_to_prolog_facts.pl

knowledge/sets.pl: cardnum/fdata/sets-dc.json

	swipl \
		-g "convert(set, 'cardnum/fdata/sets-dc.json', 'knowledge/sets.pl'), halt" \
		json_list_to_prolog_facts.pl

knowledge/bans.pl: cardnum/fdata/bans-dc.json
	swipl \
		-g "convert(ban, 'cardnum/fdata/bans-dc.json', 'knowledge/bans.pl'), halt" \
		json_list_to_prolog_facts.pl

cardnum:
	git clone https://github.com/rezwits/cardnum.git

dc:
	git clone https://github.com/vastorper/dc.git
