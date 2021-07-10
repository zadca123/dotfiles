# find 4chan thumbnails you've saved because you're retarded, and interactively remove them.
# find ~/Documents/memes -type f -regex '.*[0-9][0-9][0-9][0-9][0-9][0-9]s\.jpg$' -ok rm {} \;
find ~/Documents/memes -type f -regex '.*[0-9]{6}s\.jpg$' -ok rm {} \;
