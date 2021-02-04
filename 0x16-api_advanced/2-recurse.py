#!/usr/bin/python3
"""  Recurse it!  """

import requests


def recurse(subreddit, hot_list=[], count=0, after=None):
    """
    :param subreddit:
    :param hot_list:
    :param count:
    :param after:
    :return:
    """
    url = "https://www.reddit.com/r/%s/hot.json" % subreddit
    headers = {'user-agent': 'pc'}
    params = {"count": count, "after": after}
    try:
        r = requests.get(url, headers=headers, params=params,
                         allow_redirects=False).json()
        data = r.get('data').get('children')
        after = r.get('after')
        count += r.get('dist')
        for title in data:
            hot_list.append(title.get('data').get('title'))
        if after:
            recurse(subreddit, hot_list, count, after)
        return hot_list
    except AttributeError:
        return None
