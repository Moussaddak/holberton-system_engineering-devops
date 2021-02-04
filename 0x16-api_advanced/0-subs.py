#!/usr/bin/python3
"""  How many subs?  """

import requests


def number_of_subscribers(subreddit):
    """
    :type subreddit: str
    :rtype: int
    """
    url = "https://www.reddit.com/r/%s/about.json" % subreddit
    user = {'user-agent': 'pc'}
    try:
        r = requests.get(url, headers=user, allow_redirects=False).json()
        return r.get('data').get('subscribers')
    except AttributeError:
        return 0
