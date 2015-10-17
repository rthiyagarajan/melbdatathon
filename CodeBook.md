# Data Science Melbourne - Datathon October 17, 2015
 
## 1. Input files

### 1.1 Data set files 

The dataset files that made up the input included:
```
DSMDatathon_samplefile.txt	Sneak peak sample data file provided prior to datathon
				Sample of 24k transactions for 2.5k unique accounts

```

These files were distributed by Data Science Melbourne meetup group for the purposes of a datathon on October 17, 2015. This data is subject to NDA.

### 1.2 Data fields

```
"BET_ID"                   	
"BET_TRANS_ID"             	
"MATCH_BET_ID"              
"ACCOUNT_ID"               	Unique customer account identifier
"COUNTRY_OF_RESIDENCE_NAME"	Customer country of residence
"PARENT_EVENT_ID"          	Parent event (e.g. Cricket world cup)
"EVENT_ID"                  	Unique event identifier 
"MATCH"                    	Match name of the event (e.g. NZ v Sri Lanka)
"EVENT_NAME"                	Name (e.g. “Match Odds”)
"EVENT_DT"                 	Date/time of event GMT (Scheduled start of the event)
"OFF_DT"                    	Offer date (actual time the game started - in play)
"BID_TYP"                  	“B” or “L” Lay (sell) can bet against aus winning (scotland win or draw) which is traditional bookie view. Punters can make offers (gives market depth on both buy and sell side). Back or Lay
"STATUS_ID"                 	“S” good to go or “C” cancelled or “L” lapsed or “V” void game e.g. rained off
"PLACED_DATE"              	Date/time ‘punter’ placed bet
"TAKEN_DATE"                	Date/time ‘bookie’ took bet
"SETTLED_DATE"             	Date/time bet was settled (usually straight after event) “Market closes”
"CANCELLED_DATE"            	NULL if transaction was not cancelled, else date/time of cancellation, for exampled, might be cancelled if looking for unrealistic odds
"SELECTION_NAME"           	Team e.g. New Zealand
"PERSISTENCE_TYPE"          	Blank or “IP” in play will keep the trade alive forever
"BET_PRICE"                	Customer asked for price
"PRICE_TAKEN"               	Best price on matched bet
"INPLAY_BET"               	Boolean, TRUE if bet was placed during the event FALSE if prior
"BET_SIZE"                  	Dollar value (AUD currency) of bet, the stake
"PROFIT_LOSS" 			Customer profit_loss in $ (currency?) - Outcome
```

NB Betfar charges commission on winnings
NB Single bet would match bet_id with match_bet_id
NB A lapsed bet will not have a taken date or cancelled date, e.g. might be rubbish price, money is held by betfair 
NB Billions of calls to API - strategy is to match as many as possible
NB Margin is 5% but volume customers get discounted margin
The data files were downloaded on October 16, 2015.

## Notes

