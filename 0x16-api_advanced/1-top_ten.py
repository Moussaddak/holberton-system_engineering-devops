#!/usr/bin/python3
"""  Top Ten hot posts  """

import requests


def top_ten(subreddit):
    """
    :type subreddit: str
    :rtype: None
    """
    url = "https://www.reddit.com/r/%s/hot.json?limit=10" % subreddit
    user = {'user-agent': 'pc'}
    try:
        r = requests.get(url, headers=user, allow_redirects=False).json()
        data = r.get('data').get('children')
        for title in data:
            print(title.get('data').get('title'))
    except AttributeError:
        print(None)
