feed_messages = [
 'Tabcorp grows Q1 revenue 2.7%',
 'Tatts fails to win Victorian monitoring license',
 'Tabcorp bets on Telstra in big telecom deal',
 'Tabcorp bets on Cloud, iPad on Melbourne Cup day',
 'Two Way adds fixed odds betting to TAB ACTIVE'
]

SHOW_SIZE = 3

pushed_feeds = []

SCHEDULER.every '10s' do
  pushed_feeds.push( feed_messages.sample )

  feeds_collection = pushed_feeds.last(SHOW_SIZE).map {|feed|
    {label: '-', value: feed}
  }

  send_event('feed', {items: feeds_collection})
end