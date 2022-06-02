contributor=$(git log --format='%aN' \
    | sort -u \
    | pick)

echo ""
echo "========================================================="
echo "${contributor}"
git log --author="${contributor}" --pretty=tformat: --numstat \
    | grep -v "migrations" \
    | grep -v "__snapshots__" \
    | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
echo "========================================================="
echo ""

git --no-pager log --reverse --author="${contributor}" --pretty=format:"%Cblue%cd%Creset %Cred%cn%Creset %s" --numstat --date=format:'%d %h [%H:%M]'
