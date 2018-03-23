#!/bin/bash

echo -e "Preparing to deploy updates to GitHub. \033[0;33mWARNING: Before pushing changes, make sure you tested locally using 'hugo server -D'. You can cancel this script with Ctrl+C.\033[0m"

# Flush old files before regenerating to ensure there are no stale files.
find ./public/* -not -name ".git" -not -name ".gitignore" -delete

# Build site content
hugo -t hugo-phlat-theme

# Commit site content to Github
cd public
read -p "Enter a message describing your changes to the site: " commitMessage
git commit -a -m "$commitMessage"
git push origin master
cd ..

echo -e "\033[0;32mContent changes push to Github (changes are now live).\033[0m"

read -p "Enter a message describing your developer changes: " commitMessage
git commit -a -m "$commitMessage"
git push origin master

echo -e "\033[0;32mBackend changes pushed to Github.\033[0m"

read -p "Press enter to finish."