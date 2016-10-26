# status-watcher :eyes:

## Introduction

This is a simple proof of concept that shows how to use the [`status`](https://developer.github.com/v3/activity/events/types/#statusevent) webhook event to verify updates made to a [commit's status](https://developer.github.com/v3/repos/statuses/) through the API are performed by authorized users.


## Set up and run server

```
# make sure we're in the right directory 
$ cd status-watcher
# install Ruby gems
$ bundle install
# set a token to use with the API
$ export GITHUB_TOKEN=7d9dj0[...]
# run the webhook listener
$ ruby server.rb
```

## Set up webhook

Enter the URL where we'll send webhook JSON payloads (make sure to append `/payload`):

![](https://cloud.githubusercontent.com/assets/3476612/14075162/a4526a8c-f48b-11e5-828e-967c22d4307b.png)

Make sure we're only receiving `status` events:

![](https://cloud.githubusercontent.com/assets/3476612/14075163/a452c39c-f48b-11e5-9c62-1f46f57c6843.png)
