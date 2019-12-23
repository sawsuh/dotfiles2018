commit_msg="$*"
git -C ~/.dots add .
git -C ~/.dots commit -m "$commit_msg"
git -C ~/.dots push
