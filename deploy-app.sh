echo $HEROKU_API_KEY
echo $HEROKU_EMAIL
echo $APP_NAME

heroku login --api-key $HEROKU_API_KEY

git remote add heroku https://git.heroku.com/$APP_NAME.git
git push heroku HEAD:main --force

APP_URL=$(heroku apps:info -a $APP_NAME | grep 'Web URL' | awk '{print $NF}')

echo "----------------------------------------"
echo "🚀 Deployment URL is $APP_URL 🚀"
echo "----------------------------------------"