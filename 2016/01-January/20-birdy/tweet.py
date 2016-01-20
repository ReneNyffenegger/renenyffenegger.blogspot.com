import os
import sys
from birdy.twitter import UserClient

if len(sys.argv) < 2:
   print "specify text to tweet"
   sys.exit()

tweet_text = sys.argv[1]

tw = UserClient(os.environ['TWITTER_CONSUMER_KEY'       ],
                os.environ['TWITTER_CONSUMER_SECRET'    ],
                os.environ['TWITTER_ACCESS_TOKEN'       ],
                os.environ['TWITTER_ACCESS_TOKEN_SECRET'])

tw.api.statuses.update.post(status = tweet_text)
