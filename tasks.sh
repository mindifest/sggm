#!/bin/sh
set -e

menu() {
  echo "======================"
  echo "   Project Task Menu  "
  echo "======================"
  echo "1) Start site (serve)"
  echo "2) Build site"
  echo "3) Build site (subdir /sggm)"
  echo "4) New post"
  echo "5) Send email"
  echo "6) Deploy site"
  echo "7) Clean site"
  echo "q) Quit"
  echo
  printf "Select an option: "
}

while true; do
  menu
  read -r choice
  case "$choice" in
    1) bundle exec jekyll clean && bundle exec jekyll serve --trace ;;
    2) bundle exec jekyll build ;;
    3) bundle exec jekyll build --baseurl="/sggm" ;;
    4) ruby bin/new_post.rb ;;
    5) ruby bin/send_email.rb ;;
    6) bash bin/deploy.sh ;;
    7) bundle exec jekyll clean ;;
    q|Q) echo "Goodbye!"; exit 0 ;;
    *) echo "Invalid choice." ;;
  esac
  echo
done
