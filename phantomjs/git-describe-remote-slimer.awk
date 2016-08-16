#!awk -f
BEGIN {
  if (ARGC != 2) {
    print "git-describe-remote-slimer.awk https://github.com/laurentj/slimerjs"
    exit
  }
  FS = "[ /^]+"
  while ("git ls-remote --tags " ARGV[1] "| sort -Vk2 | grep -vE \"RELEASE_|SLIMERJS_\"" | getline) {
    if (!sha)
      sha = substr($0, 1, 7)
    tag = $3
  }
  while ("curl -s " ARGV[1] "/releases/tag/" tag | getline) {
    if ($3 ~ "commits")
      com = $2
    ## print $3
  }
  printf com ? "%s-%s-g%s\n" : "%s\n", tag, com, sha
}
# Source https://github.com/svnpenn/a/blob/ac63f1dd/misc/git-describe-remote.awk
