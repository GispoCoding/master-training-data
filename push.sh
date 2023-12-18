echo "Enter your commit message: "
read commit_msg

git pull origin main
git add .
git commit -m "$commit_msg"
git push origin main