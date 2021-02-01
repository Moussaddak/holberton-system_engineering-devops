#!/usr/bin/python3
"""  Dictionary of list of dictionaries  """

import requests
from sys import argv
from json import dump

if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com'
    r = requests.get('{}/users/'.format(url)).json()
    Total_user = len(r)
    json_dict = {}
    for USER_ID in range(1, Total_user + 1):
        """ Extract Employee name """
        user = requests.get('{}/users/{}'.format(url, USER_ID)).json()
        USERNAME = user.get('username')
        """ Extract Employee Tasks """
        todos = requests.get('{}/todos?userId={}'.format(url, USER_ID)).json()
        data = []
        for Task in todos:
            TASK_COMPLETED_STATUS = Task.get("completed")
            TASK_TITLE = Task.get("title")
            data.append({"task": TASK_TITLE,
                         "completed": TASK_COMPLETED_STATUS,
                         "username": USERNAME})
        json_dict["{}".format(USER_ID)] = data
    with open("todo_all_employees.json", 'w') as f:
        dump(json_dict, f)
