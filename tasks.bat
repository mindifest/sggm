@echo off
:menu
echo ======================
echo    Project Task Menu
echo ======================
echo 1^) Start site (serve)
echo 2^) Build site
echo 3^) Build site (subdir /sggm)
echo 4^) New post
echo 5^) Send email
echo 6^) Deploy site
echo 7^) Clean site
echo q^) Quit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" (
  call bundle exec jekyll clean
  call bundle exec jekyll serve --trace
  goto :menu
)
if "%choice%"=="2" (
  call bundle exec jekyll build
  goto :menu
)
if "%choice%"=="3" (
  call bundle exec jekyll build --baseurl="/sggm"
  goto :menu
)
if "%choice%"=="4" (
  call ruby bin/new_post.rb
  goto :menu
)
if "%choice%"=="5" (
  call ruby bin/send_email.rb
  goto :menu
)
if "%choice%"=="6" (
  call bash bin/deploy.sh
  goto :menu
)
if "%choice%"=="7" (
  call bundle exec jekyll clean
  goto :menu
)
if /I "%choice%"=="q" (
  echo Goodbye!
  exit /b
)

echo Invalid choice.
goto :menu
