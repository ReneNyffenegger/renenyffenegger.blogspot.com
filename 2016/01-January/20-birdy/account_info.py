import os
import sys
from birdy.twitter import UserClient

if len(sys.argv) < 2:
   print "specify screen name"
   sys.exit()

screen_name = sys.argv[1]

tw = UserClient(os.environ['TWITTER_CONSUMER_KEY'       ],
                os.environ['TWITTER_CONSUMER_SECRET'    ],
                os.environ['TWITTER_ACCESS_TOKEN'       ],
                os.environ['TWITTER_ACCESS_TOKEN_SECRET'])

r = tw.api.users.show.get(screen_name=screen_name)

profile_url=r.data['profile_background_image_url_https']

# for key, value in r.data.iteritems() :
#    print key

status_id=str(r.data['status']['id_str'])


print ""
print "Current Status"
print "  of " + r.data['status']['created_at']
print "  url=https://twiter.com/" + screen_name + "/status/" + status_id
print "------------------------------------------------------"
print r.data['status']['text']

print "--------------"
print ""
print "Name:        " +     r.data['name'           ]
print "Description: " +     r.data['description'    ]
print "Followers:   " + str(r.data['followers_count'])
print "Following:   " + str(r.data['friends_count'  ])
print "Tweets:      " + str(r.data['statuses_count' ])
print "Language:    " +     r.data['lang'           ]
