BASE_PATH=YOUR_BASE_PATH_HERE

USER_NAME=YOUR_USER_NAME_HERE
GITLAB_PRIVATE_TOKEN=YOUR_TOKEN_HERE

read -p 'Please SET FOLDER_NAME variable: ' FOLDER_NAME

echo $FOLDER_NAME

cd $FOLDER_NAME

DIR=".git"
if [ -d "$DIR" ]; then
  echo ".git repo already existed, removing..."
  rm -rf .git
  echo "Removed."
fi

read -p 'Please SET project name variable: ' PROJECT_NAME

echo $PROJECT_NAME

echo "Creating projects path: https://$USER_NAME:$GITLAB_PRIVATE_TOKEN@${BASE_PATH}$PROJECT_NAME.git";


git init

git remote add origin https://$USER_NAME:$GITLAB_PRIVATE_TOKEN@${BASE_PATH}$PROJECT_NAME.git

git add .

git commit -m "init project"

git push -u origin  master

git checkout -b staging

git push origin staging

cd ../
