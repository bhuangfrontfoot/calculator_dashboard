feed_response = [
  {label: 'Scratching', value: 'TAMWORTH (Racing) R1: 13 - Single Hope (Sub = 1)'},
  {label: 'Late Scratching', value: 'WARRNABMOOL (Racing) R3: 6 (L) - ABERFELDY'},
  {label: 'Late Scratching', value: 'WARRNABMOOL (Racing) R1: 7 (L) - SONDAICA'},
  {label: 'Late Mail', value: 'BG05 ALBION PARK: 12.JUSTABITCOCO'},
  {label: 'Late Mail', value: 'AG11 GAWLER : 7.ALHANNA'},
  {label: 'Info', value: 'Two Way adds fixed odds betting to TAB ACTIVE'}
  {label: 'JackPot', value: 'Jackpot information'}
]

SHOW_SIZE = 3

pushed_feeds = []

SCHEDULER.every '10s' do
  pushed_feeds.push( feed_response.sample )
  feeds_collection = pushed_feeds.last(SHOW_SIZE)

  send_event('feed', {items: feeds_collection})
end