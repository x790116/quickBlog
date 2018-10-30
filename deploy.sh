#deploy.sh
#!/bin/bash

#### Step1 : update public Folder ####
echo -e "\033[0;32mDeploying Public updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeploying Public updates to GitHub Done...\033[0m"

#### Step2 : update quickBlog Folder ####

# Come Back
cd ..

echo -e "\033[0;32mDeploying quickBlog updates to GitHub...\033[0m"

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeploying quickBlog updates to GitHub Done...\033[0m"

#### Step3 : update content/post Folder ####

# Come content/post
cd content/post

echo -e "\033[0;32mDeploying content/post updates to GitHub...\033[0m"

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeploying content/post updates to GitHub Done...\033[0m"

# Come Back post to content
cd ..

# Come Back content to quickBlog
cd ..